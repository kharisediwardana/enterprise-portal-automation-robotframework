*** Settings ***
Documentation        Scripts for Plus Admin Temporary Suspend
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Plus Admin Portal
Test Setup           Go to Plus Admin Portal
Test Teardown        Capture Page If Test Failed
Suite Teardown       Close All Browsers
Force Tags           PLUS17

***Test Cases***
TC_1.001-Displays NOPO Decision for TS the notice via drop down menu
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When Click NOPO Decision Button
    Then NOPO Decision that will trigger TS is displayed via dropdown NOPO Decision menu

TC_1.002-Selecting NOPO decision Defered will trigger Temporary Suspend
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When User Select Decision type  Deferred  
    Then Able to Select Decision    Deferred

TC_1.003-Selecting NOPO decision Pending for Document will trigger Temporary Suspend
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When User Select Decision type  Pending for Documents 
    Then Able to Select Decision    Pending for Documents

TC_1.004-Selecting NOPO decision Reject will trigger Temporary Suspend
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When User Select Decision type  Rejected
    Then Able to Select Decision    Rejected

TC_1.005-Page display details after selecting one of temprorary suspend
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When User Submit Notice to Apply NOPO Decision              Deferred 
    Then page display info needed to TS the notice

TC_1.006-Apply NOPO Decision that will trigger TS with multiple notice
    Given Already landing on Reference case tab                 ${casenum}
    When User Select Mutiple Notice to TS-ing
    Then Able to Multiple Notice to TS-ing

TC_1.007-User wants to edit number of days temporary suspend
    Given User Already Submit Notice to Apply Nopo Decision     ${NOPOTS}
    When User Want to edit Number of days                   12
    Then Able to edit suspension number of days             12

TC_1.008-Input non numerical character on number of days
    Given User Already Submit Notice to Apply Nopo Decision     ${NOPOTS}
    When User Want to edit Number of days                       ${invalidNumber}    
    Then unable to input number of days with non Numberical     ${invalidNumber} 

TC_1.009A-User wants to input remarks for his reason TS-ing the notice
    Given User Already Submit Notice to Apply Nopo Decision     ${NOPOTS}
    When User Want to Input Remarks on NOPO processing          ${remark}
    Then Able to input remarks on NOPO Processing               ${remark}

TC_1.009B-User wants to input remarks for his reason TS-ing the notice with many characters
    Given User Already Submit Notice to Apply Nopo Decision     ${NOPOTS}
    When User Want to Input Remarks on NOPO processing          ${text} 
    Then Unable to input remark reason with many characters

TC_1.010-User intends to cancel TS decision using delete function
    Given User Already Submit Notice to Apply Nopo Decision     ${NOPOTS}
    When Click Button on  Delete
    Then Notice remove from suspension selected

#TC_2.001-
TC_2.002-Apply TS to PS -ed notice
    Given User Already on Selected Case                         ${NOPOPS}       ${casenumPS}  
    When User Submit Notice to Apply NOPO Decision              Deferred 
    Then Failed to TS-ing Notice on PS-State

TC_2.003-Apply TS to TS -ed notice
    [Tags]   Smoke   
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When Apply Nopo Decision on Selected Notice
    Then Success apply TS to TS-ed Notice                        ${NOPOTS}

#TC_2.004-Apply TS to CPC stage notice
#341000561K
TC_2.005-Apply TS to stage before CPC
    [Tags]  Covered   #by2.003
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When Apply Nopo Decision on Selected Notice 
    Then Success apply TS to TS-ed Notice                        ${NOPOTS}

TC_3.001-Success apply TS to notice
    [Tags]  Duplicated   #2.003
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When Apply Nopo Decision on Selected Notice
    Then Success apply TS to TS-ed Notice                        ${NOPOTS}

TC_3.002-Failed apply TS to Notice
    [Tags]  Duplicated  #2.002
    Given User Already on Selected Case                         ${NOPOPS}       ${casenumPS}  
    When User Submit Notice to Apply NOPO Decision              Deferred 
    Then Failed to TS-ing Notice on PS-State

#TC_3.003-Failed to apply TS to Notice on proceed page
#TC_4.001-Displays all the TS -ed attempt in PLUS
#TC_4.002-Download all the TS -ed attempt in PLUS
#TC_4.003-Download the report using PLM non supervisor role
 