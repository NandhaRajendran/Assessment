*** Settings ***
Documentation       This File contains all the necessary resources and input details for Test Execution
Library       SeleniumLibrary

*** Variables ***
# Basic Input details
${MAIN_PAGE}                    https://evernote.com
${LOGIN_PAGE}                   ${MAIN_PAGE}/Login.action?referralSpecifier=mktgrepack_en_oo_web_nav_V00

*** Keywords ***
Open Main Page Using Chrome Browser
    [Documentation]     Launch the Application in Chrome Browser
    Open Browser    ${MAIN_PAGE}    Chrome
    Maximize Browser Window

Open Login Page Using Chrome Browser
    [Documentation]     Launches the Login Page of the Application in Chrome Browser
    Open Browser    ${LOGIN_PAGE}   Chrome
    Maximize Browser Window



