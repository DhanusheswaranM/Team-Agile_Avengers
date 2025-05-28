*** Settings ***
Documentation    This file is for testing the Business Services functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/BusinessServicesResources.robot

*** Test Cases ***
verify Business Service Panel
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    BusinessServicesResources.Click Business Service

edit Business Service
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    BusinessServicesResources.Edit already existing business service    "new business service name"

add Business Service
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    BusinessServicesResources.Add new business service    Add new business service nameea

search already existing business service
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    BusinessServicesResources.search Business Service    "new business service name"

validate rows per page
    LoginPage.Login with valid credentials    ${common_user}    ${common_password}
    BusinessServicesResources.verify whether the rows per page is working    5
    