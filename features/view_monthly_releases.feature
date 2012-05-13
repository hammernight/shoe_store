Feature: View Shoes to be released for each month
  In oder to pick a shoe to be reminded of its availability to be purchased
  As a site user
  I want to be able to see the shoes and some detail about them

Scenario: View all shoes in list
  Given I visit shoe site
  When I view the list of upcoming releases
  Then I should be taken to the release schedule

  Scenario: Follow link on release schedule to month view
    Given I visit shoe site
    And I am on the release schedule
    When I click a link for "July"
    Then I should be taken to the "July" schedule
    And I should only see shoes that will be released in "July"