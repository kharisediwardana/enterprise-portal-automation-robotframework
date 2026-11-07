*** Settings ***
Documentation           This is automation of Enterprise Portal Automation Suite On Permanen Suspension Process
Resource                ../../resources.robot
Suite Setup             Open Browser and Go to Page OCMS 5
Test Setup              Go to OCMS5 Page
Test Teardown           Capture Page If Test Failed 
Suite Teardown          Close All Browsers
Force Tags              OCMS18

***Test Cases***
TC_OCMS_18.1_01-User as Notice Processing Officer search notice to process PS using valid data search via Notice number
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPO2}
    Then Search Result Display Correctly            ${NOPO2} 

TC_OCMS_18.1_01B-User as Notice Processing Officer search notice to process PS using valid data search via vehicle number
    Given Landing on Notices Page
    When User Search Notice Using   Vehicle Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

TC_OCMS_18.1_01C-User as Notice Processing Officer search notice to process PS using valid data search via Summon number
    #Given Landing on Notices Page
    #When User Search Notice Using   Summon Number        ${VehicleNum}
    #Then Search Result Display Correctly                ${VehicleNum}

TC_OCMS_18.1_01D-User as Notice Processing Officer search notice to process PS using valid data search via Warrant number
    #Given Landing on Notices Page
    #When User Search Notice Using   Warrant Number        ${VehicleNum}
    #Then Search Result Display Correctly                ${VehicleNum}

TC_OCMS_18.1_01E-User search non existing data search
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number      341000398A
    Then User See No Record to Display

TC_OCMS_18.1_02A-User searches the notice using advance search by ID type
    [Tags]  Duplicate   #OCMS 17.4
    Given Landing on Notices Page
    When Search Advance by ID Type Using        S7450757C
    Then Advance Search Display Correct Data    (NRIC) S7450757C
    
TC_OCMS_18.1_02B-User searches the notice using advance search by offender type
    Given Landing on Notices Page
    When User advance search using offender type
    Then Able to advance search using offender type

TC_OCMS_18.1_02C-User searches the notice using advance search by notice type
    Given Landing on Notices Page
    When User advance search using notice type
    Then Able to Advance Search using Notice type
   
TC_OCMS_18.1_02D-User searches the notice using advance search by rule code
    Given Landing on Notices Page
    When User advance search using Rule Infernged
    Then Able to advance search using rule infernged

#TC_OCMS_18.1_02E-User searches the notice using advance search by date of offence
#TC_OCMS_18.1_02F-User searches the notice using advance search by suspension type
#Cannot edit notice
TC_OCMS_18.1_02G-User searches the notice using advance search by Reason of Suspension
    Given Landing on Notices Page
    And User Want see Advance Search
    When User advance search using Reason of Suspension
    Then Able to advance search using Reason of Suspension
   
TC_OCMS_18.1_02H-User searches the notice using advance search by Vehicle registrasion type
    Given Landing on Notices Page
    When User advance search using Vehicle registration type
    Then Able to advance search using vehicle registration type

#TC_OCMS_18.1_02I-User searches the notice using advance search by NTAC number

TC_OCMS_18.1_02J-User searches the notice using advance search with invalid data
    Given Landing on Notices Page
    When Search Advance by ID Type Using      S5242815G
    Then Search Result Show no Records
    
TC_OCMS_18.2_01-User downloads csv file template to search the notice
    Given Landing on Notices Page
    When User wants to Download CSV Search Template
    Then Able to Download CSV Search Template

TC_OCMS_18.2_02A-User upload CSV file format to search the notice with valid and correct data
    [Tags]  Duplicate   #OCMS 17.3
    Given Landing on Notices Page
    When Search notice by Upload CSV using              ${searchCSV}  
    Then Search Result using CSV display Correctly        ${NOPO}  ${NOPO2}  ${NOPO3}

TC_OCMS_18.2_02B-User upload CSV file format to search the notice with empty data
     [Tags]  Duplicate   #OCMS 17.3
    Given Landing on Notices Page
    When Search notice by Upload CSV Using      ${EmptyCSV}
    Then User See No Record to Display

TC_OCMS_18.2_02C-User upload CSV file format to search the notice using invalid CSV file format
    [Tags]  Duplicate   #OCMS 17.3
    Given Landing on Notices Page
    When Upload CSV search with invalid format      ${xlsx}
    Then Modal Window Text is    File format is not acceptable.

#TC_OCMS_18.2_02D-User upload CSV file format to search the notice with wrong notice data
#TC_OCMS_18.2_02E-User upload CSV file format to search the notice with missing some non mandatory data

TC_OCMS_18.3_01A-User searches and inputs invalid notice number format
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number        ${invalidNumber}
    Then Error Message Display
#TC_OCMS_18.3_01B-User searches and inputs invalid summon number format
#TC_OCMS_18.3_01C-User searches and inputs invalid warrant number format
TC_OCMS_18.3_02-User inputs invalid singapore vehicle number format
    [Tags]  Duplicate  #ocms 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Vehicle Number        ${invalidNumber}
    Then Error Message Display
#TC_OCMS_18.3_03-User searches and inputs empty notice number
#TC_OCMS_18.3_04-User searches and inputs empty summon number
#TC_OCMS_18.3_05-User searches and inputs empty warrant number 
#TC_OCMS_18.3_06-User inputs empty singapore vehicle number 

TC_OCMS_18.4_01-User selects notice that need to PS using notice description displayed on the page
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number           ${NOPO2}
    Then Search Result Display Column with Several Data     ${NOPO2}
    
TC_OCMS_18.5_01-Upon taking a look at first glance, user decided to take a look into notice details and open the notice
    [Tags]  Duplicated  #17.5
    Given Landing on Notices Page
    When User Wants to View Single Notice   ${NOPO2}  
    Then Details of Notice Display      ${NOPO2}

TC_OCMS_18.5_02A-Upon taking a look at first glance, user decided to take a look into multiple notices details and open all of the notices using checkbox provided in the left panel manually
    [Tags]  Duplicated  #17.5
    Given Already Search with Multiple Result   ${VehicleNum}
    When Select Multiple Notice to View
    Then Able to View Details of Multiple Notices

TC_OCMS_18.5_02B-Upon taking a look at first glance, user decided to take a look into multiple notices details and open all of the notices using master panel in the left to select all the record displayed in the page with maximum 10 notices
    [Tags]  Duplicated  #17.5
    Given Already Search with Multiple Result   ${VehicleNum}
    When Select All Notice on Search Result
    Then Able to View all Selected Notices

TC_OCMS_18.5_03A-User selects 1 notice to apply PS provided in the page via dropdown 
    Given Already Select Notice to Apply Operation              ${NOPOTS}
    When Apply Permanent Suspension to Selected Notice          ${NOPOTS}
    Then Able to Apply Permanen Suspension to Selected Notice

TC_OCMS_18.5_03B-User selects multiple notices to apply PS provided in the page via dropdown
    Given Already Search with Multiple Result       ${VehicleNum3}
    When Apply Operation to Multiple Notice with    Apply PS
    Then Able to Permanent Suspension Mutiple Notice

TC_OCMS_18.5_04A-User selects 1 notice to apply PS provided in the page via dropdown under PS ed status
    Given User Already Search Notice with Permanen Suspend Status
    When Apply Permanent Suspension to Selected Notice  ${NOPOPS}
    Then Modal Window Text is   1 out of 1 Notices Failed to Applied Permanent Suspension (PS). Please see the error details of each notice in table.

TC_OCMS_18.5_04B-User selects multiple notices to apply PS provided in the page via dropdown one of them are under PS status
    Given Already Search with Multiple Result       ${VehicleNum}
    When Apply Operation to Multiple Notice with    Apply PS
    Then Modal Window Text is   User can be only override 1 notices at the same time

#TC_OCMS_18.5_04C-User selects multiple notices to apply PS provided in the page via dropdown one of them are under no PS status
#TC_OCMS_18.5_05A-Officer with allowed access to manual override PS, PS the notice that has not been PS ed 

TC_OCMS_18.5_05B-Officer with allowed access to manual override PS, PS the notice that under PS ed status 
    Given Already Select Notice with PS State to PS-ing
    When Click Button on  Manually Ovveride PS
    Then Able to Apply Permanen Suspension to Selected Notice

TC_OCMS_18.6_01-User access PS notice and wants to see the PS details page before confirming to apply to the notices
    Given Already Select Notice to Apply Operation              ${NOPO}
    When Apply Permanent Suspension to Selected Notice          ${NOPO}
    Then Permanent Suspension Page Display Following Column

TC_OCMS_18.7_01-User confirmed the notices and wants to proceed to PS the notices
    [Tags]  Smoke
    Given Already Select Notice to Apply Operation              ${NOPO}
    When User Proceed to PS Selected Notice                     ${NOPO}
    Then Able to Permanent Suspend Notice                       ${NOPO}

TC_OCMS_18.7_02-User missed to fill the mandatory fields
    Given Already Select Notice to Apply Operation              ${NOPO}
    When User Proceed to PS Selected Notice with empty mandatory field
    Then Modal Window Text is   Failed to proceed PS. Please check your form. 

TC_OCMS_18.8_01-Before proceed to PS the notices, user needs to review his notices
    Given Already Select Notice to Apply Operation  ${NOPO}
    When User Proceed to PS Selected Notice         ${NOPO}
    Then Selected Notice Suspension Summary Display

TC_OCMS_18.8_02-User wants to see Permanent Suspension Record Section
    Given Already Select Notice to Apply Operation  ${NOPO}
    When User Proceed to PS Selected Notice         ${NOPO}
    Then Permanen Suspension Record Display

#Covered by 18.8.2
#TC_OCMS_18.8_03-User wants to give details for suspension
TC_OCMS_18.9_01-User proceed to PS notice but decided to cancel and review the notice
    Given Already Proceed to Apply Permanen Suspension
    When Click Button On   Cancel
    Then User Still on Details Page

TC_OCMS_18.9_02-User confirms to PS the Notices
    [Tags]  Duplicate   #18.7.01
    Given Already Select Notice to Apply Operation  ${NOPO}
    When User Proceed to PS Selected Notice         ${NOPO}
    Then Able to Permanent Suspend Notice           ${NOPO}

#TC_OCMS_18.9_03-User needs to see if the notices he processed is success or not
#TC_OCMS_18.9_04-User needs to confirm if the notices he processed is failed when process it
#TC_OCMS_18.10_01-User as Manager, Apply Permanen Suspension to Notices

#TC_OCMS_18.10_02-Officer with no access to manual override will not trigger the popup / will not be allowed to PS the already PS ed notice(s)
#TC_OCMS_18.10_03-officer with higher level can manually override the notice
#TC_OCMS_18.11_01-User want to see prompt message success applied permanen suspension
#TC_OCMS_18.11_02-User want to see prompt message failed applied permanen suspension
#TC_OCMS_18.23_01-User Applied Full Waiver to selected reference case
#TC_OCMS_18.23_02-User Applied Full Waiver to PS-ed Reference Case
#TC_OCMS_18.25_01-User wants to stop days counting with applied Permanen Suspension (From OCMS)
#TC_OCMS_18.25_02-User wants to stop days counting with applied Permanen Suspension (From PLUS)
#TC_OCMS_18.26_01-Applied multiple Permanent Suspension (From OCMS Page)
#TC_OCMS_18.26_02-Applied multiple Permanen Suspension (From PLUS Page)
#TC_OCMS_18.26_03-Applied Multiple Permanen Suspension on One of PS-ed Notice
TC_OCMS_18.26_04-User See History of Appeal Processing
    Given Already Select Notice to Apply Operation  ${NOPO}
    When User wants to See Suspension Record        ${NOPO}
    Then Suspension Record Display






    
