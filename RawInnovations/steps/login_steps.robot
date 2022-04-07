*** Settings ***
Documentation   This File contains all the steps required for the login test
Resource          ../pages/login_page.robot

*** Keywords ***
Input Email And Password
  [Documentation]   This Keyword enters input details and Login
  [Arguments]   ${Email}   ${Password}
  Input Username                              ${Email}
  Click Login Button
  Input Password                              ${Password}
  Login Button Should Be Enabled
  Click Login Button

Input Email And Login
    [Documentation]     This Keyword enter the email id and click login
    [Arguments]  ${Email}
    Input Username          ${Email}
    Click Login Button

Login Valid User
    [Documentation]     This Keyword will login the customer with valid data
    [Arguments]     ${Valid_Email}    ${Valid_Password}
    Login Page Opened
    Input Email And Password    ${Valid_Email}    ${Valid_Password}
    Home Page Opened