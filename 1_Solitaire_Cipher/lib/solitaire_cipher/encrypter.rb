module SolitaireCipher
  class Encrypter
    def initialize(output)
      @output = output
      @deck = Deck.new
    end

    def encrypt(message)

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

    def subtract(msg_num, keystream_num)
      msg_num.zip(keystream_num).map do |msg, keystream|
        msg = msg + 26 if keystream >= msg
        msg - keystream
      end
    end
  end
end
