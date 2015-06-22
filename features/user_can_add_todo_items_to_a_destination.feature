Feature: A user can add todo items to a destination
  As a User
  I want to add ToDo entries
  So I can organise my life

  Scenario: Succesfully adding todo items
    Given I am signed in
    When I add destinations
    Then I can add todo items
