*** Settings ***
Documentation    This file is for testing the common login functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
# Resource    ../Resourcers/LoginPage.robot

*** Test Cases ***
Login with common user credentials
    loginPage.Login with valid credentials    ${common_user}    ${common_password}