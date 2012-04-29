Feature: I should see the home page

  Scenario: home page loads properly
    When I visit shoe site
    Then the title should say "Shoe Site: Welcome to the Shoe Site"

  Scenario: home page Home Page preorder select ist
    Given I visit shoe site
    When I pick my preorder month "January"
    Then I should be able to see a list of shoes being released that month


