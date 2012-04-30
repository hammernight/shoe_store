Feature: I should see the home page

  Scenario: home page loads properly
    When I visit shoe site
    Then the title should say "Shoe Site: Welcome to the Shoe Site"

  Scenario: home page preorder select list
    Given I visit shoe site
    When I pick my preorder month "July"
    Then I should be able to see a list of shoes being released that month

  Scenario: Search requires a valid month
    Given I visit shoe site
    When I perform the search without selecting a month
    Then I should see a warning message "Please Select a Valid Month"
    And I should be on the home page
