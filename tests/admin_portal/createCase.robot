*** Settings ***
Documentation        Scripts for Plus Admin Create Cases
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Plus Admin Portal
Test Setup           Go to Plus Admin Portal
Test Teardown        Capture Page If Test Failed  #Capture Failed and Close All Browsers 
Suite Teardown       Close All Browsers
Force Tags           PLUS12

***Test Cases***
PLUS_12.1_001-User wants to create new case
    [Tags]  Smoke
    Given User Landing on Plus Admin Page to Create New Case
    When User Input All Field With Valid Data       ${NOPO}
    Then User Able Submit Create New Case Data
    
PLUS_12.2_001-User wants to access allocation inbox
    Given User Want to Login using selected User   OIC 1 
    When Landing to Menu    Allocation Inbox
    Then User able to Access    Allocation Inbox
    And Case Display under Selected User

PLUS_12.2_002-User as X=? Officer wants to access allocation inbox
    Given User Want to Login using selected User   Jenny
    When User Try to Access Allocation Inbox
    Then Allocation Inbox not Display
    And User Cannot Access Allocation Inbox

#PLUS_12.2_003-User using PLM officer access allocation inbox, then change user which did not have access to process the case


#PLUS_12.3_001
PLUS_12.4_001-User wants to add single Appellant upon creating case
    Given User Landing on Appellant Details Tab
    When Input Data on Appellant Details Tab       ${NRIC}   ${PostalCode}
    Then User Able to Input Data on Field

PLUS_12.4_001B-User wants to add single Appellant upon creating case but input invalid ID number
    Given User Landing on Appellant Details Tab
    When Input Costumer with invalid ID Number
    Then Alert Message Should Display

PLUS_12.4_002A-User wants to input multiple Appellant upon creating case
    Given User Landing on Appellant Details Tab
    When Add Multiple Appellant
    Then User Able to Add Multiple Appellant

PLUS_12.4_002B-User edit created Appellant in add Appellant menu
    Given User Already add Multiple Costumer
    When User Want to Edit Existing Appellant
    Then Able to Edit Appellant

PLUS_12.4_002C-User wants to input multiple Appellant upon creating case
    Given User Landing on Appellant Details Tab
    When Add Multiple Appellant
    Then User Able to Add Multiple Appellant

PLUS_12.4_002D-User wants to add Appellant upon creating case using invalid data
    Given User Landing on Appellant Details Tab
    When User Input Multiple Appellant with invalid Data
    Then Alert Message Should Display

PLUS_12.4_003-User as PLM officer inputs customers address details using onemap
    Given User Landing on Appellant Details Tab
    When Get Address with Input  ${PostalCode}
    Then Address is Auto-populated

PLUS_12.4_004-User as PLM officer inputs invalid customers address details using onemap 
    Given User Landing on Appellant Details Tab
    When Get Address with Input  ${InvalidPostalCode}
    Address is Not Auto-populated

PLUS_12.4_005A-User wants to fill all the address field to complete the Appellant Details address
    Given User Landing on Appellant Details Tab
    When Get Address with Input  ${PostalCode}
    Mailing Address is Auto-populated

PLUS_12.4_005B-User as PLM officer does not want to fill mailing address manually but using copy from registered address instead
    Given User Select Case to Edit
    When Mark Checkbox Copy From Registered Address
    Then Mailing Address auto-populated similar with Registered Address
    
PLUS_12.4_005C-User wants to edit registered mailing address when user forgot to uncheck the checkbox
    Given User Select Case to Edit
    When Change Mailing Address
    Then Unable to Edit Mailing Address 

PLUS_12.5_001-User wants to create case with fill all the field
    Given User Landing on Plus Admin Page to Create New Case
    When User Input All Field With Valid Data       ${NOPO}
    Then User Able Submit Create New Case Data

PLUS_12.5_002-User forgot/skip the fill some of the mandatory fields
    Given User Landing on Plus Admin Page to Create New Case
    When Input Data but forget Case Title
    Then User Will See Missing Data Alert

PLUS_12.5_003-User wants to describe case description
    Given User Landing on Plus Admin Page to Create New Case
    When Input Case Description
    And Description Characters Count Display

PLUS_12.5_004-User wants to input officer remark
    Given User Landing on Plus Admin Page to Create New Case
    When Input Officer Remark
    Then Officer Remark Characters Count Display

PLUS_12.6_001A-User attach file in case creating form for customer, officer document and supporting document using designated file format
    Given User Landing on Plus Admin Page to Create New Case
    When Upload Attachment with  ${supportFile1}  ${supportFile2} 
    Then User See Attachment List

PLUS_12.6_001B-User attach file in case creating form for customer, officer document and supporting document using non designated file format
    Given User Landing on Plus Admin Page to Create New Case
    When Upload Attachment with  ${unsupportFile2}  ${unsupportFile2}
    Then User See Error Message Failed Attach File

PLUS_12.6_001C-User upload document exceeding file size limit for one file
    Given User Landing on Plus Admin Page to Create New Case
    When Upload Attachment with   ${bigFile}   ${bigFile}
    Then Exceed File Size Error Display

# handle on manual
#PLUS_12.6_001C-User upload document exceeding file size limit using multiple file document
    #Given User Landing on Plus Admin Page to Create New Case
    #When Attach Multiple File until Exceeed Designate size
    #Then Exceed File Size Error Display

#?Still Figuring out how to automate
#PLUS_12.6_002-User did not know information about upload document for cust, officer doc and supporting doc
#PLUS_12.6_003A-User uses drag and drop~
#PLUS_12.6_003B-User uses drag and drop

PLUS_12.7_001-User describes his created case via drop down menu
    Given User Landing on Profile Tab
    When Input Data on Profile Tab
    Then User Able to Input Data with Dropdown Menu
    And Performance Day Auto-Generate
    
#PLUS_12.7_002-User decided to revise his case
#Non Exist Feature
PLUS_12.7_003A-User as PLM officer fills up add work area for user
    Given User Landing on Profile Tab
    When Add Work Area
    Then User Able to Select Work Area

PLUS_12.7_003B-User unintentionally add same work area in creating case
    Given User Landing on Profile Tab
    When User try to Select Same Work Area
    Then User Cannot Select Same Work Area  #! Need to change Assertion Later

PLUS_12.7_004-User wants to change and edit his work area
    Given User Already Add Work Area
    When User Want Delete Work Area
    Then Able to Edit Work Area

PLUS_12.8_001-User wants to define I am the driver for the created case
    Given User Landing on Plus Admin Page to Create New Case
    When Mark Checkbox Driver Status
    Then User Able to Choose Driver Status

PLUS_12.9_001-User wants to input data on reference case search
    Given User Landing on Reference Case Tab
    When Search for Reference Case   ${NOPO}  
    Then User Able to Input Data on Reference Case Search

PLUS_12.9_002A-User want to search existed reference case
    Given User Landing on Reference Case Tab
    When Search for Reference Case        ${NOPO}
    Then Search Reference Case Result Display

PLUS_12.9_002B-User want to search non existing reference case
    Given User Landing on Reference Case Tab
    Search for Reference Case       11111
    Then User See No Record to Display

PLUS_12.10_001A-User as PLM officer wants to add single NOPO as reference case
    Given User Landing on Reference Case Tab
    When Add Reference Case    ${NOPO}
    Then User Able Add NOPO as Reference Case   ${NOPO}

PLUS_12.10_001B-User as PLM officer wants to add multiple NOPO as reference case
    Given User Landing on Reference Case Tab
    When Add Multiple Reference Cases 
    Then User Able to Add Multiple Nopo
#!
PLUS_12.10_002A-User found same offence happens with similar driver and use selected NOPO for assign appellant as Driver
    Given User Select Case to Edit
    When User Assign Appellant As Driver 
    Then User Able to Assign Nopo to Appellant
    And Notice data is Update on OCMS 

#!appelant is mandatory
PLUS_12.10_002B-User assign appellant as a driver while no Appellant is added yet
    Given User Landing on Plus Admin Page to Create New Case
    When User Wants Assign Driver without Fill Appellant Details
    Then No Appellant Display
    And Notice data not Update on OCMS

PLUS_12.10_003-User wants to close assign appellent as driver
    Given User Select Case to Edit
    When User Close Assign Appellant as Driver
    Then Driver Should Able to Close Up Pop up Window 

#! Need to confirmed
#PLUS_12.10_004-User as enforcement officer able to view updated driver details from PLUS reference case after successful assign
    #User Landing on Plus Admin Page to Create New Case
    #User Input All Field With Valid Data       ${NOPO}
    #User Able Submit Create New Case Data
    #Click Edit Case Button
    #Delete Added Appelant
    #Add Multiple Appellant
    #User Assign Appellant as Driver 
    #User Able to Assign Nopo to Appellant
    #When User Want to Re-Assign Appellant 
    #Then User Able to Change Driver Assign

PLUS_12.10_005A-User as enforcement officer wants to select NOPO decision dropdown
    Given User Access Reference Case tab by Inbox entry point
    When User Submit NOPO to Selected NOPO decision 
    Then User Able to Submit NOPO to Selected type

PLUS_12.10_005B-User as enforcement officer wants to select NOPO decision dropdown without selecting reference case
    Given User Access Reference Case tab by Inbox entry point
    When User Submit Selected NOPO Decision without Select NOPO
    Then User See Error Message NOPO not Selected

PLUS_12.10_006A-User as enforcement officer wants to select Functionality
    Given User Access Reference Case tab by Inbox entry point
    When User Submit NOPO to Selected Functionality
    Then User Able to Submit NOPO Functionality    

PLUS_12.10_006B-User not select reference case when select Functionality
    Given User Access Reference Case tab by Inbox entry point
    When User Submit Selected NOPO Functionality without Select NOPO
    Then User See Error Message NOPO not Selected

#PLUS_12.11 >> API Testing
#!Check later  failed when to search case
PLUS_12.12_001-User wants to assign case to selected OIC
    Given User Already Fill field
    When User save case with assigned OIC
    Then Able to Assign Case to OIC
    And Saved case will display to personal inbox

#check later
PLUS_12.13_001-User wants to save currently composed case as draft
    Given User Already Fill Appellant Details Field
    When User save case with assigned OIC
    Then User Success Save Case as Draft    

#PLUS_12.14_001-User wants to send request POST to Intranet API with parameter NOPO, TS, Case Number and OIC    
#PLUS_12.15_001
#PLUS_12.16_001

PLUS_12.17_001-User as PLM officer able to define reply feature using dropdown menu
    Given User Landing on Reply tab with Appellant Details Data
    When Input Data on Reply tab
    Then User Able to Input all Field
    
PLUS_12.17_002A-User wants to upload file on reply section
    Given User Landing on Reply tab with Appellant Details Data
    When Input Data on Reply tab
    Then User Able to Input all Field

PLUS_12.17_002B-User wants to upload undesignated format file on reply section
    Given User Landing on Reply tab
    When Upload Reply Attachment with        ${unsupportFile}
    Then Failed to Upload Attachment 
    
PLUS_12.17_002C-User wants to upload exceed designated size on reply section
    Given User Landing on Reply tab
    When Upload Reply Attachment with        ${bigFile}
    Then Failed to Upload Attachment

PLUS_12.17_003-User see auto-suggest for mail section
    Given User Landing on Reply tab with Appellant Details Data
    Input Reply Destination
    Then Able to Input Email Direction by Suggestion

PLUS_12.17_004-User add email on CC and or BCC
    Given User Landing on Reply tab
    When Input Email on CC and BCC
    Then User Able to Input Email CC and BCC

PLUS_12.17_005-User wants to input text with maximum character
    Given User Landing on Reply tab
    When Input Remark with Maximum Characters
    Then Character count display inputted data

PLUS_12.18_001-User wants to review sumbited data
    Given User Landing on Plus Admin Page to Create New Case
    When User Input All Field With Valid Data       ${NOPO}
    Then Review Inputted Data

#? Need to confirming later about history feature
PLUS_12.19_001-User as PLM officer wants to filter out the data displays to make it much easier to filter
    Given User Select Case to Edit
    When User want to search History within date range  Case History
    Then Filter Search Funtion Display

PLUS_12.19_002-User as PLM Officer want to check updated history in case history
    Given User Select Case to Edit
    And Make Change on OIC Assigment
    When User want to search History within date range  Case History
    Then Search Result within date range Display
    And Able to Sort Case History

PLUS_12.19_003-User as PLM officer want to check case history regarding OIC assigment
    Given User Select Case to Edit
    And Make Change on OIC Assigment
    When User want to search History within date range  OIC Assignment
    Then Search Result within date range Display
    Able to Sort OIC Assigment

#FIx After all nopo decision is ready
PLUS_12.19_004-User wants to check history session upon NOPO decision status change
    Given User Select Story on Green tag
    And Make Change on NOPO Decision
    When User want to search History within date range  PLUS NOPO Decision
    #Then Search Result within date range Display
    Then Able to Sort NOPO Decision
    
#Need to Confirmed
PLUS_12.19_005-User as PLM officer wants to check endorsement status and its progress
    Given User in Selected Inbox    Inbox       ${casenum}
    User wants Access History Tab by Edit Case
    User want to search History within date range   Endorsement
    Then Search Result within date range Display

PLUS_12.19_006A-As PLM officer (user) wants to download file to have documentatation upon history page
    Given User Already Search for History
    When Click Button on     Download
    Then Able to Download history

#PLUS_12.19_006B-As PLM officer (user) wants to download file to have documentatation upon history page 