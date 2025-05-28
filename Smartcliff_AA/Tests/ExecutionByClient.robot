*** Settings ***
Documentation    This file is to testing the adding the execution highlight
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/ExecutionByClientPage.robot

*** Variables ***
${stack_Name}    UI/UX
${business_service_name}    B2B
${service_name}    HTD
${stack_naming}    Testing
${stack_count}    455
${search_stack_name}    Software

*** Test Cases ***

Verify the Execution By Client Page
    [Tags]    Regression
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Execution By Client
    ExecutionByClientPage.Check the Execution By Client Page

Edit already existing Execution By Client
    [Tags]    Regression    Smoke
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Execution By Client
    ExecutionByClientPage.Check the Execution By Client Page
    ExecutionByClientPage.Edit and Check the Stack name    ${stack_Name}
    # ExecutionByClientPage.Edit and Check the Stack name
    ${text} =    ExecutionByClientPage.Get Stack Name
    Should Be Equal As Strings    '${text}'    '${stack_Name}'



Add new Execution By Client
    [Tags]    Regression    UAT
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Execution By Client
    Page Should Contain    Execution Highlights Control
    ExecutionByClientPage.Click the Add Highlights
    Page Should Contain    Add Form
    ExecutionByClientPage.Add New Execution By Client    ${business_service_name}    ${service_name}    ${stack_naming}    ${stack_count}

Search the Stack Name
    [Tags]    Sanity
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Execution By Client
    Page Should Contain    Execution Highlights Control
    # ExecutionByClientPage.Searching the stack Name    ${search_stack_name}