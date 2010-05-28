Feature: Exception2db List
  In order to view captured exceptions
  As an authenticated user
  I want to see exceptions list

  Scenario: Exception2db List
    Given an exception2db exists
    When I go to the list of exception2dbs
    Then I should see "RuntimeError: 46" within "#container h2 a"
    Then I should see "Powered by exception2db" within "#footer a"
    Then I should see "Report bug" within "#footer a"


