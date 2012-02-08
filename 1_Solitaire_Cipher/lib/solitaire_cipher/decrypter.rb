module SolitaireCipher
  class Decrypter
    def initialize(output)
      @output = output
    end

    def decrypt(secret)
      keystream = generate_keystream(secret)
    end

    def generate_keystream(secret)
      "DWJXH YRFDG TMSHP UURXJ"
    end

    def to_numbers(message)
      message.tr(' ','')
             .each_byte.map{ |byte| byte - 64 }
    end

    def subtract(secret_num, keystream_num)
      secret_num.zip(keystream_num).map do |secret, keystream|
        secret = secret + 26 if keystream > secret
        secret - keystream
      end
    end
  end
end
