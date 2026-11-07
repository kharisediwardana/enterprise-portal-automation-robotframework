*** Settings ***
Documentation        This is automation of Enterprise Portal Automation Suite On Search Appeal Feature
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Page Plus Appeal
Test Setup           Go to Plus Appeal Page
Test Teardown        Capture Page If Test Failed
Suite Teardown       Close All Browsers
Force Tags           PLUS27

*** Test Case ***
#PLUS_2701_001A-Search for an Appeal That was Submitted via eService
#Covered on 2702

#PLUS_2701_001B-Search for an Appeal that was Made to Portal not via eService
#Still Search whats the different

PLUS_2701_002-Search for Non-existent Appeals
    Given User Landing on Search Appeal Page
    When Search Appeal by Transaction Number Using      OA2000003565
    And Input Captcha and Click Search Button
    Then User Get No Result Found                       OA2000003565  

#Need Access to Pass
#PLUS_2701_003A-Clicks Into an Appeals Detail to View More Info and Signs in to SingPass/Corp~Pass Successfully
#PLUS_2701_003B-Clicks Into an Appeals Detail to View More Info and Fails to Sign in to SingPass/CorpPass Successfully
  
PLUS_2702_001A-Search for appeal using transaction number
    [Tags]  Smoke
    Given User Landing on Search Appeal Page
    When Search Appeal by Transaction Number Using    ${Trans_Number}
    And Input Captcha and Click Search Button
    Then User Get Search Result    Transaction   ${Trans_Number}    

PLUS_2702_001B-Search for appeal using NOPO/Summon number
    Given User Landing on Search Appeal Page
    When Search Appeal By NOPO Using    ${NOPO} 
    And Input Captcha and Click Search Button
    Then User Get Search Result    Summon / Notice  ${NOPO}                
  
PLUS_2702_001C-Search for appeal using vehicle number
    Given User Landing on Search Appeal Page
    When Search Appeal by Vehicle Number Using    ${VehicleNum}
    And Input Captcha and Click Search Button
    Then User Get Search Result  Vehicle   ${VehicleNum}      

#PLUS_2702_001D-Search for non-existent appeals
#Same like PLUS_2701_002

#PLUS_2703_001-Selects a search criteria and enters a search value when searching for appeals
#Covered by 27.2

PLUS_2703_002A-User does not select a search criteria when searching for appeals
    Given User Landing on Search Appeal Page
    When Input Search without Choose Type   ${NOPO}
    Then Verify Error Message Display       Please select search criteria.

PLUS_2703_002B-User does not enter a search value when searching for appeals
    Given User Landing on Search Appeal Page
    When Search without Input Value
    Then Verify Error Message Display    Please enter vehicle number.

#Covered by 27.2
#PLUS_2704_001A-User search for appeal using valid transaction number
#PLUS_2704_001B-User search for appeal using valid NOPO/Summon number
#PLUS_2704_001C-User search for appeal using valid vehicle number

PLUS_2704_002-User search for appeals with invalid search values
    Given User Landing on Search Appeal Page
    When Search Appeal By NOPO Using    ~!@#$
    And Input Captcha and Click Search Button
    Then Verify Error Message Display   Invalid notice number or summon number. Please ensure that it is a valid portal offence.

#Need Confirmed about the feature 
#PLUS_2705_001A-User search for appeal by ID number and login with SingPass/CorpPass successfully
#PLUS_2705_001B-User repeats search by SAME ID number after prior login with SingPass/CorpPass
#PLUS_2705_001C-User repeats search by DIFFERENT ID number after prior login with SingPass/CorpPass
#PLUS_2705_001D-User search for appeal by ID number and fails to login with SingPass/CorpPass successfully
#PLUS_2705_001E-User repeats search by ID number after login with SingPass/CorpPass expires

#PLUS_2706_001A-User search for appeal using valid FIN/Passport number
#PLUS_2706_001B-User search for appeals with invalid FIN/Passport number

#Need Dummy for >6 Month Appeal
#PLUS_2707_001-User attempts to search his/her appeal within 6 months ago using transaction/vehicle/NOPO/Summon number
#PLUS_2707_002A-User attempts to search his/her appeal from > 6 months ago using vehicle/NOPO/Summon/ID number
#PLUS_2707_002B-User attempts to search his/her appeal from > 6 months ago using transaction number

#Still Confirmed about the feature
#PLUS_2707_003A-User views additional info for appeal under his own ID
#PLUS_2707_003B-User views additional info for appeal NOT under his own ID
#PLUS_2707_004A-User views additional info for appeal under his own ID with prior login to SingPass/CorpPass
#PLUS_2707_004B-User views additional info for appeal NOT under his own ID with prior login to SingPass/CorpPass

PLUS_2708_001-User wants to make new search after the current session is finished
    Given User Already Get Result on Search Appeal
    When User Click New Search Button
    Then Can Make Another Search

PLUS_2708_002-User wants to see ALL results
    Given User Landing on Search Appeal Page
    When Search Appeal By NOPO Using    ${NOPO}
    And Input Captcha and Click Search Button
    Then User Can See Pagination to Show All Result
