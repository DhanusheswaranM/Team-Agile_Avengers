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
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Verify the Services About page opened 

Verify if the search results are displayed
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page 
    Search heading in the searchbox    ${search_box}    
    Verify HTD search Result displayed

Valid adding data in service about page
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the Add new service about button
    Enter dropdown values for adding new service about
    Fill the services about details    ${heading}    ${sub_heading}    ${feature_title}
    Upload Image File    ${img}    ${img_path}  
    Set Selenium Implicit Wait    10s
    verify the data added

Verify you can edit the data
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click on the edit button
    Edit the value of the feature title
    Set Selenium Implicit Wait    5
    Click on update button
    verify page is updated

Verify you can delete the data
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the delete button
    click confirm delete
    Set Selenium Implicit Wait    5
    verify the data deleted
    











































