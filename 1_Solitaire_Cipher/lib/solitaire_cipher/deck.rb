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

      if b_index < a_index
        top_cut = @deck.slice!(0,b_index)
        bottom_cut = @deck.slice!(a_index, @deck.length)
      end

      @deck = bottom_cut + @deck + top_cut
    end
  end
end
