module SolitaireCipher
  class Message
    def initialize(message)
      @message = message
    end

    def no_space
      @message.tr(' ', '')
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

    def to_padded_alpha(message)
      conversion = message.gsub(/[^[:alnum:]]/, '')
                          .upcase
                          .split('')
                          .each_slice(5).map{|slice| slice.join }
                          .join(' ')

      conversion.concat('X') while conversion.tr(' ','').length % 5 != 0
      Message.new(conversion)
    end
  end
end
