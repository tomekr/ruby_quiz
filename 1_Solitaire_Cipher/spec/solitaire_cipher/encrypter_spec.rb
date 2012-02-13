require 'spec_helper'

module SolitaireCipher
  describe Encrypter do
    let(:output) { double('output').as_null_object }
    let(:encrypter) { Encrypter.new(output) }
    let(:message) { "Code in Ruby, live longer!" }
    let(:conversion) { encrypter.convert_to_padded_alpha(message) }

    it "converts message to upcased, alpha, 5 character groups" do
      conversion.should == "CODEI NRUBY LIVEL ONGER"
    end

    it "converts message to upcased, alpha, 5 character groups with pads" do
      pad_message = "Code in Ruby, live long!"
      conversion = encrypter.convert_to_padded_alpha(pad_message)
      conversion.should == "CODEI NRUBY LIVEL ONGXX"
    end

    it "generates a keystream for GLNCQ MJAFF FVOMB JIYCB" do
      keystream = encrypter.generate_keystream(conversion)
      keystream.should == "DWJXH YRFDG TMSHP UURXJ"
    end

    it "converts a message into numbers" do
      numbers = encrypter.to_numbers(conversion) 
      numbers.should == [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12,
        15, 14, 7, 5, 18]
    end

  end
end
