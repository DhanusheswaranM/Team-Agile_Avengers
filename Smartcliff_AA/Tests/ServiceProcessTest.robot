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
    [Tags]    smoke    sanity
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Verify service process page opened   

Verify if the search results are displayed
    [Tags]    regression    sanity
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Search process heading in the searchbox    ${search_process}    
    Verify service process search results displayed

Add a Service process data  
    [Tags]    regression
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Click the Add new service process button
    Enter dropdown values for adding new service process
    Enter process heading
    Upload image for adding process data     ${img_path}
    Click on submit process button

Edit the service process data
    [Tags]    regression
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Search process to edit in the searchbox        
    Click on the process edit button    
    Edit the value of the process heading
    # Set Selenium Implicit Wait    5
    ServicesProcessResources.Click on update button
    verify process page is updated

Verify you can delete the data
    [Tags]    regression
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services Process Page
    Click the process delete button
    click process confirm delete
    # Sleep    5
    verify the process data deleted
    
Verify the Row count are displayed correctly
    [Tags]    smoke    regression    sanity
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    click row dropdown of process page and get row count


