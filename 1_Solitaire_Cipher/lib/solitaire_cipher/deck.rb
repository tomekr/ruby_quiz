module SolitaireCipher
  class Deck
    def initialize
      @deck = Array(1..52) + ["A","B"]
    end

    def to_a
      @deck
    end


    def move_A
      move_down( @deck.index('A') )
      @deck
    end

    def move_B
      2.times{ move_down( @deck.index('B') ) }
      @deck
    end

    # Moves the index one place down while treating the used array
    # as circular list.
    def move_down(index)
      if index == @deck.length - 1
        @deck[1..1] = @deck[index], @deck[1]
        @deck.pop
      else
        @deck[index], @deck[index + 1] = @deck[index + 1], @deck[index]
      end
    end

    def triple_cut
      a_index = @deck.index("A")
      b_index = @deck.index("B")

      if b_index < a_index
        top_cut = @deck[0..(b_index-1)]
        middle = @deck[b_index..a_index]
        bottom_cut = @deck[(a_index+1)..(@deck.length-1)]
      else
        top_cut = @deck.slice(0, a_index)
        middle = @deck[a_index..b_index]
        bottom_cut = @deck[(b_index+1)..(@deck.length-1)]
      end

      @deck = bottom_cut + middle + top_cut
    end

    def count_cut
      count = @deck.pop
      top_cut = @deck[0..count-1]
      @deck = @deck[count..@deck.length] + top_cut + Array(count)
    end

    def output_letter
      a = @deck.first
      a = 53 if a.instance_of? String
      output = @deck[a]
      if output.instance_of? String
        nil
      else
        output -= 26 if output > 26
        (output + 64).chr
      end
    end

    def generate_keystream(length)
      keystream = []
      while length > 0
        move_A
        move_B
        triple_cut
        count_cut
        if (out = output_letter)
          keystream << out
          length -= 1
        end
      end
      keystream.join
    end
  end
end
