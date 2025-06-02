*** Settings ***
Documentation    This file is for testing the Services Panel Excel functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/ServicePannelResources.robot
Library    DataDriver    file=../Utility/ServicePannel.xlsx    sheet_name=Sheet1
Test Template    Validate add service panel with invalid data

*** Variables ***
${Title1}
${Description1}
${slug1}

*** Test Cases ***
validate add service panel with invalid data  ${Title1}    ${Description1}    ${slug1}

*** Keywords ***
validate add service panel with invalid data
    [Tags]    regression    data-driven    excel
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    [Arguments]    ${Title1}    ${Description1}    ${slug1}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    Click Button    ${Add_Service_Button}
    Input Text    ${title}    ${Title1}
    Input Text    ${description}    ${Description1}
    Input Text    ${slug}    ${slug1}
    Click Button    xpath=//button[@type='submit']
    IF    '${Title1}' == ''
        Element Text Should Be    xpath=//p[text()='Title is required']    Title is required
    ELSE IF    '${Description1}' == ''
        Element Text Should Be    xpath=//p[text()='Description is required']    Description is required
    ELSE IF    '${slug1}' == ''
        Element Text Should Be    xpath=//p[text()='Slug is required']    Slug is required
    END