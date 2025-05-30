*** Settings ***
Documentation    This resource is for common login functionality
Library    SeleniumLibrary

*** Variables ***
${user_email_field}    css:input[id='signin-email']
${user_password}    css:input[id='signin-password']
${login_btn}    css:button[id='signin-submit']

*** Keywords ***
Login with valid credentials
    [Arguments]    ${common_user}    ${common_password}
    Input Text    ${user_email_field}    ${common_user}
    Input Password    ${user_password}    ${common_password}
    Click Button    ${login_btn}

Verify Email required error message
    Page Should Contain Element    xpath=//p[contains(text(),'Email is required')]
   
Verify password required error message
    Page Should Contain Element    xpath=//p[contains(text(),'Password is required')]

Verify wrong username error message
    Page Should Contain Element    //div[contains(text(),'Incorrect password or email')]

Verify wrong password error message
    Page Should Contain Element    //div[contains(text(),'Incorrect password or email')]

Verify login successful
    Page Should Contain    Welcome to the Admin Panel!