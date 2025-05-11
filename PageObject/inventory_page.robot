*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BURGER_MENU}    //button[@id="react-burger-menu-btn"]
${ABOUT_MENU}    //a[@id="about_sidebar_link"]
${CART_ICON}    //div[@id="shopping_cart_container"]

*** Keywords ***
inventory_page.add cart item
    [Documentation]    Add an item to the cart
    [Arguments]    ${item}
    Set Test Variable    ${ADD_CART}    //button[@id="add-to-cart-${item}"]
    Click Element    ${ADD_CART}
    
inventory_page.click cart icon
    [Documentation]    Validate that the item was added to the cart
    Wait Until Element Is Enabled    ${CART_ICON}    20s
    Click Element    ${CART_ICON}    ${False}    ${True}
    Location Should Contain    /cart.html

inventory_page.click burger menu
    [Documentation]    Click the burger menu
    Click Element    ${BURGER_MENU}

inventory_page.click about menu
    [Documentation]    Click the about menu
    Wait Until Element Is Visible    ${ABOUT_MENU}    20s
    Click Element    ${ABOUT_MENU}
    Page Should Contain    The world relies on your code

