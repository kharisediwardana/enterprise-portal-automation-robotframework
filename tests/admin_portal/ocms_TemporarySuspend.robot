*** Settings ***
Documentation           This is automation of Enterprise Portal Automation Suite On Temporary Suspension Process
Resource                ../../resources.robot
Suite Setup             Open Browser and Go to Page OCMS 5
Test Setup              Go to OCMS5 Page
Test Teardown           Capture Page If Test Failed 
Suite Teardown          Close All Browsers
Force Tags              OCMS17

***Test Cases***
TC_OCMS_17.1_01A-User as Notice Processing Officer accesses view notice button from hamburger menu to search notice before he can process it
    Given Landing on Notices Page
    When User Click on Search type
    Then Search Function by Category Display

#TC_OCMS_17.1_01B-User as Notice Processing Officer accesses view notice button from hamburger menu with unstable internet connection to search notice before he can process it
TC_OCMS_17.1_02A-User access view notice button on the hamburger menu to search notice to process it using advance search menu
    Given Landing on Notices Page
    When User Want see Advance Search
    Then Advance Search Feature Display

TC_OCMS_17.2_01-User inputs valid notice number, summon number or warrant number to search the specific notice
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPO2}
    Then Search Result Display Correctly    ${NOPO2} 

TC_OCMS_17.2_02-User inputs invalid Notice number, summon number or warrant number to search the notice
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${invalidNumber}
    Then Error Message Display

TC_OCMS_17.2_03-User inputs non Exist Notice number, summon number or warrant number to search the notice
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number      341000398A
    Then User See No Record to Display

TC_OCMS_17.2_04-User input search using invalid singaporean vehicle number
    Given Landing on Notices Page
    When User Search Notice Using   Vehicle Number        ${invalidNumber}
    Then Error Message Display

TC_OCMS_17.3_01-User filters some notices to TS the notices using CSV file format upload
    Given Landing on Notices Page
    When Search notice by Upload CSV using              ${searchCSV}          
    Then Search Result using CSV display Correctly        ${NOPO}  ${NOPO2}  ${NOPO3}

TC_OCMS_17.3_02-User upload correct CSV file format that has no notice in its file
    Given Landing on Notices Page
    When Search notice by Upload CSV Using      ${EmptyCSV}
    Then User See No Record to Display

TC_OCMS_17.3_03-User upload CSV file that invalid content in its file
    Given Landing on Notices Page
    When Upload CSV search with invalid format      ${xlsx}
    Then Modal Window Text is    File format is not acceptable.
    
TC_OCMS_17.4_01-User inputs valid data to advance search
    Given Landing on Notices Page
    When Search Advance by ID Type Using        S7450757C
    Then Advance Search Display Correct Data    (NRIC) S7450757C

TC_OCMS_17.4_02-User input invalid data to advance search
    Given Landing on Notices Page
    When Search Advance by ID Type Using      ${invalidNumber}
    Then Error Message Display

TC_OCMS_17.4_03-User input unexist data to advance search
    Given Landing on Notices Page
    When Search Advance by ID Type Using      ${NoResult}
    Then User See No Record to Display

TC_OCMS_17.4_04-User needs a summary view displays in searched data to process TS the notices
    Given Landing on Notices Page
    When Search Advance by ID Type Using      ${NRIC}
    Then Search Result Display Column with Several Data     ${NOPO}

TC_OCMS_17.5_01-Single view notice on search result
    Given Landing on Notices Page
    When User Wants to View Single Notice   ${NOPO2}  
    Then Details of Notice Display      ${NOPO2}

TC_OCMS_17.5_02-View more than one notice on search result
    Given Already Search with Multiple Result   ${VehicleNum}
    When Select Multiple Notice to View
    Then Able to View Details of Multiple Notices

TC_OCMS_17.5_03-View all notice which showed on search result
    Given Already Search with Multiple Result   ${VehicleNum}
    When Select All Notice on Search Result
    Then Able to View all Selected Notices

#TC_OCMS_17.5_04-View multiple notice with disable pop up notice
TC_OCMS_17.5_05-Apply Temproray Suspend on Selected Notice
    Given Already Search with Multiple Result   ${VehicleNum}
    When User Select Notice to Temporary Suspend
    Then Able to Apply Temporary Suspend

TC_OCMS_17.5_06-Apply Temporary Suspend on Selected PS-ed Notice
    Given User Already Search Notice with Permanen Suspend Status
    When User Select First Notice to Temporary Suspend
    Then Not Able to Apply Temprorary Suspend

TC_OCMS_17.6_01-User want to see summary of notice which selected to apply Temporary Suspend
    Given Already Search with Multiple Result   ${VehicleNum}
    When User Select Notice to Temporary Suspend
    Then The first Section will displays a notice summary table 

TC_OCMS_17.6_02-User want to see Temporary Suspension Details of Notices which selected to apply Temporary Suspend
    Given Already Search with Multiple Result   ${VehicleNum}
    When User Select Notice to Temporary Suspend
    Then The 2nd section allows the user to configure the Suspension details

TC_OCMS_17.7_01-User Select Suspension Code
    Given Already Search with Multiple Result   ${VehicleNum}
    and User Select Notice to Temporary Suspend
    When Select Suspension Code 
    Then Able to select temporary suspension code
    And Number of days will auto-populated

TC_OCMS_17.7_02-User Edit Auto-populated Number of Days
    Given Already select Temporary Suspension Code
    When Edit Number of days
    Then Able to edit number of days

TC_OCMS_17.8_01-User Select Suspension Code
    [Tags]  Duplicated  #TC_OCMS_17.7_01
    Given Landing Temporary Suspend Page 
    When Select Suspension Code 
    Then Able to select temporary suspension code
    And Number of days will auto-populated

TC_OCMS_17.8_02-User Edit Auto-populated Number of Days
    [Tags]  Duplicated  #TC_OCMS_17.7_02
    Given Already select Temporary Suspension Code
    When Edit Number of days
    Then Able to edit number of days

TC_OCMS_17.9_01-User Input Suspension Remarks on Remarks Field
    Given Landing Temporary Suspend Page 
    When Input Temporary suspension remarks field 
    Then Able to Input Suspension 
    And Remarks Character Count Display        25 character left

#TC_OCMS_17.9_02-User Input Suspension Remarks on Remarks Field maximum character permitted 
#TC_OCMS_17.9_03-User input Suspension Remarks on Remarks Field exceed maximum characters
TC_OCMS_17.10_01-User Proceed to Temprorary Suspend Notice
    Given Landing Temporary Suspend Page 
    And Select Suspension Code 
    When Click Button on   Procced to TS
    Then Able to Temprorary Suspend Notice

#TC_OCMS_17.11_01-User wants to see Notice Summary Table before Proceed to TS Notice
#TC_OCMS_17.11_02-User wants to See Summary of Temporary Suspension details
#TC_OCMS_17.12_01-User continue to proceed TS notice(s) with result success
TC_OCMS_17.12_02-User continue to proceed TS notices with result failed
    Given Landing Temporary Suspend Page  
    When Click Button on   Procced to TS
    Then Modal Window Text is       Failed to proceed TS. Please check your form.

TC_OCMS_17.12_03-User cancel to proceed TS the notices and revise his process
    Given Already Proceed to TS Notice
    When Click Button on  Cancel
    Then No Field Cleared after cancel TS

#TC_OCMS_17.12_API-Upon success TS the notice(s) API call OCMS backend
#TC_OCMS_17.13_01-User cancel Temporary Suspension Process
#TC_OCMS_17.13_02-User confirm Temporary Suspension Process
#TC_OCMS_17.13_03-User Success to Applied Temprorary Suspend Notice
#TC_OCMS_17.13_04-User unsuccess to Applied Temprorary Suspend Notice
#TC_OCMS_17.14_01-User temporary suspend the notice via PLUS
#TC_OCMS_17.15_01-User decided to Update TS to selected notice via PLUS to extend Suspend duration
#TC_OCMS_17.16_01-User add non PS-ed Reference case
#TC_OCMS_17.16_02-User add PS-ed Reference case
#TC_OCMS_17.16_03-User extended TS status to non PS-ed notice
#TC_OCMS_17.16_04-User extended TS status to PS-ed notice

TC_OCMS_17.17_01-User wants to TS-ing the PS-ed notice 
    Given User Already Search Notice with Permanen Suspend Status
    When User Select First Notice to Temporary Suspend
    Then Modal Window Text is   1 out of 1 Notices Failed to Applied Temporary Suspension (TS). Please see the error details of each notice in table.

#TC_OCMS_17.18_01-User proceed to TS notice(s) that has no PS ed status
TC_OCMS_17.18_02-User selected multiple notices with one of them has already TS ed
    Given Already Search with Multiple Result   ${VehicleNum3}
    When User Proceed to TS Multiple Notices
    Then Summary table list is displayed with suspension status updated to TS 
    And TS ed notice displays in yellow
    
TC_OCMS_17.18_03-User selected multiple notices with one of them has already PS ed
    Given Already Search with Multiple Result   ${VehicleNum}
    When Apply Operation to Multiple Notice with    Apply TS
    Then Modal Window Text is   3 out of 10 Notices Failed to Applied Temporary Suspension (TS). Please see the error details of each notice in table.

TC_OCMS_17.19_01-User proceed to TS notices
    Given Already Select Notice to Temprorary Suspend
    When User Proceed Single notice to Temporary Suspend
    Then Summary table list is displayed with suspension status updated to TS 

#TC_OCMS_17.20_01-User successfully TS the notice
#TC_OCMS_17.20_02-User inputs notice(s) under TS status
#TC_OCMS_17.22_01-Success TS notice
#TC_OCMS_17.22_02-Failed TS notice
#TC_OCMS_17.22_03-TS already TS ed notice status and extend duration with longer duration days
#TC_OCMS_17.22_04-TS already TS ed notice status and extend duration with shorter duration days
#TC_OCMS_17.23_01-User apply TS on multiple notices
#TC_OCMS_17.23_02-User apply TS on multiple notices by edit cases page
#TC_OCMS_17.24_01-User wants to pause day expiry count by TS-ed notice
#TC_OCMS_17.24_02-Expired date will used longest active day.
#TC_OCMS_17.25_01-User apply partial waiver to notice
