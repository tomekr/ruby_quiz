require 'spec_helper'

module SolitaireCipher
  describe Encrypter do
    let(:output) { double('output').as_null_object }
    let(:encrypter) { Encrypter.new(output) }
    let(:message) { "Code in Ruby, live longer!" }
    let(:conversion) { encrypter.convert_to_padded_alpha(message) }
    let(:keystream) { keystream = encrypter.generate_keystream(conversion) }

    it "converts message to upcased, alpha, 5 character groups" do
      conversion.should == "CODEI NRUBY LIVEL ONGER"
    end

    it "converts message to upcased, alpha, 5 character groups with pads" do
      pad_message = "Code in Ruby, live long!"
      conversion = encrypter.convert_to_padded_alpha(pad_message)
      conversion.should == "CODEI NRUBY LIVEL ONGXX"
    end

    it "generates a keystream for GLNCQ MJAFF FVOMB JIYCB" do
      keystream.should == "DWJXH YRFDG TMSHP UURXJ"
    end

    it "converts a message into numbers" do
      numbers = encrypter.to_numbers(conversion) 
      numbers.should == [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12,
        15, 14, 7, 5, 18]
    end

    it "converts number representation of message to alpha" do
      numbers = [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12, 15, 14,
                 7, 5, 18]
      encrypter.to_alpha(numbers).should == "CODEI NRUBY LIVEL ONGER"
    end

    it "subtracts keystream numbers from message numbers" do
      msg_numbers = encrypter.to_numbers(conversion)
      keystream_numbers = encrypter.to_numbers(keystream) 
      message_numbers = encrypter.subtract(msg_numbers, keystream_numbers)
      message_numbers.should == [25, 18, 20, 7, 1, 15, 26, 15, 24, 18, 18, 22,
        3, 23, 22, 20, 19, 15, 7, 8]
    end
  end
end
