module SolitaireCipher
  class Message
    def initialize(message)
      @message = message
    end

    def sanitize
      @message = remove_non_alpha.upcase
      @message = split_and_pad
    end

    def remove_non_alpha
      @message.split('')
              .select { |char| char =~ /[[:alpha:]]/ }
              .join
    end

    def split_and_pad
      @message << "X" while @message.length % 5 != 0
      @message.scan(/.{5}/).join(' ')
    end
  end
end
