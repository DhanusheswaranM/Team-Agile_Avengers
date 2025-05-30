*** Settings ***
Documentation    This file is to testing the adding the execution highlight
Library    SeleniumLibrary
Test Setup    Open the website with the browser
Test Teardown    Close Browser Session
Resource    ../Resourcers/GenericResources.robot
Resource    ../Resourcers/HomePage.robot
Resource    ../Resourcers/PlacementTrainingTrackResources.robot

*** Variables ***
${placement_track_name}    Full Stack
${track_name_remove}    Soft Skills Training    

*** Test Cases ***                                       

Verify the Placement Training Track Page
    [Tags]    Regression
    HomePage.Common Login
    HomePage.Click the Placement Training Track
    PlacementTrainingTrackResources.Check the Placement Training Track Page

Search the placement Track name
    [Tags]    regression
    HomePage.Common Login
    HomePage.Click the Placement Training Track
    PlacementTrainingTrackResources.Searching the Placement Track Name    ${placement_track_name}

Delete the Track name
    [Tags]    Regression
    HomePage.Common Login
    HomePage.Click the Placement Training Track
    ${Is_Present} =    Run Keyword And Return Status    Page Should Contain    ${track_name_remove}
    # Page Should Contain    ${track_name_remove}    ${Is_Present} = True
    IF    ${Is_Present}
        PlacementTrainingTrackResources.Deleting the track name    ${track_name_remove}
        Page Should Contain    Training Track Panel
    ELSE    
        Log To Console    >>>${track_name_remove} is not it the list  
    END
    
Retriving the Placement Details from the table
    [Tags]    Sanity
    HomePage.Common Login
    HomePage.Click the Placement Training Track
    PlacementTrainingTrackResources.Retrive the data from table