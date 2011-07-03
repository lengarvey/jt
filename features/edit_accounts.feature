Feature: Edit account
  In order to keep my account details accurate
  As a registered user
  I want to be able to edit my account details

Background:
  Given I'm on my edit account page

  Scenario: Change password
    When I change my password
    And I click submit
    Then I should see that my password is changed

  Scenario: Change name
    When I change my name
    And I click submit
    Then I should see that my name is updated

  Scenario: Change Date of Birth
    When I change my date of birth
    And I click submit
    Then I should see that my date of birth is updated

  Scenario: Change location
    When I change my location
    And I click submit
    Then I should see that my location is updated
    
