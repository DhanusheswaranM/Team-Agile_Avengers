*** Settings ***
Documentation    This file is for testing the services about with csv file
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/ServicesAbout.robot
Library    DataDriver    file=..Utility/AddServiceAbout.csv    encoding=utf_8    dialect=unix
Test Template    Fill the services about details with csv 

***Variables***
${Heading_csv}    
${subheading_csv}
${feature_title_csv}
# ${heading}    //input[@name='heading']
# ${sub_heading}    //input[@name='subHeading']
# ${feature_title}    //input[@name='title']

*** Test Cases ***
Verify you cannot add the invalid data    ${Heading_csv}    ${subheading_csv}    ${feature_title_csv}
  
*** Keywords ***
Fill the services about details with csv 
    [Arguments]    ${Heading_csv}    ${subheading_csv}    ${feature_title_csv}
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the Add new service about button
    Enter dropdown values for adding new service about
    Input Text    //input[@name='heading']     ${Heading_csv}
    Input text    //input[@name='subHeading']     ${subheading_csv}
    Input Text    //input[@name='title']     ${feature_title_csv}   
    sleep    5s
    Click Button    ${submit_btn}
    Set Selenium Implicit Wait    5
    Page Should Contain    DemoHeading