*** Settings ***
Documentation        This resource file is resuable for service process page
Library    SeleniumLibrary
Library    Collections
Resource    ../Resourcers/ServicesAbout.robot

*** Variables ***
${add_Serviceprocess_btn}    //button[contains(text(),'Add Service Process')]
${search_process}    //input[@placeholder='Search services...']
${process_heading}    //input[@name='heading']
${update_data}    //button[contains(text(),'Update Data')]
${service_dropdwn}    //input[@id="service"]
${service_value}    //input[@value="Degree programming"]
${img_path}    ${CURDIR}${/}Images${/}image.png
${file_upload}    //input[@type='file']
${submit_process_btn}    //button[contains(text(),'Submit Process Data')]
@{expected_result}    Bussiness to instituion    Bussiness to instituion
${delete_process}    (//button[@aria-label='delete'])[5]

*** Keywords ***  
Open the Services Process Page
    HomePage.Click the Home Button 
    HomePage.Click the Service Button 
    HomePage.Click the Service Process

Fill the dropdown in service process
    Click Element    ${service_dropdwn}     
    Click Element    ${service_value}

Search process heading in the searchbox
    [Arguments]    ${search_process}
    Input Text       ${search_process}    inst

Verify service process search results displayed
    @{actual}    Get WebElements    //tbody[@class='MuiTableBody-root css-1xnox0e']//td[1]
    @{search_result}=    Create List
    FOR    ${ele}     IN     @{actual}
        ${text}=    Get Text    ${ele}
        Append To List    ${search_result}    ${text}
    END

    FOR    ${expected}    IN    @{expected_result}
        Should Contain    ${search_result}    ${expected}
    END

Enter process heading
    Input Text    ${process_heading}    demo process heading

Upload image for adding process data
    [Arguments]    ${img_path}
    ${upload_input}=    Set Variable    xpath://input[@type='file']    
    Choose File    ${upload_input}    ${img_path}
    Sleep    5

Click the Service Process
    Click Element    ${service_process}

Verify service process page opened
    Page Should Contain      Service Process Control

Click the Add new service process button
    Click Element    ${add_Serviceprocess_btn}

Enter dropdown values for adding new service process   
    Click Element    xpath=//input[@id='business-services']
    Click Element    xpath=//li[text()='CSR']
    Click Element   xpath=//input[@id='service']    
    Click Element    xpath=//li[text()='Degree programming']  

Click on submit process button
    Scroll Element Into View    ${submit_process_btn}    
    Click Element    ${submit_process_btn}
    Set Selenium Implicit Wait    10s
    Page Should Contain    demo process heading    

Click on the process edit button
    Click Element    ${edit_specific}

Search process to edit in the searchbox        
    Input Text       ${search_process}    Corporate social responsibility

Click on the edit button
    Click Button    ${edit_btn}

Click on update button
    Click Button    ${update_data}

Click the process delete button
    Click Button    ${delete_process}

click process confirm delete
    Click Element    ${confirm_dlt}

verify the process data deleted
    Page Should Not Contain    Corporate social responsibility
    

Edit the value of the process heading
    Click Element    ${process_heading}    
    Press Keys   ${process_heading}      CTRL+A    BACKSPACE
    Input Text    ${process_heading}      This is edited process heading   
    
verify process page is updated
    Set Selenium Implicit Wait    5   
    Page Should Contain    This is edited process heading         

click row dropdown of process page and get row count
    Click Element    ${row_dropdown}
    Set Selenium Implicit Wait    5
    Click Element    ${row_value}
    ${no_of_rows}=    Get WebElements    //tbody[@class='MuiTableBody-root css-1xnox0e']//tr
    ${count_of_rows}    Get Length    ${no_of_rows}
    Log To Console    Total row count:${count_of_rows}   






       