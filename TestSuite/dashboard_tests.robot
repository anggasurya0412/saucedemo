*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot
Resource    ../PageObject/inventory_page.robot
Resource    ../PageObject/login_page.robot
Resource    ../PageObject/cart_page.robot
Test Setup    login_page.login with valid account    standard_user    secret_sauce
Test Teardown    Close Browser

*** Test Cases ***
Add item to cart
    [Documentation]    Add an item to the cart
    GIVEN inventory_page.add cart item    sauce-labs-backpack
    WHEN inventory_page.click cart icon
    THEN cart_page.validate item added    Sauce Labs Backpack

Navigate to the about page
    [Documentation]    Navigate to the about page
    GIVEN inventory_page.click burger menu
    THEN inventory_page.click about menu
