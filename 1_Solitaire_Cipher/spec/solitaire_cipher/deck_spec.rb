require 'spec_helper'

module SolitaireCipher
  describe Deck do
    let(:deck) { Deck.new }

    it "creates an unkeyed deck" do
      deck.to_a.should == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
        16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,
        34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
        52, "A", "B"]
    end

    it "moves A joker down one card" do
      deck.move_A.should == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
        13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
        49, 50, 51, 52, "B", "A"]
    end

    it "moves B joker down two cards" do
      deck.move_B.should == [1, 2, "B", 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
        13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
        49, 50, 51, 52, "A"]
    end

    it "triple cuts around the 2 jokers" do
      d = deck
      d.move_A
      d.move_B
      d.triple_cut.should == ["B"] + Array(2..52) + ["A", 1]
    end

    it "count_cuts the deck" do
      d = deck
      d.move_A
      d.move_B
      d.triple_cut
      d.count_cut.should == Array(2..52) + ["A", "B", 1]
    end

    it "finds the first output letter of an unkeyed deck" do
      d = deck
      d.move_A
      d.move_B
      d.triple_cut
      d.count_cut
      d.output_letter.should == "D"
    end

    it "finds the first ten output letters of an unkeyed deck" do
      deck.generate_keystream(10).should == "DWJXH YRFDG"
    end
  end
end
