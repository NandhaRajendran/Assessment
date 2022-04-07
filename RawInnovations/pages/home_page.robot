*** Settings ***
Documentation   This File contains all the Page Object Elements and Keywords for Evernote Home Page
Library     SeleniumLibrary

*** Variables ***
# All Page Object at Home page
${CreateNote_Button}            xpath://button[@id='qa-CREATE_NOTE']
${Login_Loader}     xpath://span[contains(text(),'Getting started…')]
${MaximumWait_Time}        15 seconds

*** Keywords ***
Home Page Opened
  [Documentation]   Checks the create Note Button and confirms the Home Page is Opened
  Set Selenium Timeout	${MaximumWait_Time}
  #Wait for the Login Loader
  Wait Until Element Is Visible    ${Login_Loader}
  Wait Until Element Is Not Visible  ${Login_Loader}
  # Wait and confirm for the Create Note button is visible
  Wait Until Element Is Visible    ${CreateNote_Button}
  Element Should Be Visible        ${CreateNote_Button}

