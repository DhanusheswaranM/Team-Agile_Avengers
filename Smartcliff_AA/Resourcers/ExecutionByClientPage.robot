*** Settings ***
Documentation    This resource file is for reusable keywords and variables for Execution By Client page 
Library    SeleniumLibrary

*** Variables ***
${search_Highlight}    xpath://input[@id=':r7b:']
${add_Highlight}    xpath://div[@id='root']/div[1]/main/div[2]/div[1]/div/div[2]/button
${stack}    xpath://main[@class='MuiBox-root css-zxdg2z']/main/div[2]/form/div/div[3]/div/div/input
# ${stack}    xpath:(//div[@class='MuiFormControl-root MuiFormControl-fullWidth MuiTextField-root css-feqhe6'])[3]/div/input
${business_service_field}    css:input[id='Business Services']
${service_Field}    css:input[id='service']
${drop_zone}    xpath://main[@class='MuiContainer-root MuiContainer-maxWidthMd css-1c0cfyw']/form/div[3]/div
${image_path}    ${CURDIR}${/}Images${/}ThorHammer.jpg
${stack_field}    css:input[id='stack']
${stack_count_field}    css:input[id='count']
${submit_highlight_btn}    xpath://button[@type='submit']



*** Keywords ***

Click the Add Highlights
    Click Element    ${add_Highlight}

Check the Execution By Client Page 
    Page Should Contain    Execution Highlights Control

Edit and Check the Stack name
    [Arguments]    ${stack_Name}
    Log To Console    >>>Editing stack:${stack_Name}
    @{list_of_Stack_Name} =    Get WebElements    xpath://table[@class='MuiTable-root css-1owb465']/tbody/tr/td[1]
    ${i}=    Set Variable    1
    FOR    ${stack_names}    IN    @{list_of_Stack_Name}
        ${text} =    Get Text    ${stack_names}
        Log To Console    >>>Editing stack name:${text}
        
        IF    '${text}' == '${stack_Name}'
            ${edit_btn}=    Set Variable    xpath://table[@class='MuiTable-root css-1owb465']/tbody/tr[${i}]/td[3]/div/button[1]
            Click Element    ${edit_btn}
            Wait Until Page Contains Element    ${stack}    timeout=15s
            Sleep    5s
            BREAK
        END
        ${i}=    Evaluate    ${i}+1
    END
    
Get Stack Name
    Wait Until Page Contains Element    ${stack}    timeout=10s
    ${stackN} =    Get Element Attribute    ${stack}    value
    Return From Keyword    ${stackN}

Add New Execution By Client
    [Arguments]    ${business_service_name}    ${service_name}    ${stack_naming}    ${stack_count}
    Select From Autocomplete    ${business_service_field}    ${business_service_name}
    Select From Autocomplete    ${service_Field}    ${service_name}
    # Click Element    ${drop_zone}
    ${filepath} =    Set Variable    css:input[type="file"][accept="image/*"]

    Choose File    ${filePath}    ${image_path}
    Input Text    ${stack_field}    ${stack_naming}
    Input Text    ${stack_count_field}    ${stack_count}
    Click Button    ${submit_highlight_btn}
    Sleep    5s

Select From Autocomplete
    [Arguments]    ${input_locator}    ${text}    ${option_index}=1
    Click Element    ${input_locator}
    Input Text    ${input_locator}    ${text}
    Wait Until Element Is Visible    xpath=//ul[contains(@class,'MuiAutocomplete-listbox')]//li[${option_index}]    timeout=5s
    Click Element    xpath=//ul[contains(@class,'MuiAutocomplete-listbox')]//li[${option_index}]

Searching the stack Name 
    [Arguments]    ${Search_stack_name}
    Click Element    ${search_Highlight}
    Input Text    ${search_Highlight}    ${Search_stack_name}
    Page Should Contain    ${Search_stack_name}