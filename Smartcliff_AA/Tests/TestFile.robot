*** Settings ***
Documentation    This file is for testing the common login functionality
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/LoginPage.robot

*** Test Cases ***
Login with common user credentials
    loginPage.Login with valid credentials    ${common_user}    ${common_password}

*** Settings ***
Library    SeleniumLibrary
# Resource    LogoutResource.robot

*** Variables ***
${about_icon}    xpath://*[@id="drawer"]/div/ul/li[2]/div
${about_us}    xpath://*[@id="drawer"]/div/ul/li[2]/div[2]/div/div/div/div[1]
${add_abt_us_btn}    xpath://*[@id="root"]/div[1]/main/div[2]/div[1]/div[2]/button
# ${IMAGE_PATH}    ${CURDIR}${/}Utilities${/}about_us_images${/}Sunlit Park Walk.jpg
${DROPZONE_AREA}    xpath://*[@id="root"]/div[1]/main/main/div/form/div[2]/div
${submit_content}    xpath://*[@id="root"]/div[1]/main/main/div/form/button
${content_title}    xpath=//*[@id="root"]/div[1]/main/main/div/form/div[1]/div//input
# ${IMAGE_PATH}    ../Utilities/about_us_images/Sunlit Park Walk.jpg
${IMAGE_PATH}    ${CURDIR}${/}about_us_images${/}Sunlit Park Walk.jpg
# ${ABSOLUTE_PATH}    Get File Path    ${IMAGE_PATH}


*** Keywords ***
click about us in side menu
    Click Element    ${about_icon}
    Click Element    ${about_us}
    
fill add about us form
    
    # Wait Until Element Is Not Visible    ${toast}    timeout=10s
    Input Text    ${content_title}    hello saranya3
   
    Wait Until Element Is Visible    ${DROPZONE_AREA}
    Wait Until Element Is Enabled    ${DROPZONE_AREA}
    
    Click Element    ${DROPZONE_AREA}
    Sleep    1s  
    ${file_input}=    Set Variable    css:input[type="file"][accept="image/*"]
    
    Choose File    ${file_input}    ${IMAGE_PATH}

    # Wait Until Page Contains Element    css:.MuiDropzonePreviewList-image    10s
    
    Click Button    ${submit_content}
    Sleep    5s
    
click add about us button
    Click Button    ${add_abt_us_btn}