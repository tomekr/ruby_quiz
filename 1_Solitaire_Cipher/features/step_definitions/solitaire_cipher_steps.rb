class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^an encrypted message "([^"]*)"$/ do |secret|
  @secret = secret
end

When /^I decrypt the message$/ do
  @decrypter = SolitaireCipher::Decrypter.new(output)
  @decrypter.decrypt(@message)
end

Then /^I should see "([^"]*)"$/ do |text|
  output.messages.should include(text)
end
