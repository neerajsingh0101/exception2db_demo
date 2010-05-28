Feature: Exception2db List
  In order to view captured exceptions
  As an authenticated user
  I want to see exceptions list

  Scenario: Exception2db List
    Given an exception2db exists
    When I go to the list of exception2dbs
    Then I should see "RuntimeError: 46" within "#container h2 a"
    Then I should see a link with text "Powered by exception2db" within "#footer" with url "http://github.com/neerajdotname/exception2db"
    Then I should see a link with text "Report bug" within "#footer" with url "http://github.com/neerajdotname/exception2db/issues"


