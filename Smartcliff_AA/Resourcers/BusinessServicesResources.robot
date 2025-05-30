*** Settings ***
Documentation    This resources file is for resuable keywords and variables for Business Services functionality
Library    SeleniumLibrary
Library    Collections
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
@{service_names}    Create List


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
    Wait Until Element Is Visible    //div[@class='MuiTablePagination-root css-o9ey65']    10
    Scroll Element Into View    //div[@class='MuiTablePagination-root css-o9ey65']
    ${text}=    Get Text    xpath=//td[text()='${new_business_service_name}']
    Should Be Equal    ${text}    ${new_business_service_name}

# Add new business service
#     [Arguments]    ${new_business_service_name}
#     HomePage.Click the Home Button
#     HomePage.Click the Service Button
#     HomePage.Click the Business Services
#     Click Button    ${Add_Business_Service_Button}
#     Input Text    ${name}    ${new_business_service_name}
#     Input Text    ${title}    ${new_business_service_name}
#     Input Text    ${description}    This is a test description for ${new_business_service_name}
#     Input Text    ${slug}    slug
#     Click Element    xpath=(//div[@class='MuiDropzoneArea-root'])[1]
#     Choose File    ${image}    ${IMAGE_PATH}
#     Click Element    xpath=(//div[@class='MuiDropzoneArea-root'])[2]
#     Choose File    ${logo}    ${IMAGE_PATH}
#     Click Button    xpath=//button[@type='submit']
#     ${text}=    Get Text    xpath=//td[text()='${new_business_service_name}']
#     Should Be Equal    ${text}    ${new_business_service_name}
#     Click Button    xpath=(//button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-1h48b3'])[8]
#     Click Button    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
#     Wait Until Element Is Not Visible    xpath=//td[text()='${new_business_service_name}']
Add new business service
    [Arguments]    ${new_business_service_name}
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    
    # Add Business Service
    ${add_btn}=    Get WebElement    ${Add_Business_Service_Button}
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${add_btn}
    
    # Fill form
    Input Text    ${name}    ${new_business_service_name}
    Input Text    ${title}    ${new_business_service_name}
    Input Text    ${description}    This is a test description for ${new_business_service_name}
    Input Text    ${slug}    slug
    
    # Upload files
    ${dropzone1}=    Get WebElement    xpath=(//div[@class='MuiDropzoneArea-root'])[1]
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${dropzone1}
    Choose File    ${image}    ${IMAGE_PATH}
    
    ${dropzone2}=    Get WebElement    xpath=(//div[@class='MuiDropzoneArea-root'])[2]
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${dropzone2}
    Choose File    ${logo}    ${IMAGE_PATH}
    
    # Submit
    ${submit_btn}=    Get WebElement    xpath=//button[@type='submit']
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${submit_btn}
    
    # Verify creation
    Wait Until Page Contains Element    xpath=//td[text()='${new_business_service_name}']    timeout=10s
    ${text}=    Get Text    xpath=//td[text()='${new_business_service_name}']
    Should Be Equal    ${text}    ${new_business_service_name}
    
    # Enhanced delete with verification
    ${delete_btn}=    Get WebElement    xpath=//td[text()='${new_business_service_name}']/following::button[contains(@class,'MuiButton-outlinedError')][1]
    Execute JavaScript    arguments[0].scrollIntoView(true); arguments[0].click();    ARGUMENTS    ${delete_btn}
    
    # Wait for confirmation dialog
    Wait Until Element Is Visible    xpath=//div[contains(@class,'MuiDialog-container')]    timeout=15s
    
    ${confirm_delete}=    Get WebElement    xpath=//button[contains(@class,'MuiButton-containedError')]
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${confirm_delete}
    
    # Robust deletion verification
    Wait Until Element Is Not Visible    xpath=//td[text()='${new_business_service_name}']    timeout=15s
    ${deleted}=    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//td[text()='${new_business_service_name}']
    Run Keyword If    not ${deleted}    Fail    Business service '${new_business_service_name}' was not deleted
    Scroll Element Into View    xpath=//div[@class='MuiBox-root css-1mzb49p']

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

Storing the Business Service names in list and printing them
    HomePage.Click the Home Button
    HomePage.Click the Service Button
    HomePage.Click the Business Services
    ${text}=    Get Element Count    xpath=//td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-q34dxg'][1]
    Log To Console    Total Business Services: ${text}
    FOR    ${i}    IN RANGE    1    ${text}+1
        ${service_name}=    Get Text    xpath=(//td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-q34dxg'][1])[${i}]
        Append To List    ${service_names}    ${service_name}
    END
    Log To Console    \nBusiness Service Names List: ${service_names}











