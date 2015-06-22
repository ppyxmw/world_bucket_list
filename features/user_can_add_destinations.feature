Feature: User can add destinations
  As a User
  I want to add Destinations
  So that I can assign my Bucket List entries

  Scenario: Succesfully adding Destinations
    Given I am signed in
    When I add destinations
    Then destinations appear in alphabetical order on the traveller's profile

