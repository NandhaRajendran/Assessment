*** Settings ***
Documentation   This File contains all the steps required for the Note Creation test
Resource          ../pages/dashboard_page.robot

*** Keywords ***
Create Note And Save
  [Documentation]   Creates a new note and wait for auto save
  [Arguments]   ${TitleText_Value}
  Click Note Link
  New Note Created
  Switch to Notes Text Area
  Enter Notes Title     ${TitleText_Value}
  Switch Back from Notes Text Area

Sign Out Current User
  [Documentation]   Signs out the Current user
  Click Account Section  ${Valid_Email}
  signout user

Open Newly Created Note
  [Documentation]   This Keyword opens the newly created note
  [Arguments]  ${TitleText_Value}
  Open Created Note  ${TitleText_Value}