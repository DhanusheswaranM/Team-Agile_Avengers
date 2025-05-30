*** Settings ***
Documentation    This resource file provide the reusable keywords and variable for the placement training track page
Library    SeleniumLibrary

*** Variables ***
${search_placement}    xpath://input[@placeholder='Search placement training tracks...']
${add_placement}    xpath://div[@id='root']/div[1]/main/div[2]/div[1]/div/div[2]/button
${dropDown_Numbers}    xpath://div[@class='MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation3 css-wuddwm']/div[2]/div/div[2]/div
${business_services_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-1uvydh2'])[1]
${services_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-1uvydh2'])[2]
${track_name_field}    css:input[name='trackName']
${proposed_hours_field}    css:input[name='proposedHour']
${no_of_days_field}    css:input[name='noOfDays']
${objective_field}    css:textarea[name='objecttive']
${module_name_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[4]
${module_hour_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[5]
${module_days_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[6]
${module_level_name_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[7]
${module_level_training_hours_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[8]
${module_level_traing_days_field}    xpath:(//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq'])[9]
${remarks_field}    xpath:(//textarea[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline css-u36398'])[3]
${submit_training_track_btn}    xpath://form[@class='MuiBox-root css-yd8sa2']/button[3]
${delete_btn}    css:button[class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']

*** Keywords ***

Check the Placement Training Track Page 
    Page Should Contain    Training Track Panel

Searching the Placement Track Name
    [Arguments]    ${placement_track_name}
    Input Text    ${search_placement}    ${placement_track_name}
    Set Browser Implicit Wait    5s
    Sleep    5s
    # ${is_present} =    Page Should Contain    ${placement_track_name}
    ${is_present} =    Run Keyword And Return Status    Page Should Contain    ${placement_track_name}
    IF    not ${is_present}
        Log To Console    >>>The placement track is not there as ${placement_track_name}
    END
    
Click Add placement training track
    Click Element    ${add_placement}

Enter the placement details
    [Arguments]    ${business_service_name}    ${service_name}    ${track_name}    ${proposed_hours}    ${no_of_days}    ${semester}    ${objective}    ${module_name}    ${module_hours}    ${module_no_of_days}    ${module_level}    ${module_training_hours}    ${module_training_days}    ${module_remark}
    Select From Autocompleting    ${business_services_field}    ${business_service_name}
    Select From Autocompleting  ${services_field}    ${service_name}
    Input Text    ${track_name_field}    ${track_name}
    Input Text    ${proposed_hours_field}    ${proposed_hours}
    Input Text    ${no_of_days_field}    ${no_of_days}

    Click Element    xpath://div[@class='MuiFormGroup-root MuiFormGroup-row css-p58oka']/label[${semester}]/span[1]

    Scroll Element Into View    ${objective_field}
    Input Text    ${objective_field}    ${objective}
    Input Text    ${module_name_field}    ${module_name}
    Input Text    ${module_hour_field}    ${module_hours}
    Input Text    ${module_days_field}    ${module_no_of_days}
    Input Text    ${module_level_name_field}    ${module_level}
    Input Text    ${module_level_training_hours_field}    ${module_training_hours}
    Input Text    ${module_level_traing_days_field}    ${module_training_days}
    Input Text    ${remarks_field}    ${module_remark}

    # Wait Until Element Is Visible    ${submit_training_track_btn}
    Click Element    ${submit_training_track_btn}
    Page Should Contain    ${track_name}
    # Sleep    5s

Select From AutoCompleting
    [Arguments]    ${input_locator}    ${text}    ${option_index}=1
    Click Element    ${input_locator}
    Input Text    ${input_locator}    ${text}
    Wait Until Element Is Visible    xpath=//ul[contains(@class,'MuiAutocomplete-listbox')]//li[${option_index}]    timeout=5s
    Click Element    xpath=//ul[contains(@class,'MuiAutocomplete-listbox')]//li[${option_index}]

Deleting the track name
    [Arguments]    ${track_name_remove}
    @{list_of_track_placement} =    Get WebElements    xpath://tbody[@class='MuiTableBody-root css-1xnox0e']/tr/td[2]

    ${i} =    Set Variable    1
    FOR    ${track_placement}    IN    @{list_of_track_placement}
        ${remove_text} =    Get Text    ${track_placement}
        Log To Console    >>>>${remove_text}
        IF    '${remove_text}' == '${track_name_remove}'
            ${delete_name} =    Set Variable    xpath://tbody[@class='MuiTableBody-root css-1xnox0e']/tr[${i}]/td/div/button[2]
            Click Element    ${delete_name}
        END
        ${i} =    Evaluate    ${i}+2
    END
    Click Element    ${delete_btn}

Retrive the data from table
    @{list_of_Placement_details} =    Get WebElements    xpath://table[@class='MuiTable-root css-1owb465']/tbody/tr/td[2]
    # ${i} =    Set Variable    1
    FOR    ${placement}    IN    @{list_of_Placement_details}
        # ${Head} =    Get WebElement    xpath://tr[@class='MuiTableRow-root MuiTableRow-head css-ome0r3']/th[${i}]
        # ${text} =    Get Text    ${Head}
        ${text} =    Get Text    ${placement}
        Log To Console    >>>>${text}
        # ${i} =    Evaluate    ${i}+1
    END
    