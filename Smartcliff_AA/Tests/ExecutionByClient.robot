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
${search_stack_name}    Assessment
${Table_Count}    5

*** Test Cases ***

Verify the Execution By Client Page
    [Tags]    Regression
    HomePage.Common Login
    HomePage.Click the Execution By Client
    ExecutionByClientPage.Check the Execution By Client Page

Edit already existing Execution By Client
    [Tags]    Regression    Smoke
    HomePage.Common Login
    HomePage.Click the Execution By Client
    ExecutionByClientPage.Check the Execution By Client Page
    ExecutionByClientPage.Edit and Check the Stack name    ${stack_Name}
    ${text} =    ExecutionByClientPage.Get Stack Name
    Should Be Equal As Strings    '${text}'    '${stack_Name}'



Add new Execution By Client
    [Tags]    Regression    UAT
    HomePage.Common Login
    HomePage.Click the Execution By Client
    Page Should Contain    Execution Highlights Control

    Scroll Element Into View    ${dropDown_Number}
    Click Element    ${dropDown_Number}

    Click Element    xpath://ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']/li[3]
    Set Browser Implicit Wait    5s
    ${StackNames} =    Get WebElements    xpath://tbody[@class='MuiTableBody-root css-1xnox0e']/tr/td[1]
    ${is_present} =    Set Variable    False

    FOR    ${name}    IN    @{StackNames}
        ${Stack_Test} =    Get Text    ${name}
        Log To Console    Checking stack: ${Stack_Test}
        IF    '${Stack_Test}' == '${stack_naming}'
            Log To Console    Already exist stack name: ${Stack_Test}
            ${is_present} =    Set Variable    True
            Exit For Loop
        END
    END

    IF    not ${is_present}
        ExecutionByClientPage.Click the Add Highlights
        Page Should Contain    Add Form
        ExecutionByClientPage.Add New Execution By Client    ${business_service_name}    ${service_name}    ${stack_naming}    ${stack_count}
    END


Search the Stack Name
    [Tags]    Sanity
    HomePage.Common Login
    HomePage.Click the Execution By Client
    Page Should Contain    Execution Highlights Control
    ExecutionByClientPage.Searching the stack Name    ${search_stack_name}

Validate Rows Per Page in Execution By Client
    [Tags]    UAT
    HomePage.Common Login
    HomePage.Click the Execution By Client
    Page Should Contain    Execution Highlights Control
    ExecutionByClientPage.Validate Rows Per Page    ${Table_Count}
    ${actual} =    ExecutionByClientPage.Count Of Table
    ${actual_count} =    Convert To String    ${actual}
    Should Be Equal    ${actual_count}    ${Table_Count}

Validate Navigating back from add execution by client to servicepage
    [Tags]    Sanity
    HomePage.Common Login
    HomePage.Click the Execution By Client
    ExecutionByClientPage.Click the Add Highlights
    Page Should Contain    Add Form
    ExecutionByClientPage.Navigating Back
    Page Should Contain    Execution Highlights Control

