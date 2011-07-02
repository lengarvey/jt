Feature: Manage accounts
  In order to track my job history
  As a user
  I want to want to easily create my account
  
  Scenario: Register new account
    Given I am on the homepage
    When I fill in "Email" with "email@example.com"
    And I press "Submit"
    Then I should see "Thankyou for signing up, an email has been sent to email@example.com."
