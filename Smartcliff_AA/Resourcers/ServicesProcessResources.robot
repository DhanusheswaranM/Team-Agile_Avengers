*** Settings ***
Documentation        This resource file is resuable for service process page
Library    SeleniumLibrary
Library    Collections
Resource    ../Resourcers/ServicesAbout.robot

*** Variables ***
${add_Serviceprocess_btn}    //button[contains(text(),'Add Service Process')]
${search_process}    //input[@placeholder='Search services...']
${process_heading}    //input[@name='heading']
${service_dropdwn}    //input[@id="service"]
${service_value}    //input[@value="Degree programming"]
${img_path}    ${CURDIR}${/}Images${/}image.png
${file_upload}    //input[@type='file']
${submit_process_btn}    //button[contains(text(),'Submit Process Data')]
@{expected_result}    Bussiness to instituion    Bussiness to instituion

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
    [Arguments]    ${img}    ${img_path}
    ${upload_input}=    Set Variable    xpath://input[@type='file']    
    Choose File    ${upload_input}    ${img_path}
    Sleep    5

Click the Service Process
    Click Element    ${service_process}

Verify service process page opened
    Page Should Contain      Service Process Control

       