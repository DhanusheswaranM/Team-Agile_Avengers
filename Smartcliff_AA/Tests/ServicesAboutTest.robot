*** Settings ***
Documentation    This file is for testing the services about functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/ServicesAbout.robot
# Library    DataDriver    file=C:\Agile-Avengers\Team-Agile_Avengers\Smartcliff_AA\Utility\AddServiceAbout.csv    encoding=utf_8    dialect=unix
# Test Template    Fill the services about details 

***Variables***
${Heading_csv}
${subheading_csv}
${feature_title_csv}

*** Test Cases ***
Login with common user credentials and navigate to the Services About Page
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Verify the Services About page opened 

verify if the search results are displayed
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page 
    Search heading in the searchbox    ${search_box}    
    Verify HTD search Result displayed

Verify you can add the data
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the Add new service about button
    Enter dropdown values for adding new service about
    Fill the services about details   ${Heading_csv}    ${subheading_csv}    ${feature_title_csv}

Verify you can edit the data
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click on the edit button

Verify you can delete the data
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the delete button
    











































