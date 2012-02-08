Feature: solitaire-cipher decrypts a message
  As a solitaire-cipher
  I want to decrypt a message
  So that I can read the secret messsage

  Scenario: decrypt CLEPK HHNIY CFPWH FDFEH
    Given an encrypted message "CLEPK HHNIY CFPWH FDFEH"
    When I decrypt the message
    Then I should see "YOURC IPHER ISWOR KINGX"

  Scenario: decrypt ABVAW LWZSY OORYK DUPVH
    Given an encrypted message "ABVAW LWZSY OORYK DUPVH"
    When I decrypt the message
    Then I should see "WELCO METOR UBYQU IZXXX"
