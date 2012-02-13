require 'spec_helper'

module SolitaireCipher
  describe Encrypter do
    let(:output) { double('output').as_null_object }
    let(:encrypter) { Encrypter.new(output) }

    it "converts message to upcased, alpha, 5 character groups" do
      message = "Code in Ruby, live longer!"
      conversion = encrypter.convert_to_padded_alpha(message)
      conversion.should == "CODEI NRUBY LIVEL ONGER"
    end

    it "converts message to upcased, alpha, 5 character groups with pads" do
      message = "Code in Ruby, live long!"
      conversion = encrypter.convert_to_padded_alpha(message)
      conversion.should == "CODEI NRUBY LIVEL ONGXX"
    end

  end
end
