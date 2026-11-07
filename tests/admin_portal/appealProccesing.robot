*** Settings ***
Documentation        Scripts for Plus Appeal Processing
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Plus Admin Portal
Test Setup           Go to Plus Admin Portal
Test Teardown        Capture Page If Test Failed
Suite Teardown       Close All Browsers
Force Tags           PLUS16

***Test Cases***
16.34_001-Page provide drop-down to select functionality of revive
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Select Functionality Type with Scroll      Revive TS  
    Then Able to Select Nopo Functionality  Revive TS

16.34_002A-Staff with supervisor role wants to use reviver feature
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    Then Able to Submit Selected Case to Revive

16.34_002B-Staff with non-supervisor role wants to use reviver feature
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When non-supervisor wants to revive notice      Revive TS
    Then Prompt message error display   Only the supervisory role can be Revive TS/PS

16.34_003-Page provide Revive TS details
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    Then Landing to TS details page with following column displayed
    
16.34_004-User want to see list of active TS
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    Then Last Active TS List Display

16.34_005A-Proceed to revive TS from selected notice
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    And Click Button on  Proceed
    Then Verify Pop up Alert Window      Confirmation  revive all the suspensions    Ok

16.34_006-User need to confirmation to revive suspension
    [Tags]  Duplicated  #16.34_006
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    And Click Button on  Proceed
    Then Verify Pop up Alert Window      Confirmation  revive all the suspensions    Ok

16.34_007B-Revive selected notice from TS stage
    Given Already Submit Reference Case to process Revive   ${NOPO4}        ${casenum}   Revive TS
    When Proceed to apply proccesing on selected notice      revive all
    Then Success to Revive Notice with Success Prompt Message

16.34_008-User wants to cancel the revive process
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    And Cancel the revive proccess
    Then Selected notice still on suspension State  TS

16.34_009-User wants to use revive TS function to revive PS-ed Notice
    Given User Already on Selected Case                         ${NOPOPS}       ${casePS}  
    When User Submit Selected Case to   Revive TS
    Then Prompt message error display   Notice is already in Permanent Suspend

16.35_001-Page provide drop-down to select functionality of revive
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Select Functionality Type with Scroll      Revive PS  
    Then Able to Select Nopo Functionality  Revive PS

16.35_002A-Staff with supervisor role wants to use reviver feature
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When User Submit Selected Case to   Revive TS
    Then Able to Submit Selected Case to Revive

16.35_002B-Staff with non-supervisor role wants to use reviver feature
    Given User Already on Selected Case                         ${NOPO4}        ${casenum}
    When non-supervisor wants to revive notice  Revive PS
    Then Prompt message error display   Only the supervisory role can be Revive TS/PS

16.34_003-Page provide Revive PS details
    Given User Already on Selected Case                         ${NOPOPS}        ${casenum}
    When User Submit Selected Case to   Revive PS
    Then Landing to PS details page with following column displayed

Proceed to revive PS from selected notice
    Given User Already on Selected Case                         ${NOPO3}       ${casenum}
    When User Submit Selected Case to   Revive PS
    And Click Button on  Proceed
    Then Verify Pop up Alert Window      Confirmation  Revive PS    Ok

User need to confirmation to revive suspension
    [Tags]  Duplicated  #16.35_006
    Given User Already on Selected Case                         ${NOPO3}         ${casenum}
    When User Submit Selected Case to   Revive PS
    And Click Button on  Proceed
    Then Verify Pop up Alert Window      Confirmation  Revive PS    Ok

Revive selected notice from PS stage
    Given Already Submit Reference Case to process Revive      ${NOPO3}         ${casenum}         Revive PS 
    When Proceed to apply proccesing on selected notice      Revive PS
    Then Success to Revive PS Selected Notice               ${NOPO3}

User wants to cancel the revive process
    Given User Already on Selected Case                         ${NOPO3}         ${casenum}
    When User Submit Selected Case to   Revive PS
    And Cancel the revive proccess
    Then Selected notice still on suspension State  PS

User wants to use revive PS function to revive TS-ed Notice
    Given User Already on Selected Case                         ${NOPO4}          ${casenum} 
    When User Submit Selected Case to   Revive PS
    Then Prompt message error display   Unable to Revive PS, Notice is not in Permanent Suspend