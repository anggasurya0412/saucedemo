*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
cart_page.validate item added
    [Documentation]    validate that the item was added to the cart
    [Arguments]    ${item}
    Page Should Contain    ${item}