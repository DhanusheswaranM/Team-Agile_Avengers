*** Settings ***
Documentation    This resource file is for the common home page functionality
Library    SeleniumLibrary

*** Variables ***
${Home_Btn}    css:svg[data-testid='MenuIcon']
${service_Btn}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[1]
${business_service}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[1]
${services}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[2]
${service_about}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[3]
${service_process}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[4]
${execution_by_client}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[5]
${execution_by_domain}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[6]
${placement_training_track}    xpath://div[@id='drawer']/div/ul/li[2]//following-sibling::li[1]/div[2]/div/div/div/div[7]

*** Keywords ***
Click the Home Button
    Click Element    ${Home_Btn}

Click the Service Button
    Click Element    ${service_Btn}

Click the Business Services
    Click Element    ${business_service}

CLick the Services
    Click Element    ${services}

Click the Service About
    Click Element    ${service_about}

Click the Service Process
    Click Element    ${service_process}

Click the Execution By Client
    Click Element    ${execution_by_client}

Click the Execution By Domain
    Click Element    ${execution_by_domain}

Click the Placement Training Track
    Click Element    ${placement_training_track}