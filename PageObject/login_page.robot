*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot


*** Variables ***
${FIELD_USERNAME}    //input[@id="user-name"]
${FIELD_PASSWORD}    //input[@id="password"]
${BUTTON_LOGIN}    //input[@id="login-button"]


*** Keywords ***
login_page.input username
    [Arguments]    ${username}
    Input Text    ${FIELD_USERNAME}    ${username}

login_page.input password
    [Arguments]    ${password}
    Input Text    ${FIELD_PASSWORD}    ${password}

login_page.click login
    Click Element    ${BUTTON_LOGIN}

login_page.validate success login
    Location Should Contain    /inventory.html

login_page.login with valid account
    [Arguments]    ${username}    ${password}
    resources.Open Browser
    login_page.input username    ${username}
    login_page.input password    ${password}
    login_page.click login
    login_page.validate success login

login_page.validate error message
    [Arguments]    ${type_error}
    ${error_message}=    Get Text    //h3[@data-test="error"]
    IF    '${type_error}' == 'invalid user'
        Should Contain    ${error_message}    Username and password do not match any user in this service
    ELSE IF    '${type_error}' == 'locked user'
        Should Contain    ${error_message}    this user has been locked out
    ELSE
        Fail    Invalid type_error: ${type_error}
    END
    