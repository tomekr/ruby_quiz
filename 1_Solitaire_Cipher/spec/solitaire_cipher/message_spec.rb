require 'spec_helper'

module SolitaireCipher
  describe Message do
    let(:message) { Message.new("Code in Ruby, live longer!") }

    it "sanitizes meessage without padding" do
      message.sanitize.should == "CODEI NRUBY LIVEL ONGER"
    end

    it "sanitizes meessage with padding" do
      message = Message.new("Code in Ruby, live long!")
      message.sanitize.should == "CODEI NRUBY LIVEL ONGXX"
    end
  end
end
