Feature: Shoes

  Scenario: Search for shoes by brand
    Given A shoe with brand "Poindexter"
    When I search for brand "Poindexter"
    Then I should see 1 shoe

  Scenario: Show all shoes
    Given 9 shoes
    When I view all shoes
    Then I should see 9 shoes

  Scenario Outline: Show shoes by month
    Given A shoe for month: <month>
    Then I should see 1 shoe for month: <month>
  Examples:
    | month     |
    | January   |
    | February  |
    | March     |
    | April     |
    | May       |
    | June      |
    | July      |
    | August    |
    | September |
    | October   |
    | November  |
    | December  |