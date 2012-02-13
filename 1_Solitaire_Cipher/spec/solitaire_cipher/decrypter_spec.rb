require 'spec_helper'

module SolitaireCipher
  describe Decrypter do
    let(:output) { double('output').as_null_object }
    let(:decrypter) { Decrypter.new(output) }
    let(:secret) {"GLNCQ MJAFF FVOMB JIYCB" }
    let(:keystream) { decrypter.generate_keystream(secret) }

    it "generates a keystream" do
      keystream.should == "DWJXH YRFDG TMSHP UURXJ"
    end

    it "generates a keystream for GLNCQ MJAFF FVOMB JIYCB" do
      keystream.should == "DWJXH YRFDG TMSHP UURXJ"
    end

    it "converts a secret into numbers" do
      numbers = decrypter.to_numbers(secret) 
      numbers.should == [7, 12, 14, 3, 17, 13, 10, 1, 6, 6, 6, 22, 15, 13, 2,
                         10, 9, 25, 3, 2]
    end

    it "subtracts keystream numbers from secret numbers" do
      secret_numbers = decrypter.to_numbers(secret)
      keystream_numbers = decrypter.to_numbers(keystream) 
      message_numbers = decrypter.subtract(secret_numbers, keystream_numbers)
      message_numbers.should == [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22,
                                 5, 12, 15, 14, 7, 5, 18]
    end

    it "converts number representation of message to alpha" do
      numbers = [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12, 15, 14,
                 7, 5, 18]
      decrypter.to_alpha(numbers).should == "CODEI NRUBY LIVEL ONGER"
    end
  end
end
