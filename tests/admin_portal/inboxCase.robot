*** Settings ***
Documentation        This is automation of Enterprise Portal Automation Suite On Plus Admin Portal
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Plus Admin Portal
Test Setup           Go to Plus Admin Portal
Test Teardown        Capture Page If Test Failed 
Suite Teardown       Close All Browsers
Force Tags           PLUS15

***Test Cases***
PLUS_15_1.001A-User as PLM officer wants to access all of inboxes under his own profile
    Given User Already login
    When Landing to Menu    Inbox
    Then User Can Access Personal Inbox  

PLUS_15_1.001B-User as Manager Access Allocation Inbox
    Given User Already Login as Manager
    When Landing to Menu    Allocation Inbox
    Then User can Access    Allocation Inbox

PLUS_15_1.001C-User Access Assigned Inbox
    Given User Already Login as Manager
    When Landing to Menu    Assigned Inbox
    Then User can Access    Assigned Inbox

PLUS_15_1.001D-User Access Auto Reply Inbox
    Given User Already login
    #When Landing to Menu    Auto Reply Inbox    gonna use it later
    When Click on Auto Reply Inbox tab Menu
    Then User can Access    Auto Reply Inbox

PLUS_15_1.001E-User Access Verification Inbox
    Given User Already login
    When Landing to Menu    Verification Inbox
    Then User can Access Verification Inbox

PLUS_15_1.002-User as PLM officer views summary case before proceed to process it
    Given User Already login
    When User in Selected Inbox         Inbox    ${casenum}
    Then Summary of Assigned Case Displayed      ${casenum}

PLUS_15_1.003-User as PLM officer saves the case to draft and wants to access it again to resume his created case before submit it
    Given User Already Save Case as Draft
    When User Submit the Draft Case
    Then Draft Mark Will Disappear

PLUS_15_2.001-User as PLM officer who process the submitted case needs description display in each case in inbox
    Given User Already login
    When Landing to Menu    Inbox
    Then User Can Access Personal Inbox  

#! Check later
PLUS_15_2.002-PLM officer who access the inbox wants to sorting out the cases he wants to process using menu provided in the page
    Given User Already Landing on Personal Inbox
    ${index}  When User Sorting Case Basic Information
    Then Able to Sort out Any Menu in the Page  ${index}        #?Need to Confirmed about filter result

PLUS_15_3.001-User as PLM officer who process the submitted case needs information display in each case in his inbox to differentiate case type
    Given User Already login
    When Landing to Menu    Inbox
    Then Court Case Type Will be On top of Inbox

PLUS_15_3.002-User as PLM officer who process the submitted case needs information display in each case in his inbox to differentiate case urgency
    Given User Already login
    When Landing to Menu    Assigned Inbox
    Then Traffic Light Indicator Display

PLUS_15_3.003-User as PLM officer who process the submitted case wants to process the case based on the case urgencies
    Given User Already login
    When Landing to Menu    Inbox
    And Select Traffic Light Green Indicator
    Then Able to Filter Case with Green Light Indicator

#PLUS_15_4.001
PLUS_15_5.001-User as PLM officer who process the submitted case needs information display in each case in his inbox to differentiate case urgency
    Given User Already login
    When Landing to Menu    Inbox
    And Select Traffic Light Green Indicator
    Then Able to Filter Case with Green Light Indicator

PLUS_15_5.002A-User Filter case with Red light Indicator
    Given User Already login
    When Landing to Menu    Inbox
    And Select Traffic Light Red Indicator
    Then Able to Filter Case with Red Light Indicator

PLUS_15_5.002B-User Filter case with Yellow indicator
    Given User Already login
    When Landing to Menu    Assigned Inbox
    And Select Traffic Light Yellow Indicator
    Then Able to Filter Case with Yellow Light Indicator

PLUS_15_5.002C-User FIlter Case with Green Indicator
    Given User Already login
    When Landing to Menu    Inbox
    And Select Traffic Light Green Indicator
    Then Able to Filter Case with Green Light Indicator

PLUS_15_5.003-Change case using urgent criteria
    Given User Create Case with non Urgent Criteria
    When Change Source with Urgent Criteria
    Then Case Changed to Urgent Criteria

PLUS_15_5.004-Created case using urgent criteria
    Given User Landing on Plus Admin Page to Create New Case
    When Create Case Using Urgent Criteria
    Then User See Created Case Mark Urgent

PLUS_15_6.001-User as PLM officer wants to process urgent case
    Given User Already login
    When Landing to Menu    Assigned Inbox
    And Filter Case by Red Indicator
    Then Court Case Marked as Urgent Case

PLUS_15_7.001-User as PLM officer access his inbox and process the case using sorting case type to ease his access
    Given User Already Landing on Personal Inbox
    ${index}  When User Sorting Case Basic Information
    Then Able to Sort out Any Menu in the Page  ${index}    #?Need to Confirmed about filter result

#! Make it dinamic as one on PLUS_15-7.001
#PLUS_15_7.002A-User as PLM officer access his inbox and process the case using sorting feedback source to ease his access
#PLUS_15_7.002B-User as PLM officer access his inbox and process the case using sorting case number to ease his access
#PLUS_15_7.002C-User as PLM officer access his inbox and process the case using sorting appellant name to ease his access
#PLUS_15_7.002D-User as PLM officer access his inbox and process the case using sorting feedback source to ease his access
#PLUS_15_7.002D-User as PLM officer access his inbox and process the case using sorting by description to ease his access

#? Currently cannot Assert it
#PLUS_15_8.001-User hover to description text to see full description
PLUS_15_9.001-User access existing case
    Given User Already login
    When User in Selected Inbox    Inbox    0206230500005
    Then Verify summary Data is Loaded
    
PLUS_15_9.002-User Edit Exsiting Case
    Given User Already login
    And User in Selected Inbox    Inbox    0206230500005
    When Click Edit Case Button
    Then Able to Access Case Details

#PLUS_15_10.001

PLUS_15_11.001A-User inputs search key to search case appellant he wants to assess/reply
    Given User Already login
    And Landing to Menu    Inbox
    When Search for Case     Inbox    0206230500005
    Then Search Result Displayed      0206230500005

PLUS_15_11.001B-User inputs non existing keyword search to assess appellant case
    Given User Already login
    And Landing to Menu    Assigned Inbox
    When Search for Case    Assigned Inbox      1234-
    Then Search Result Show no Records
    
# need konfirm about advance search result
PLUS_15_11.002A-User using advance search to search case
    Given User Already login
    And Landing to Menu    Assigned Inbox
    When User Advance Search Case using ID type
    Then Able to Advance Search using ID Number

#? Need to research how to automate it
#PLUS_15_11.002B-User using advance search to search case for specific date
PLUS_15_11.002C-User using advance search to search case for comp rule code
    Given User Already login
    And Landing to Menu   Inbox
    When User Advance Search using Role Code        30301
    Then Able to Advance Search using Rule Code
#cek lagi advance search
PLUS_15_11.002D-User using advance search to search case for NOPO number
    Given User Already login
    And Landing to Menu    Assigned Inbox
    When User Advance Search using NOPO Number
    Then Able to Advance Search using NOPO Number

PLUS_15_11.002E-User using advance search to search case for summon number
    Given User Already login
    And Landing to Menu    Inbox
    When User Advance Search using Summon Number
    Then Able to Advance Search using Summon Number

PLUS_15_11.003-User search data using advance search using non existing data
    Given User Already login
    And Landing to Menu     Inbox
    When User Advance Search using Non Existing Data
    Then Search Result Show no Records

#PLUS_15_12.001
#PLUS_15_13.001
#PLUS_15_14.001