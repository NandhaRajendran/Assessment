*** Settings ***
Documentation   Test Suite file to valid the Dashboard-Notes cases
Resource          ../resources.robot
Resource          ../pages/login_page.robot
Resource          ../pages/home_page.robot
Resource          ../pages/Signout_page.robot
Resource          ../steps/Notes_steps.robot
Resource          ../steps/login_steps.robot
Resource          ../pages/dashboard_page.robot

#Test Setup & Teardown Executes for every test case
Test Setup        Open Login Page Using Chrome Browser
Test Teardown     Close Browser

*** Test Cases ***
Login and Write a Note
    [Documentation]     Validates a new Note Creation Step
    Given Login Valid User      ${Valid_Email}    ${Valid_Password}
    When Create Note And Save  ${TitleText_Value}
    And Sign Out Current User
    Then Logout Page Landed

Login and Check Note Created
    [Documentation]     Access and validates the newly created Note
    GIVEN Login Valid User      ${Valid_Email}    ${Valid_Password}
    When Open Newly Created Note  ${TitleText_Value}
    THEN Created Note is Opened


