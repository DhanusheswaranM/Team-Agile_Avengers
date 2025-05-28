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