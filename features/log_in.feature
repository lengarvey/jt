Feature: Log in and security 
  In order to edit my job history
  As a user
  I want to log in to the website

Background:
  Given I have an existing account

  Scenario: Log in
    Given I am on the homepage
    When I complete the log in form
    And I press the Login button
    Then I should be logged in

  Scenario:
    Given I am not logged in
    When I visit the account page
    Then I should be prompted to log in

  Scenario:
    Given I am logged in
    When I visit the account page
    Then I should see the account page
