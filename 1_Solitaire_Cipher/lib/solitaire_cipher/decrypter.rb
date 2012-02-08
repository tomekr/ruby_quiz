module SolitaireCipher
  class Decrypter
    def initialize(output)
      @output = output
    end

    def decrypt(secret)
      keystream = generate_keystream(secret)
    end

    def generate_keystream(secret)

    end
  end
end
