*** Settings ***
Documentation   This File Contains all the Page Objects and Keywords for Evernote Signout Page
Library     SeleniumLibrary

*** Variables ***
# All SignOut Page Object Elements
${Signout_Text}            xpath://h1[contains(text(),'logged out')]
${Logout_Loader}     xpath://span[contains(text(),'log you out')]
${MaximumWait_Time}        15 seconds

*** Keywords ***
Logout Page Landed
  [Documentation]     Validates Sign out text and confirm the user is signed out
  Set Selenium Timeout	${MaximumWait_Time}
  Wait Until Element Is Visible    ${Logout_Loader}
  Wait Until Element Is Not Visible  ${Logout_Loader}
  Wait Until Element Is Visible    ${Signout_Text}
  Element Should Be Visible        ${Signout_Text}

