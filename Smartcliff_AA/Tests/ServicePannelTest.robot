*** Settings ***
Documentation    This file is for testing the Service Panel functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/ServicePannelResources.robot

*** Test Cases ***
verify Service Panel
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    ServicePannelResources.Click Service Panel

Edit Service Panel
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    ServicePannelResources.Edit already existing service    "new service name"

Add Service Panel
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    ServicePannelResources.Add new service    Add new service name    B2B

Search already existing service
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    ServicePannelResources.Search Service    HTD

Validate rows per page
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    ServicePannelResources.Verify whether the rows per page is working    5

Print Service Panel
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    ServicePannelResources.Storing the Service names in list and printing them