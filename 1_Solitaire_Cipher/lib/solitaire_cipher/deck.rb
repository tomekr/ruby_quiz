module SolitaireCipher
  class Deck
    def initialize
      @deck = Array(1..52) + ["A","B"]
    end

    def to_a
      @deck
    end

    def shift_down(card, spaces)
      spaces.times do
        index = @deck.index(card)
        if index == 53
          @deck.rotate!(-1)
          index = 0
        end
        temp = @deck[index]
        @deck[index] = @deck[index+1]
        @deck[index+1] = temp
      end
      @deck
    end

    def triple_cut
      a_index = @deck.index("A")
      b_index = @deck.index("B")

    end
  end
end
