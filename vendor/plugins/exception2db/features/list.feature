Feature: Exception2db List
  In order to view captured exceptions
  As an authenticated user
  I want to see exceptions list

  Scenario: Exception2db List
    Given an exception2db exists
    When I go to the list of exception2dbs
    Then I should see "exception2db"


