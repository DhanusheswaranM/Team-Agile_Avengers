*** Settings ***
Documentation    This file is for testing the services about with csv file
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/ServicesAbout.robot
Library    DataDriver    file=../Utility/AddServiceAbout.csv    encoding=utf_8    dialect=unix
Test Template    Fill the services about details with csv 

***Variables***
${Heading_csv}    
${subheading_csv}
${feature_title_csv}
${decription_csv}

*** Test Cases ***
Verify you can add the valid data using csv      ${Heading_csv}    ${subheading_csv}    ${feature_title_csv}    ${decription_csv}
    

*** Keywords ***
Fill the services about details with csv 
    [Tags]    regression 
    [Arguments]    ${Heading_csv}    ${subheading_csv}    ${feature_title_csv}    ${decription_csv}
    loginPage.Login with valid credentials    ${common_user}    ${common_password}
    Open the Services About page
    Click the Add new service about button
    Enter dropdown values for adding new service about
    Input Text    ${heading}     ${Heading_csv}
    Input text    ${sub_heading}     ${subheading_csv}
    Input Text    ${feature_title}      ${feature_title_csv}
    Input Text    ${demo_desc}    ${decription_csv} 
    Upload Image File        ${img_path}    
    Wait Until Page Contains     DemoHeadingcsv     timeout=10s
