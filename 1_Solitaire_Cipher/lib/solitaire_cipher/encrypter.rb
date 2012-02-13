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
  end
end
