*** Settings ***
Documentation    This file to test the arguments are passsing through the csv file
Library    SeleniumLibrary
Library    DataDriver    file=../Utility/AddPlacement.csv   encoding=utf_8    dialect=unix
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/PlacementTrainingTrackResources.robot
Test Template    Add the newplacement training details

*** Variables ***
${business_service_name}
${service_name}
${track_name}
${proposed_hours}
${no_of_days}
${semester}
${objective}
${module_name}
${module_hours}
${module_no_of_days}
${module_level}
${module_training_hours}
${module_training_days}
${module_remark}

*** Test Cases ***
Adding the new Placement Tracking
    ${business_service_name}    ${service_name}    ${track_name}    ${proposed_hours}    ${no_of_days}    ${semester}    ${objective}    ${module_name}    ${module_hours}    ${module_no_of_days}    ${module_level}    ${module_training_hours}    ${module_training_days}    ${module_remark}

*** Keywords ***
Add the newplacement training details
    [Arguments]    ${business_service_name}    ${service_name}    ${track_name}    ${proposed_hours}    ${no_of_days}    ${semester}    ${objective}    ${module_name}    ${module_hours}    ${module_no_of_days}    ${module_level}    ${module_training_hours}    ${module_training_days}    ${module_remark}
    HomePage.Common Login
    HomePage.Click the Placement Training Track
    PlacementTrainingTrackResources.Click Add placement training track
    PlacementTrainingTrackResources.Enter the placement details    ${business_service_name}    ${service_name}    ${track_name}    ${proposed_hours}    ${no_of_days}    ${semester}    ${objective}    ${module_name}    ${module_hours}    ${module_no_of_days}    ${module_level}    ${module_training_hours}    ${module_training_days}    ${module_remark}

