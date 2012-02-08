require 'spec_helper'

module SolitaireCipher
  describe Decrypter do
    let(:output) { double('output').as_null_object }
    let(:decrypter) { Decrypter.new(output) }

    it "generates a keystream" do
      message = "GLNCQ MJAFF FVOMB JIYCB"
      decrypter.generate_keystream(message).should == "DWJXH YRFDG TMSHP UURXJ"
    end
  end
end
