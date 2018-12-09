@sylius_product_seo_url_admin
Feature: Editing product's slug
    In order to manage access path to product page
    As an Administrator
    I want to be able to edit product's slug and have the taxon slug included

    Background:
        Given the store operates on a single channel in "United States"
        And I am logged in as an administrator
        And the store has "Mugs" taxonomy

    @ui @javascript
    Scenario: Creating a product with an autogenerated slug
        Given I want to create a new simple product
        When I specify its code as "BOARD_MANSION_OF_MADNESS"
        And I choose main taxon "Mugs"
        And I name it "Mansion of Madness" in "English (United States)"
        And I set its price to "$100.00" for "United States" channel
        And I add it
        Then the slug of the "Mansion of Madness" product should be "mugs/mansion-of-madness"

    @ui @javascript
    Scenario: Creating a product with a custom slug
        Given I want to create a new simple product
        When I specify its code as "BOARD_MANSION_OF_MADNESS"
        And I name it "Mansion of Madness" in "English (United States)"
        And I set its price to "$100.00" for "United States" channel
        And I set its slug to "mom-board-game" in "English (United States)"
        And I add it
        Then the slug of the "Mansion of Madness" product should be "mom-board-game"

    @ui @javascript
    Scenario: Creating a product with a custom slug including slash
        Given I want to create a new simple product
        When I specify its code as "BOARD_MANSION_OF_MADNESS"
        And I name it "Mansion of Madness" in "English (United States)"
        And I set its price to "$100.00" for "United States" channel
        And I set its slug to "taxon-test/mom-board-game" in "English (United States)"
        And I add it
        Then the slug of the "Mansion of Madness" product should be "taxon-test/mom-board-game"

    @ui @javascript
    Scenario: Automatically changing a product's slug while editing a product's name
        Given the store has a product "Mansion of Madness"
        When I want to modify this product
        And I choose main taxon "Mugs"
        And I enable slug modification
        And I rename it to "Small World" in "English (United States)"
        And I wait 5 seconds
        And I save my changes
        Then the slug of the "Small World" product should be "mugs/small-world"

    @ui @javascript
    Scenario: Automatically changing a product's slug while editing a product's name (and not waiting for AJAX to complete)
        Given the store has a product "Mansion of Madness"
        When I want to modify this product
        And I choose main taxon "Mugs"
        And I enable slug modification
        And I rename it to "Small World" in "English (United States)"
        And I save my changes
        Then the slug of the "Small World" product should be "small-world"
