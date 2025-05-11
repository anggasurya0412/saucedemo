*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot
Resource    ../PageObject/inventory_page.robot
Resource    ../PageObject/login_page.robot
Resource    ../PageObject/cart_page.robot
Test Setup    resources.Open Browser    
Test Teardown    Close Browser

*** Test Cases ***
Login with valid account should success
    [Documentation]    Login with valid account 
    GIVEN login_page.input username    standard_user
    AND login_page.input password    secret_sauce
    WHEN login_page.click login
    THEN login_page.validate success login

Login when account not registered should failed
    [Documentation]    Login when account not registered
    [Template]    Failed login to sauce demo
    # ${username}    ${type_error}
    invalid_user    invalid user

Login when account is locked should failed
    [Documentation]    Login when account locked
    [Template]    Failed login to sauce demo
    # ${username}    ${type_error}
    locked_out_user    locked user

*** Keywords ***
Failed login to sauce demo
    [Documentation]    Failed login to sauce demo
    [Arguments]    ${username}    ${type_error}
    GIVEN login_page.input username    ${username}
    AND login_page.input password    secret_sauce
    WHEN login_page.click login
    THEN login_page.validate error message    ${type_error}

