Feature: BBC Login

  Scenario: Inputting incorrect username credentials shows an error
    Given I access the BBC login page
    And I input incorrect username details
    And I input incorrect password details
    When I click the sign in button
    Then I receive an error for not finding the account

  Scenario: Inputting a password less than 8 characters shows an error
    Given I access the BBC login page
    And I input any username details
    And I input a incorrect password as 1234abc
    When I click the sign in button
    Then I receive an error stating it needs to be at least 8 chars

  Scenario: Inputting a password with the wrong format shows an error
    Given I access the BBC login page
    And I input any username details
    And I input a password with the only letters
    When I click the sign in button
    Then I recieve an error stating it needs to be in the correct format

  Scenario: Inputting incorrect password for valid username
    Given I access the BBC login page
    And I input an existing username
    And I input an incorrect valid password
    When I click the sign in button
    Then I receive an error stating the password-username combination is wrong
