***Settings***
Documentation    This file is for reusable keywords in services page
Library    SeleniumLibrary
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot

***variables***
${services_aboutbtn}    xpath://span[contains(text(), 'Services About')]
${search_box}    xpath://input[@placeholder='Search services about...']
${add_serviceabt_btn}    xpath://span[@class="MuiButton-startIcon MuiButton-iconSizeMedium css-6xugel"]
${heading}    //input[@name='heading']
${sub_heading}    //input[@name='subHeading']
${feature_title}    //input[@name='title']
${submit_btn}    //button[contains(text(),'Submit Data')]
${edit_btn}    (//div[@class='MuiBox-root css-1i27l4i'])[4]//button[1]
${update_btn}    //button[contains(text(),'Update Service')]
${delete_btn}    (//button[@aria-label='Delete'])[5]
${img_path}     ${CURDIR}${/}Images${/}image.png
# ${img}    (//input[@type="file"])[1]    
# ${img}    //*[@id="root"]/div[1]/main/main/form/div/div[5]/div/div/div[4]/div/div[1]/svg
${demo_desc}    //textarea[@name="description"]
${confirm_dlt}    //button[contains(text(),'Delete')]
${edit_specific}    (//div[@class='MuiBox-root css-1i27l4i'])[1]//button[1]
${row_value}    //li[@data-value='5']
${row_dropdown}    //div[@class='MuiInputBase-root MuiInputBase-colorPrimary MuiTablePagination-input css-rmmij8']

***keywords***
Open the Services About page 
    HomePage.Click the Home Button 
    HomePage.Click the Service Button 
    HomePage.Click the Service About

Verify the Services About page opened
    Page Should Contain    text=Service About Panel

Search heading in the searchbox
    [Arguments]    ${search_box}
    Input Text       ${search_box}    HTD

Verify HTD search Result displayed
    # Page Should Contain Textfield    xpath://td[contains(text(),'Hire Train Deploy(HTD)')]
    Page Should Contain Element    xpath://td[contains(text(),'Hire Train Deploy(HTD)')]

Click the Add new service about button
    Click Element    ${add_serviceabt_btn}

Enter dropdown values for adding new service about  
    Click Element    xpath=//input[@id='Business Services']
    Click Element    xpath=//li[text()='B2I']
    Click Element   xpath=//input[@id='service']
    Click Element      xpath=//li[text()='COE']

Fill the services about details 
    [Arguments]    ${heading}     ${sub_heading}      ${feature_title}      
    Input Text    ${heading}     DemoHeading
    Input text    ${sub_heading}     Demosubheading
    Input Text    ${feature_title}     This is demo feature title
    Input Text    ${demo_desc}    Demo description
  
Upload Image File
    [Arguments]    ${img_path}
    ${upload_input}=    Set Variable    xpath://input[@type='file']    
    Choose File    ${upload_input}    ${img_path}
    Click Button    ${submit_btn}  

Click on the results edit button 
    Click Element    ${edit_specific}

Search edit heading in the searchbox 
    Input Text       ${search_box}    B2B Heading for testing

verify the data added
    Page Should Contain    DemoHeading   

Click on the edit button
    Click Button    ${edit_btn}

Click on update button
    Click Button    ${update_btn}

Click the delete button
    Click Button    ${delete_btn}

click confirm delete
    Click Element    ${confirm_dlt}

Edit the value of the feature title
    Click Element    ${feature_title}    
    Press Keys   ${feature_title}    CTRL+A    BACKSPACE
    Input Text    ${feature_title}    This is edited feature title   
    
verify page is updated
    # Set Selenium Implicit Wait    5   
    Wait Until Page Contains    This is edited feature title    timeout=10s     

verify the data deleted
    # Set Selenium Implicit Wait    5 
    # Page Should Not Contain    DemoHeadingcsv
    Wait Until Page Does Not Contain    DemoHeadingcsv    timeout=10s

click row dropdown and get row count
    Click Element    ${row_dropdown}
    Set Selenium Implicit Wait    5    
    Click Element    ${row_value}
    ${no_of_rows}=    Get WebElements    //tbody[@class='MuiTableBody-root css-1xnox0e']//tr
    ${count_of_rows}    Get Length    ${no_of_rows}
    Log To Console    Total row count:${count_of_rows}   





