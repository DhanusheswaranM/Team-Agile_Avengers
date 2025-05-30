*** Settings ***
Library    SeleniumLibrary
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/LoginPage.robot
Library    DataDriver    file=../Utility/LoginExcel.xlsx    sheet_name=Sheet1
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Test Template    Validate different login scenarios

*** Variables ***
${Email}
${Password}

*** Test Cases ***
Validate different login scenarios   ${Email}    ${Password}    

*** Keywords ***
Validate different login scenarios    
    [Arguments]    ${Email}    ${Password} 
    Input Text    ${user_email_field}     ${Email}    
    Input Password    ${user_password}    ${Password} 
    Click Button    ${login_btn}
    IF    '${Email}' == '' and '${Password}' == 'dhyula@333'
        Verify Email required error message
    ELSE IF    '${Email}' == '2k21eee09@kiot.ac.in' and '${Password}' == ''
        Verify password required error message
    ELSE IF    '${Email}' == '123' and '${Password}' == 'dhyula@333'
        Verify wrong username error message
    ELSE IF    '${Email}' == '2k21eee09@kiot.ac.in' and '${Password}' == '123'
        Verify wrong password error message
    ELSE IF    '${Email}' == '2k21eee09@kiot.ac.in' and '${Password}' == 'dhyula@333'
        Verify login successful
    END

    

