***Settings***
Documentation    This file is for reusable keywords in services page
Library    SeleniumLibrary
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/LoginPage.robot
Library    DataDriver    file=C:\Agile-Avengers\Team-Agile_Avengers\Smartcliff_AA\Utility\AddServiceAbout.csv    encoding=utf_8    dialect=unix

Test Template    Fill the services about details 

***variables***
${services_aboutbtn}    xpath://span[contains(text(), 'Services About')]
${search_box}    xpath://input[@placeholder='Search services about...']
${add_serviceabt_btn}    xpath://span[@class="MuiButton-startIcon MuiButton-iconSizeMedium css-6xugel"]
${heading}    //input[@name='heading']
${sub_heading}    //input[@name='subHeading']
${feature_title}    //input[@name='title']
${submit_btn}    //button[@type='submit']
${edit_btn}    (//div[@class='MuiBox-root css-1i27l4i'])[5]
${update_btn}    //button[@type='submit']
${delete_btn}    (//button[@aria-label='Delete'])[5]

***keywords***
Open the Services About page 
    HomePage.Click the Home Button 
    sleep    5s  
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
    # Click Button    //input[@id='Business Services']

Enter dropdown values for adding new service about
     # Select From List By Value    //input[@id='Business Services']    B2B       
    Click Element    xpath=//input[@id='Business Services']
    Click Element    xpath=//li[text()='B2I']
    Click Element   xpath=//input[@id='service']
    Click Element    xpath=//li[text()='Internship']

Fill the services about details 
    [Arguments]    ${Heading_csv}    ${subheading_csv}    ${feature_title_csv}
    # loginPage.Login with valid credentials    ${common_user}    ${common_password}
    # Open the Services About page
    # Click the Add new service about button
    # Enter dropdown values for adding new service about
    Input Text    ${heading}     ${Heading_csv}
    Input text    ${sub_heading}     ${subheading_csv}
    Input Text    ${feature_title}     ${feature_title_csv}   
    Click submit data button

Click submit data button
    Click Button    ${submit_btn}

Click on the edit button
    Click Button    ${edit_btn}

Click on update button
    Click Button    ${update_btn}

Click the delete button
    Click Button    ${delete_btn}

   