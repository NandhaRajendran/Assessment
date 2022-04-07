*** Settings ***
Documentation   Test Suite file to validate the Login test cases
Resource          ../resources.robot
Resource          ../pages/login_page.robot
Resource          ../pages/home_page.robot
Resource          ../steps/login_steps.robot

#Test Setup & Teardown Executes for every test case
Test Setup        Open Login Page Using Chrome Browser
Test Teardown     Close Browser

*** Test Cases ***
Successful Login
    [Documentation]     Validates the Successful Login with Valid Credentials
    GIVEN Login Page Opened
    WHEN Input Email And Password    ${Valid_Email}    ${Valid_Password}
    THEN Home Page Opened

Login with Invalid Email
    [Documentation]     Validates teh Unsuccessful Login with Invalid Email ID
    GIVEN Login Page Opened
    WHEN Input Email And Login  ${Invalid_Email}
    THEN Error Message Displayed Invalid Email

Login with Invalid Password
    [Documentation]     Validates teh Unsuccessful Login with Valid Email ID and Invalid Password
    GIVEN Login Page Opened
    WHEN Input Email And Password   ${Valid_Email}  ${Invalid_Password}
    THEN Error Message Displayed Invalid Password
