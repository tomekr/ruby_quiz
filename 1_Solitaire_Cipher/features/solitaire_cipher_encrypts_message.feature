Feature: solitaire-cipher decrypts a message
  As a solitaire-cipher
  I want to encrypt a message
  So that I can secretely pass it along to another person

  Scenario: encrypt "Code in Ruby, live longer!"
    Given a decrypted message "Code in Ruby, live longer!"
    When I encrypt the message
    Then I should see "GLNCQ MJAFF FVOMB JIYCB"

