module SolitaireCipher
  class Decrypter
    def initialize(output)
      @output = output
      @deck = Deck.new
    end

    def decrypt(secret)
      keystream = generate_keystream(secret)
      msg_numbers = subtract(to_numbers(secret), to_numbers(keystream))
      @output.puts to_alpha(msg_numbers)
    end

    def generate_keystream(secret)
      @deck.generate_keystream(secret.split(' ').join('').length)
    end

    def to_numbers(message)
      message.tr(' ','')
             .each_byte.map{ |byte| byte - 64 }
    end

    def subtract(secret_num, keystream_num)
      secret_num.zip(keystream_num).map do |secret, keystream|
        secret = secret + 26 if keystream >= secret
        secret - keystream
      end
    end

    def to_alpha(numbers)
      numbers.map { |number| (number + 64).chr }
             .each_slice(5)
             .map {|arr| arr.join}
             .join(' ')
    end
  end
end
