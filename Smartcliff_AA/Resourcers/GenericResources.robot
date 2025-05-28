*** Settings ***
Documentation    This resources file is for resuable keywords and variables for login
Library    SeleniumLibrary
Resource    ../Resourcers/LoginPage.robot

*** Variables ***
${url}    https://smart-cliff-admin.vercel.app/
${browser}    chrome
${common_user}    2k21eee09@kiot.ac.in
${common_password}    dhyula@333

*** Keywords ***

Open the website with the browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10s
    Set Selenium Implicit Wait    10s

Login with valid credentials
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}

Close Browser Session
    Close All Browsers