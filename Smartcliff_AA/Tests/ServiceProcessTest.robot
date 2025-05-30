*** Settings ***
Documentation    This file is for testing the services about functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/ServicesProcessResources.robot

*** Test Cases ***
Login with common user credentials and navigate to the Services About Page
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Verify service process page opened   

Verify if the search results are displayed
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Search process heading in the searchbox    ${search_process}    
    Verify service process search results displayed

