*** Settings ***
Documentation    This resources file is for resuable keywords and variables for Business Services functionality
Library    SeleniumLibrary
Resource    ../Resourcers/LoginPage.robot
Resource    ../Resourcers/HomePage.robot


*** Variables ***
${businessService_text}    xpath=//h4[text()='Business Service Panel']
${IMAGE_PATH}    ${CURDIR}${/}images${/}superman-justice-league-2017-zack-snyder-s-justice-league-hd-wallpaper-3b359d9226042a5b59ace600fdcd5400.jpg
${Add_Business_Service_Button}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ia5r0']
${name}    name:name
${title}    name:title
${description}    xpath=(//textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398'])[1]
${slug}    name:slug
${image}    xpath=(//input[@type='file'])[1]
${logo}    xpath=(//input[@type='file'])[2]


*** Keywords ***

Click Business Service
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    ${text}=    Get Text    ${businessService_text}
    Should Be Equal    ${text}    BUSINESS SERVICE PANEL

Edit already existing business service
    [Arguments]    ${new_business_service_name}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    Click Element    xpath=(//button[@tabindex="0"])[17]
    Wait Until Element Is Visible    xpath=//div[@class='MuiBox-root css-rhdloj']
    Scroll Element Into View    //div[@class='MuiBox-root css-rhdloj']
    Click Element    (//div[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]/input)[1]
    Press Keys    None    CTRL+A
    Press Keys    None    DELETE
    Click Element    (//div[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]/input)[1]
    Input Text    (//div[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]/input)[1]    ${new_business_service_name}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    //div[@class='MuiTablePagination-root css-o9ey65']
    Scroll Element Into View    //div[@class='MuiTablePagination-root css-o9ey65']
    ${text}=    Get Text    xpath=//td[text()='${new_business_service_name}']
    Should Be Equal    ${text}    ${new_business_service_name}

Add new business service
    [Arguments]    ${new_business_service_name}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    Click Button    ${Add_Business_Service_Button}
    Input Text    ${name}    ${new_business_service_name}
    Input Text    ${title}    ${new_business_service_name}
    Input Text    ${description}    This is a test description for ${new_business_service_name}
    Input Text    ${slug}    slug
    Click Element    xpath=(//div[@class='MuiDropzoneArea-root'])[1]
    Choose File    ${image}    ${IMAGE_PATH}
    Click Element    xpath=(//div[@class='MuiDropzoneArea-root'])[2]
    Choose File    ${logo}    ${IMAGE_PATH}
    Click Button    xpath=//button[@type='submit']
    ${text}=    Get Text    xpath=//td[text()='${new_business_service_name}']
    Should Be Equal    ${text}    ${new_business_service_name}
    Click Button    xpath=(//button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-1h48b3'])[8]
    Click Button    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
    Wait Until Element Is Not Visible    xpath=//td[text()='${new_business_service_name}']

search Business Service
    [Arguments]    ${business_service_name}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    Input Text    xpath=//input[@type='text']    ${business_service_name}
    Wait Until Element Is Visible    xpath=//td[text()='${business_service_name}']
    ${text}=    Get Text    xpath=//td[text()='${business_service_name}']
    Should Be Equal    ${text}    ${business_service_name}

verify whether the rows per page is working
    [Arguments]    ${rows_per_page}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Click Element    xpath=//div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
    Click Element    xpath=//li[@data-value="${rows_per_page}"]
    ${text}=    Get Element Count    xpath=//tr[@class='MuiTableRow-root MuiTableRow-hover css-1gqug66']
    Should Be Equal As Integers    ${text}    ${rows_per_page}













