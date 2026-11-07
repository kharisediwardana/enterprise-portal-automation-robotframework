*** Settings ***
Documentation           This is automation of Enterprise Portal Automation Suite On Permanen Suspension Process
Resource                ../../resources.robot
Suite Setup             Open Browser and Go to Page OCMS 5
Test Setup              Go to OCMS5 Page
Test Teardown           Capture Page If Test Failed 
Suite Teardown          Close All Browsers
Force Tags              OCMS19

***Test Cases***
19.01_001A-User searches notice he wants to revive using vehicle number
    [Tags]   Duplicated   #18.1
    Given Landing on Notices Page
    When User Search Notice Using   Vehicle Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.01_001B-User searches notice he wants to revive using notice number
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPO2}
    Then Search Result Display Correctly            ${NOPO2} 

19.01_001C-User searches notice he wants to revive using warrant number
    #[Tags]   Duplicated   #18.1
    #Given Landing on Notices Page
    #When User Search Notice Using   Warrant Number        ${VehicleNum}
    #Then Search Result Display Correctly                ${VehicleNum}

19.01_002-User needs to revive notice menu
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPOTS}
    And User Select Notice to Revive    ${NOPOTS}
    Then Page redirects user to revival process menu

19.01_003-User apply revival on a notice with TS status
    Given User Already Search Notice to Revive  ${NOPOTS}
    When User Select Notice to Revive    ${NOPOTS}
    And User Proceed to Revival Temporary Suspension
    Then User able to revive selected notice from suspension
    And Notice status is removed after overall process of revival

19.01_004-User apply revival on a notice with PS status
    Given User Already Search Notice to Revive   ${NOPOPS}
    When Revive Suspension Notice    ${NOPOPS}
    Then User able to revive selected notice from suspension
    And PS status is remove from Notice

19.01_005-User tries to apply revival on multiple notices
    Given Already Search with Multiple Result   ${VehicleNum}
    When User Select Two notice with TS status to       Apply Revival
    Then Modal Window Text is   User can be only revival 1 notices at the same time

19.01_006-User revive notice with multiple applied status
    [Tags]  Duplicate  #19.01_005
    Given Already Search with Multiple Result   ${VehicleNum}
    When User Select Two notice with TS status to       Apply Revival
    Then Modal Window Text is   User can be only revival 1 notices at the same time

19.01_007-User revive notice with multiple applied status by master checkbox
    [Tags]  Duplicate  #19.01_005
    Given Already Search with Multiple Result   ${VehicleNum}
    When Apply Operation to Multiple Notice with    Apply Revival
    Then Modal Window Text is   User can be only revival 1 notices at the same time

19.02_001-User as Notice Processing Officer search notice to process revival using valid data search via Notice number
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPO2}
    Then Search Result Display Correctly            ${NOPO2} 

19.02_002A-User as Notice Processing Officer search notice to process revival using valid data search via vehicle number
    [Tags]  Duplicate  #OCMS 18.1
    Given Landing on Notices Page
    When User Search Notice Using   Vehicle Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.02_002B-User as Notice Processing Officer search notice to process revival using valid data search via Summon number
    [Tags]  Duplicate  #OCMS 18.1
    Given Landing on Notices Page
    When User Search Notice Using   Summon Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.02_002C-User as Notice Processing Officer search notice to process revival using valid data search via Warrant number
    [Tags]  Duplicate  #OCMS 18.1
    Given Landing on Notices Page
    When User Search Notice Using   Warrant Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.02_002D-User search non existing data search
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number      341000398A
    Then User See No Record to Display

19.02_003A-User searches the notice using advance search by ID type and Number
    [Tags]  Duplicate   #OCMS 17.4
    Given Landing on Notices Page
    When Search Advance by ID Type Using        S7450757C
    Then Advance Search Display Correct Data    (NRIC) S7450757C 

19.02_003B-User searches the notice using advance search by offender name
    [Tags]  Duplicate   #OCMS 18.1
     Given Landing on Notices Page
    When User advance search using offender type
    Then Able to advance search using offender type

19.02_003C-User searches the notice using advance search by notice type
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    When User advance search using notice type
    Then Able to Advance Search using Notice type

19.02_003D-User searches the notice using advance search by Comp rule code
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    When User advance search using Rule Infernged
    Then Able to advance search using rule infernged

#19.02_003E-User searches the notice using advance search by date of offence
19.02_003F-User searches the notice using advance search by suspension type
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    And User Want see Advance Search
    When User advance search using Reason of Suspension
    Then Able to advance search using Reason of Suspension

#19.02_003G-User searches the notice using advance search by NTAC number
19.02_003H-User searches the notice using advance search with invalid data
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    When Search Advance by ID Type Using      S5242815G
    Then Search Result Show no Records

19.03_001-User as Notice Processing Officer search notice to process revival using valid data search via vehicle number
    [Tags]  Duplicate  #OCMS 18.1
    Given Landing on Notices Page
    When User Search Notice Using   Vehicle Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.03_001A-User as Notice Processing Officer search notice to process revival using valid data search via Summon number
    [Tags]  Duplicate  #OCMS 18.1
    Given Landing on Notices Page
    When User Search Notice Using   Summon Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.03_001B-User as Notice Processing Officer search notice to process revival using valid data search via Warrant number
    [Tags]  Duplicate  #OCMS 18.1
    Given Landing on Notices Page
    When User Search Notice Using   Warrant Number        ${VehicleNum}
    Then Search Result Display Correctly                ${VehicleNum}

19.03_001C-User search non existing data search
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number      341000398A
    Then User See No Record to Display

19.03_002A-User searches the notice using advance search by ID type & number
    [Tags]  Duplicate   #OCMS 17.4
    Given Landing on Notices Page
    When Search Advance by ID Type Using        S7450757C
    Then Advance Search Display Correct Data    (NRIC) S7450757C 

19.03_002B-User searches the notice using advance search by offender name
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    When User advance search using offender type
    Then Able to advance search using offender type

19.03_002C-User searches the notice using advance search by notice type
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    When User advance search using notice type
    Then Able to Advance Search using Notice type

19.03_003A-User needs to download CSV file template in order to prepare search notice
    [Tags]  Duplicate   #OCMS 18.1
    Given Landing on Notices Page
    When User wants to Download CSV Search Template
    Then Able to Download CSV Search Template

19.03_003B-User wants to search multiple notice via CSV file upload
    [Tags]  Duplicate   #OCMS 17.3
    Given Landing on Notices Page
    When Search notice by Upload CSV using              ${searchCSV}          
    Then Search Result using CSV display Correctly        ${NOPO}  ${NOPO2}  ${NOPO3}

#19.03_003C-Upon the menu, user hover accepted file information to upload CSV file

19.04_001A-User input blank value on Notice number to search notice
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number        ${EMPTY}
    Then User see error message on search notice            Please fill in notice no.

19.04_001B-User input blank value on Summon number to search notice
    Given Landing on Notices Page
    When User Search Notice Using   Summon Number        ${EMPTY}
    Then User see error message on search notice            Please fill in summon no.

19.04_001C-User input blank value on Warrant number to search notice
    Given Landing on Notices Page
    When User Search Notice Using   Warrant Number          ${EMPTY}
    Then User see error message on search notice            Please fill in warrant no.

19.04_002A-User input invalid value on Notice number to search notice
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number           ${invalidNumber}
    Then User see error message on search notice            Invalid notice no.

19.04_002B-User input invalid value on Summon number to search notice
    Given Landing on Notices Page
    When User Search Notice Using   Summon Number           ${invalidNumber}
    Then User see error message on search notice            Invalid summon no.
    
19.04_002C-User input invalid value on Warrant number to search notice
    Given Landing on Notices Page
    When User Search Notice Using   Warrant Number          ${invalidNumber}
    Then User see error message on search notice            Invalid warrant no.

#19.04_002C-User input invalid value on vehicle number format to search the notice
19.04_003-User inputs correct format, but data is not existed
    [Tags]  Duplicate   #OCMS 17.2
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number      341000398A
    Then User See No Record to Display

19.05_001-User selects notice that need to revive using notice description displayed on the page
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPOTS}
    And User Select Notice to Revive    ${NOPOTS}
    Then The first Section of Page will displays a notice summary table

19.06_001-User wishes to view into notice details to make sure process his revival notice is not wrong
    [Tags]  Duplicated  #17.5
    Given Landing on Notices Page
    When User Wants to View Single Notice   ${NOPO2}  
    Then Details of Notice Display      ${NOPO2}

#19.06_002-Upon taking a look at first glance, user decided to take a look into multiple notices details and open all of the notices using checkbox provided in the left panel manually
#19.06_003-Upon taking a look at first glance, user decided to take a look into multiple notices details and open all of the notices using master panel in the left to select all the record displayed in the page with maximum 10 notices
19.06_004-User confirms to apply revive on searched notice with one suspension status
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPOTS}
    And User Select Notice to Revive    ${NOPOTS}
    Then Page redirect user to suspension notice detail for user to revive

19.06_005-User Revive on the notice with no suspension status
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   341000071X
    And User Select Notice to Revive                341000071X
    Then Modal Window Text is       The notice unable to retrieve SR No. This notice don't have suspension status before.

19.06_006-User revive on multiple notices
    [Tags]  Duplicate  #19.01_005
    Given Already Search with Multiple Result   ${VehicleNum}
    When User Select Two notice with TS status to       Apply Revival
    Then Modal Window Text is   User can be only revival 1 notices at the same time

19.07_001-Before user decided to revive suspension notice, he needs to know which one he should remove the suspension status
    Given Landing on Notices Page
    When User Search Notice Using   Notice Number   ${NOPOTS}
    And User Select Notice to Revive    ${NOPOTS}
    Then Page displays all active TS and PS on the notice for user to revive

19.07_002-User needs to input notice details to process revive notice
    Given User Already Select Notice to Revive    ${NOPOTS}
    When Input Revival Notice Record
    Then Page to provide revival details for revival officer or OIC to input revival details
    And User able to input all the mandatory field required to revive the notice

19.07_003-User confirms to revive one suspension notice
    Given User Already Select Notice to Revive  ${NOPOTS}
    And Fill All Mandatory Revival Suspension Record 
    When User Proceed to Revival
    Then Page provides proceed to revival to process revive notice
    
19.08_001-User confirms to revive one suspension notice
    [Tags]  Duplicated   #19.01_003
    Given User Already Search Notice to Revive  ${NOPOTS}
    And User Select Notice to Revive    ${NOPOTS}
    When User Proceed to Revival Temporary Suspension
    Then User able to revive selected notice from suspension
    And Notice status is removed after overall process of revival

19.08_002-When user reach and click the Procees to revival, user choose cancel to edit his revival process
    Given User Already Search Notice to Revive  ${NOPOTS}
    User Select Notice to Revive    ${NOPOTS}
    When User Cancel the Revive Process
    Then Notice suspension status is not changed

19.08_003-When user reach and click the Procees to revival, user choose confirm his revival process
    [tags]   Duplicated   #19.01_003
    Given User Already Search Notice to Revive  ${NOPOTS}
    When User Select Notice to Revive    ${NOPOTS}
    And User Proceed to Revival Temporary Suspension
    Then User able to revive selected notice from suspension
    And Notice status is removed after overall process of revival

#19.08_004-Upon confirmation prompt, revival result is failed
19.09_001-User see summary notice details
    Given User Already Select Notice to Revive  ${NOPOTS}
    When User go to Summary Section
    Then Page provides summary section for user to review his revival notice before processing the revival

19.09_002-User access revival notice details to proceed his notice revival 
    [tags]   Duplicate   #19.07.002
    Given User Already Select Notice to Revive    ${NOPOTS}
    When Input Revival Notice Record
    Then Page to provide revival details for revival officer or OIC to input revival details
    And User able to input all the mandatory field required to revive the notice

19.10_001-user process the revival but need confirmation to process his revival
    Given User Already Select Notice to Revive  ${NOPOTS}
    And Fill All Mandatory Revival Suspension Record 
    When User Proceed to Revival
    Then Prompt for user to choose between Proceed or cancel is displayed

19.10_001-user agree to revival notice
    [tags]   Duplicated   #19.01_003
    Given User Already Search Notice to Revive  ${NOPOTS}
    When User Select Notice to Revive    ${NOPOTS}
    And User Proceed to Revival Temporary Suspension
    Then User able to revive selected notice from suspension
    And Notice status is removed after overall process of revival

19.10_003-user cancel to revival notice
    [Tags]  Duplicated   #19.08.002
    Given User Already Search Notice to Revive  ${NOPOTS}
    User Select Notice to Revive    ${NOPOTS}
    When User Cancel the Revive Process
    Then Notice suspension status is not changed

19.11_001-User proceed to revive the notice with status success
    [tags]   Duplicated   #19.01_003
    Given User Already Search Notice to Revive  ${NOPOTS}
    When User Select Notice to Revive    ${NOPOTS}
    And User Proceed to Revival Temporary Suspension
    Then User able to revive selected notice from suspension
    And Notice status is removed after overall process of revival

#19.11_002-User proceed to revive the notice with status failed

19.12_001-User wants to see suspension status changes after revival with one suspension status
    Given User Already Search Notice to Revive   ${NOPOPS}
    When Revive Suspension Notice    ${NOPOPS}
    Then Prompt message indicating no suspension notice is displayed

19.12_002-User wants to see suspension status changes after revival with multiple suspension status
    [tags]   Duplicated   #19.01_003
    Given User Already Search Notice to Revive  ${NOPOTS}
    When User Select Notice to Revive    ${NOPOTS}
    And User Proceed to Revival Temporary Suspension
    Then User able to revive selected notice from suspension
    And Notice status is removed after overall process of revival

#19.15_001-User performs revival via PLUS with result success
#19.15_002-User performs revival via PLUS with result failed
#19.16_001-User performs revival via PLUS with notice have without fills the mandatory fields ( not allowed to revival Notice)
#19.16_002-User performs revival via PLUS with notice have no suspension status ( not allowed to revival Notice)
#19.17_001-User performs revival via PLUS with notice have without fills the mandatory fields ( not allowed to revival Notice)
#19.18_001-User perform revival via PLUS and after successful attempt, user needs to see the revival status changes
#19.19_001-User perform revival via PLUS and after successful attempt, user needs to see the revival status changes
#19.19_002-User performs revival via PLUS with notice have without fills the mandatory fields ( not allowed to revival Notice)

19.24_003-User wants to see notice process status after revival notice with single suspension status
    Given User Already Search Notice to Revive   ${NOPOPS}
    When Revive Suspension Notice    ${NOPOPS}
    Then Notice status will no longer under suspension status