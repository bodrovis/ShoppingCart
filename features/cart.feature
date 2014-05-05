Feature: Working with cart and products
  Background:
    Given there are some products
    And I am logged in
    And I visit main page

  Scenario: Registered users should be able to access cart and to buy products
    Then I should have access to the cart
    And I should be able to buy products

  @javascript
  Scenario: Adding produts to cart
    When I add product to cart
    Then there should be 1 product in the cart
    When I add product to cart
    Then there should be 2 products in the cart
    When I remove product from the cart
    Then there should be 1 product in the cart
    When I remove product from the cart
    Then there should be 0 products in the cart
