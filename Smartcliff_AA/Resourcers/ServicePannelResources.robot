*** Settings ***
Documentation    This resources file is for resuable keywords and variables for Services Panel functionality
Library    SeleniumLibrary
Library    Collections
Resource    ../Resourcers/LoginPage.robot
Resource    ../Resourcers/HomePage.robot

*** Variables ***
${ServicePanel_text}    xpath=//h4[text()='Service Pannel']
${IMAGE_PATH}    ${CURDIR}${/}images${/}superman-justice-league-2017-zack-snyder-s-justice-league-hd-wallpaper-3b359d9226042a5b59ace600fdcd5400.jpg
${Add_Service_Button}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ia5r0']
${name}    name:name
${title}    name:title
${description}    xpath=(//textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398'])[1]
${slug}    name:slug
${image}    xpath=(//input[@type='file'])[1]
${logo}    xpath=(//input[@type='file'])[2]


*** Keywords ***
Click Service Panel
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    ${text}=    Get Text    ${ServicePanel_text}
    Should Be Equal    ${text}    SERVICE PANNEL

Edit already existing service
    [Arguments]    ${new_service_name}    
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Click Element    xpath=//div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
    Click Element    xpath=//li[@data-value="25"]
    Click Element    xpath=(//button[@tabindex="0"])[21]
    Wait Until Element Is Visible    xpath=//div[@class='MuiBox-root css-1q7mlj7']
    Scroll Element Into View    //div[@class='MuiBox-root css-1q7mlj7']
    Click Element    (//div[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]/input)[1]
    Sleep    2s
    Press Keys    None    CTRL+A
    Press Keys    None    DELETE
    Click Element    (//div[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]/input)[1]
    Input Text    (//div[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]/input)[1]    ${new_service_name}
    Click Button    xpath=//button[@type='submit']
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Click Element    xpath=//div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
    Click Element    xpath=//li[@data-value="25"]
    ${text}=    Get Text    xpath=//td[text()='${new_service_name}']
    Should Be Equal    ${text}    ${new_service_name}

Add new service
    [Arguments]    ${new_service_name}    ${BusinessServices}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    Click Button    ${Add_Service_Button}
    Input Text    ${title}    ${new_service_name}
    Input Text    ${description}    This is a test description for ${new_service_name}
    Input Text    ${slug}    slug
    Click Element    xpath=(//div[@class='MuiDropzoneArea-root'])
    Choose File    xpath=(//input[@type='file'])    ${IMAGE_PATH}
    Click Element    xpath=//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-1uvydh2']
    Input Text    xpath=//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-1uvydh2']    ${BusinessServices}
    Wait Until Element Is Visible    xpath=//ul[contains(@class,'MuiAutocomplete-listbox')]//li[1]    timeout=5s
    Click Element    xpath=//ul[contains(@class,'MuiAutocomplete-listbox')]//li[1]
    Click Button    xpath=//button[@type='submit']
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Click Element    xpath=//div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
    Click Element    xpath=//li[@data-value="25"]
    ${text}=    Get Text    xpath=//td[text()='${new_service_name}']
    Should Be Equal    ${text}    ${new_service_name}
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Click Button    xpath=(//button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-1h48b3'])[10]
    Click Button    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Wait Until Element Is Not Visible    xpath=//td[text()='${new_service_name}']

Search Service
    [Arguments]    ${service_name}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    Input Text    xpath=//input[@type='text']    ${service_name}
    Wait Until Element Is Visible    xpath=//td[text()='${service_name}']
    ${text}=    Get Text    xpath=//td[text()='${service_name}']
    Should Be Equal    ${text}    ${service_name}

verify whether the rows per page is working
    [Arguments]    ${rows_per_page}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    Scroll Element Into View    xpath=//input[@class='MuiSelect-nativeInput css-1k3x8v3']
    Click Element    xpath=//div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']
    Click Element    xpath=//li[@data-value="${rows_per_page}"]
    ${text}=    Get Element Count    xpath=//tr[@class='MuiTableRow-root MuiTableRow-hover css-1gqug66']
    Should Be Equal As Integers    ${text}    ${rows_per_page}

Storing the service names in list and printing them
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Services
    ${elements}=    Get WebElements    xpath=//td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-q34dxg'][1]
    ${service_names}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${service_names}    ${text}
    END
    Log To Console    \nService Names: ${service_names}
