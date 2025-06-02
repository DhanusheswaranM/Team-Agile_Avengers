*** Settings ***
Documentation    This file is for testing the services about functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/ServicesAbout.robot

*** Test Cases ***
Login with common user credentials and navigate to the Services About Page
    [Tags]    smoke    sanity
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Verify the Services About page opened 

Verify if the search results are displayed
    [Tags]    regression    sanity
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page 
    Search heading in the searchbox    ${search_box}    
    Verify HTD search Result displayed

Verify you can edit the data
    [Tags]    regression
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Search edit heading in the searchbox        
    Click on the results edit button    
    Edit the value of the feature title
    Set Selenium Implicit Wait    5
    Click on update button
    verify page is updated

Verify you can delete the data
    [Tags]    regression
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the delete button
    click confirm delete
    # Sleep    5
    verify the data deleted
    
Verify the Row count are displayed correctly
    [Tags]    smoke    regression    sanity
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    click row dropdown and get row count
    
    











































