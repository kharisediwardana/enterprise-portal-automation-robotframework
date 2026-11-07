*** Settings ***
Documentation        Scripts for Plus Admin Permanent Suspension
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Plus Admin Portal
Test Setup           Go to Plus Admin Portal
Test Teardown        Capture Page If Test Failed
Suite Teardown       Close All Browsers
Force Tags           PLUS18

***Test Cases***
PLUS_18.01-001-Select Nopo Decision Full Waiver
    Given User Already on Selected Case                          ${NOPOTS}        ${casenum}   
    When User Select Decision type  Full Waiver 
    Then Able to Select Decision    Full Waiver

PLUS_18.01-002-Permanent Suspend details display columns
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}   
    When User Submit Notice to Apply NOPO Decision              Full Waiver
    Then Permanent suspned Details display several columns

PLUS-18.01-003-Edit remarks on permanen suspend details
    Given User Already Submit case to Full Waiver
    When User Want to Input PS suspension remark            ${remark}   
    Then Able to Input PS suspension remark                 ${remark}

PLUS_18.02-001-Apply NOPO Funcationality to Permanent Suspend Notice
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}  
    When User Select Functionality type     Apply PS
    Then Able to Select Nopo Functionality  Apply PS

PLUS-18.02-002-Select suspension code on apply Permanent suspend proccess
    Given User already select notice to apply functionality     ${NOPOTS}        ${casenum}       Apply PS
    When Select suspension code on PLUS                 APP - Appeal Accepted
    Then User Able to Select Reason of Suspension       APP - Appeal Accepted

PLUS_18.02-003-User with authorized access to NOPO functionality, applied PS to notice under code VST
    Given User Already on Selected Case                         ${NOPOTS}    ${casenum}   
    When Applied PS using reason                VST - Valid Season Ticket
    Then Success to applied PS using reason     VST

PLUS_18.02-004-User with authorized access to NOPO functionality, applied PS to notice under code CFA
    Given User Already on Selected Case                         ${NOPOTS}    ${casenum}
    When Applied PS using reason                CFA - Cancelled By Field Admin Unit
    Then Success to applied PS using reason     CFA

PLUS_18.02-005-User with authorized access to NOPO functionality, applied PS to notice under code CAN
    Given User Already on Selected Case                         ${NOPOTS}    ${casenum}  
    When Applied PS using reason                CAN - Cancelled Advisory Notice
    Then Success to applied PS using reason     CAN

PLUS_18.02-006-User with authorized access to NOPO functionality, applied PS to notice under code OTH
    Given User Already on Selected Case                         ${NOPOTS}    ${casenum}
    When Applied PS using reason                OTH - Others
    Then Success to applied PS using reason     OTH

PLUS_18.02-007-Non authorized user to access NOPO functionality access it to apply PS the notice
    Given User Already on Selected Case                         ${NOPOTS}        ${casenum}
    When non autorized user want to apply PS to selected notice
    Then Unable to apply PS

#PLUS-18.03-001-REQUEST POST several data to OCMS to apply permanent suspension on selected notice
PLUS-18.05-001-User see suspension status on notice details
    Given User already select notice with no PS or court status to Apply Full Waiver
    When Proceed to apply proccesing on selected notice     Full Waiver
    Then Selected notice proccesing stage to PS 

PLUS-18.05-002-Apply permanent suspend to notice which not PS-ed and court stage
    Given User already select notice with no PS or court status
    When Proceed to apply proccesing on selected notice     Apply PS
    Then Success to applied PS using reason     APP

#need to adjust later checking change data with
PLUS-18.05-003A-Apply Permanent Suspend to notice which already on PS-ed state
    Given User already select notice under PS status
    When Sumbit selected notice to apply full waiver
    Then Prompt message error display   Notices already in Permanent Suspend, cannot be processed
    
#! do it after have court stage notice
#PLUS-18.05-003B-Apply permanent Suspend to notice on court stage
PLUS-18.05-004A-Apply Full Waiver to notice with PS code RIP
    User Already on Selected Case                         ${NOPORIP}     ${casenumPS}  
    Verify Notice is on stage   PS
 
PLUS-18.05-004B-Apply Full Waiver to notice with PS code FOR
    User Already on Selected Case                         ${NOPOFOR}     ${casenumPS}  
    Verify Notice is on stage   PS
    
PLUS-18.05-004C-Apply Full Waiver to notice with PS code FP
    User Already on Selected Case                         ${NOPOFP}     ${casenumPS}  
    Verify Notice is on stage   PS

PLUS-18.08-001-User needs to know if the PS is success
    Given User already select notice with no PS or court status
    When Proceed to apply proccesing on selected notice     Apply PS
    Then Success to applied PS using reason     APP

PLUS-18.08-002-User access History of Nopo Processing
    Given Already Proceed to Applied PS on Selected Reference Case
    When User See History of NOPO Decision
    Then History is Updated according latest decision make

PLUS-18.08-003A-Upon applied PS, user access via reply tab in appeal detail to close the case
    Given Already Proceed to Applied PS on Selected Reference Case
    When Set case reply status to   Case Closed
    Then Case send to Close Case Inbox with Closed Status
    And PLM user cannot edit the case

#PLUS-18.08-003B-Upon applied PS, user selects reply status interim reply

PLUS-18.08-003C-Upon applied PS, user selects reply status No reply required
    Given Already Proceed to Applied PS on Selected Reference Case
    When Set case reply status to   No reply required
    Then Case send to Close Case Inbox with Closed Status
    And PLM user cannot edit the case

PLUS-18.08-003D-Upon applied PS, user selects reply status Replied
    Given Already Proceed to Applied PS on Selected Reference Case
    When Set case reply status to   Replied
    Then Case send to Close Case Inbox with Closed Status
    And PLM user cannot edit the case

#PLUS-18.09-001-REQUEST POST permanent suspension to selected notice display several data
