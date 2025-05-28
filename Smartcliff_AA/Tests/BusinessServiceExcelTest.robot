*** Settings ***
Documentation    This file is for testing the Business Services Excel functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/BusinessServicesResources.robot
Library    DataDriver    file=../Utility/BusinessService.xlsx    sheet_name=Sheet1
Test Template    Validate add business service with invalid data

*** Variables ***
${name1}
${title1}
${description1}
${slug1}

*** Test Cases ***
validate add business service with invalid data  ${name1}    ${title1}    ${description1}    ${slug1}

*** Keywords ***
validate add business service with invalid data
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    [Arguments]    ${name1}    ${title1}    ${description1}    ${slug1}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    Click Button    ${Add_Business_Service_Button}
    Input Text    ${name}    ${name1}
    Input Text    ${title}    ${title1}
    Input Text    ${description}    ${description1}
    Input Text    ${slug}    ${slug1}
    Click Button    xpath=//button[@type='submit']
    IF    '${title1}' == ''
        Element Text Should Be    xpath=//p[text()='Title is required']    Title is required
    ELSE IF    '${name1}' == ''
        Element Text Should Be    xpath=//p[text()='Name is required']    Name is required
    ELSE IF    '${description1}' == ''
        Element Text Should Be    xpath=//p[text()='Description is required']    Description is required
    ELSE IF    '${slug1}' == ''
        Element Text Should Be    xpath=//p[text()='Slug is required']    Slug is required
    END

