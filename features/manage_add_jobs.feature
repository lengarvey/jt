Feature: Manage Job History
  In order to manage my job history
  As a registered user
  I want to be able to add and remove jobs
  
Background:
  Given I'm on my account page

  Scenario: Add and delete a job
    When I fill out my job details
    And I press "Add Job"
    Then I should see my job
    When I remove my job
    Then I should see that it has been removed 

