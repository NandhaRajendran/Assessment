*** Settings ***
Documentation   This File Contains all the Page Objects and Keywords for Evernote Login Page
Library       SeleniumLibrary

*** Variables ***
# All Login Page Page Object Elements
${USERNAME_FIELD}               //input[@id='username']
${PASSWORD_FIELD}               //input[@id='password']
${LOGIN_BUTTON}                 //input[@id='loginButton']
${LOGIN_LINK}                   //nav[@class='utility-nav']/ul/li/a[text()='Log In']
${ERROR_EMAILMESSAGE}           //div[@id='responseMessage']
${ERROR_INVALIDPASSWORDMESSAGE}  //div[@class='error-status FieldState-message FieldState_error-message']
${Wait_Time}		10 seconds

*** Keywords ***
Login Page Opened
  [Documentation]     Confirms the Login Page is opened by Username and Login button on screen
  Wait Until Element Is Visible     ${USERNAME_FIELD}
  Element Should Be Visible         ${USERNAME_FIELD}
  Wait Until Element Is Visible     ${LOGIN_BUTTON}
  Element Should Be Visible         ${LOGIN_BUTTON}

Input Username
  [Documentation]     Inputs the Email Id for Login
  [Arguments]                       ${username}
  Wait Until Element Is Enabled     ${USERNAME_FIELD}
  Input Text                        ${USERNAME_FIELD}       ${username}

Login Button Should Be Enabled
  [Documentation]     Waits for Login Button to be enabled
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}
  Element Should Be Enabled         ${LOGIN_BUTTON}

Input Password
  [Documentation]     Inputs the Password for Login
  [Arguments]                       ${password}
  Wait Until Element Is Enabled     ${PASSWORD_FIELD}
  Input Text                        ${PASSWORD_FIELD}       ${password}

Click Login Button
  [Documentation]     Clicks on Login Button on Login Page
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}
  Click Element                     ${LOGIN_BUTTON}

Error Message Displayed Invalid Email
  [Documentation]     Checks the error message for Invalid Mail
  Wait Until Element Is Visible     ${ERROR_EMAILMESSAGE}   ${Wait_Time}
  Element Should Be Visible         ${ERROR_EMAILMESSAGE}

Error Message Displayed Invalid Password
  [Documentation]     Checks for the error message for Invalid Password
  Wait Until Element Is Visible     ${ERROR_INVALIDPASSWORDMESSAGE}  ${Wait_Time}
  Element Should Be Visible         ${ERROR_INVALIDPASSWORDMESSAGE}
