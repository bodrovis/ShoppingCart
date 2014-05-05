Feature: Working with cart and products by authenticated users
  Scenario: Anonymous users should not access cart and should not have ability to buy products
    Given there are some products
    And I visit main page
    Then I should not have access to the cart
    And I should not be able to buy products