*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}    Chrome
${baseUrl}    https://www.saucedemo.com/

*** Keywords ***
resources.Open Browser
    [Documentation]    Open the browser with the given URL and maximize the window
    [Arguments]    ${URL}=${baseUrl}    ${BROWSER}=${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window