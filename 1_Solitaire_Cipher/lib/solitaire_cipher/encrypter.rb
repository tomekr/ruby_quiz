module SolitaireCipher
  class Encrypter
    def initialize(output)
      @output = output
      @deck = Deck.new
    end

    def encrypt(message)
      conversion = convert_to_padded_alpha(message)
      keystream = generate_keystream(conversion)
      msg_numbers = add(to_numbers(conversion), to_numbers(keystream))
      @output.puts to_alpha(msg_numbers)
    end

    def convert_to_padded_alpha(message)
      conversion = message.gsub(/[^[:alnum:]]/, '')
                          .upcase
                          .split('')
                          .each_slice(5).map{|slice| slice.join }
                          .join(' ')

      conversion.concat('X') while conversion.tr(' ','').length % 5 != 0
      conversion
    end

    def generate_keystream(message)
      @deck.generate_keystream(message.tr(' ','').length)
    end

    def to_numbers(message)
      message.tr(' ','')
             .each_byte.map{ |byte| byte - 64 }
    end

    def to_alpha(numbers)
      numbers.map { |number| (number + 64).chr }
             .each_slice(5)
             .map {|arr| arr.join}
             .join(' ')
    end

    def add(msg_num, keystream_num)
      msg_num.zip(keystream_num).map do |msg, keystream|
        out = msg + keystream
        out -= 26 if out > 26
        out
      end
    end
  end
end
