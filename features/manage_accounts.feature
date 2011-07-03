Feature: Create account
  In order to track my job history
  As a user
  I want to easily create my account
Background:
  Given I am on the homepage

  Scenario: Register new account
    When I fill in "Email" with my email address
    And I press the Submit button
    Then I should see "Thankyou for signing up, an email has been sent to email@example.com."
    Then I should receive an email confirmation which contains the activation url
    Given the activation url
    When I fill in first name, last name and my password
    And I press the Submit button
    Then I should see "Add further details"

  Scenario: Submit an invalid email
    When I fill in "Email" with an invalid address
    And I press the Submit button
    Then I should see "Email is invalid"
