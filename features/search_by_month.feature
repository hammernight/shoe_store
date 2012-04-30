Feature:
  In order to see what shoes are being released for a particular month
  As a Site user
  I want to be able to perform a search by month


  Scenario: Pick one month
    Given I visit shoe site
    When I pick my preorder month "July"
    Then I should see 3 shoes are being released in "July"

  Scenario Outline: all months should show name in title
    Given I visit shoe site
    When I pick my preorder month "<month_name>"
    Then I <toggle> the "<month_name>" in the title


  Examples: All months
    | month_name | toggle |
    | January    | should |
    | July       | should |

  Examples: Not valid
    | month_name   | toggle     |
    | Select Month | should not |

