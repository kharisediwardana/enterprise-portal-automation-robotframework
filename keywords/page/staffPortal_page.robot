***Keywords***
User Landing on Plus Admin Page to Create New Case
    Click Create New Case Tab
    Verify on Appeal Details Tab

User in Selected Inbox
    [Arguments]     ${inboxtype}    ${case}
    Landing to Menu    ${inboxtype}
    Search for Case   ${inboxtype}  ${case}  
    Select Case to Edit     ${case}

User wants Access History Tab by Edit Case
    Verify on Summary Page
    Click Edit Case Button

User want to search History within date range
    [Arguments]   ${HistoryType}
    Click on Tab   Event Log
    Click on History type    ${HistoryType}
    Search Data within data range
    Filter Date Time by Newest

Input Data on Appeal Details
    [Arguments]   ${file1}  ${file2}
    Choose Case Date
    Input Case Time
    Input Case Title
    Input Case Description
    Input Officer Remark
    Set Driver as No
    Choose Primary OIC
    Choose Secondary OIC
    Upload Motorist Attachment   ${file1}
    Upload Officer Document      ${file2}
    

Input Data on Appellant Details Tab
    [Arguments]    ${num}   ${code}
    Verify on Tab   Appellant Details
    Input Appellant Details Name
    Choose ID Type      Singapore NRIC
    Input ID Number     ${num} 
    Choose Country Code Number  Singapore
    Input Mobile Number
    Choose Alternative Contact  
    Choose Alternative Contact Code Region      Singapore
    Input Alternative Contact Number
    Input Email Address
    Add Alternative Email
    Get Address with Input    ${code}
    #Set Mailing Address same as Registered Address

Input Data on Assessment Tab
    #Input Reduction Stage
    #Input Payment Due date
    #Input Reduction Amount
    #Input Reduction Payment Cut Time
    #Input Status of reduction 
    #Input Validity Date of Document
    #Input Date of Submission
    #Input PLM remarks
    Scroll to Bottom Page
    Select Supporting Officer
    #Input supporting officer remarks
    Select Approving Officer
    #Input apporving officer remarks

Get Address with Input
    [Arguments]  ${postal_code}
    Scroll To Bottom Page
    Choose Address Country Postal Code
    Get Registered Address       ${postal_code}

Input Data on Profile Tab
    Verify on Profile Tab
    Choose Case Type            A - Appeal
    Choose Feedback Channel     Media
    Choose Feeback Source       HI
    Scroll To Bottom Page
    Add Work Area

Add Work Area
    Click Work Area Button
    Select Work Area    Park short while
    Select Work Area    Feedback on parking facilities
    Scroll to Add Work Save Button

User Able to Edit Work Area
    User Landing on Profile Tab
    Add Work Area

Able to Edit Work Area
    Add Work Area
    User Able to Select Work Area

Select Work Area
    [Arguments]   ${critera}
    Choose Critera  ${critera}
    Select Reason
    Add Selected Work Area

User Try to Select Same Work Area
    Click Work Area Button
    Select Same Work Area
    Select Same Work Area
    Scroll to Add Work Save Button

Input Data on Reply tab
    Verify on Reply Tab
    #Choose Not Sending Email
    #Input Reply Date
    Choose Reply Status       No reply required
    Choose Reply Channel
    Input Reply Destination
    Input Reply Subject
    Input Reply Remark
    Upload Reply Attachment with        ${replyCaseFile}

User Able to Input all Field
    Able to Select Reply Status by dropdown
    Able to Select Reply Channel by dropdown
    Able to Input Email Direction by Suggestion
    Able to Input Reply Subject
    Scroll To Bottom Page
    Able to Input Reply Remark
    Able to Attach Document 

Add Reference Case
    [Arguments]   ${case}
    Verify on Reference Case Tab
    Search for Reference Case   ${case}
    Select Reference Case
    #Add Selected Reference Case     
    Click Reference Case Close Button

Add Multiple Reference Cases
    Add Reference Case      ${NOPO}
    Add Reference Case      ${NOPO2}

Summary Section Display Inputted Data
    Verify on Summary Tab
    Review Inputted Data

Summary Page Display Inputted Data
    Click Summary Tab
    Review Inputted Data

Review Inputted Data
    Inputted Appeal Details Data
    Inputted Appellant Details 
    Inputted Profile Data 
    Inputted Reply Data

User Input All Field With Valid Data
    [Arguments]     ${num}
    Input Data on Appeal Details        ${supportFile1}    ${supportFile2}
    Click Next Page Button
    Input Data on Appellant Details Tab      ${NRIC}  ${PostalCode}
    Click Next Page Button
    Input Data on Profile Tab
    Click Next Page Button
    #Input Data on Reply tab
    Click Next Page Button
    Add Reference Case               ${num}
    #Click Next Page Button
    #Input Data on Assessment Tab                 #Need to Confirmed about the feature
    #Click Next Page Button
    #Summary Section Display Inputted Data
    #Click Next Page Button
    #Verify on Case History section

User Able Submit Create New Case Data
    Submit Case
    Verify Submit Data is Success

User Landing on Appellant Details Tab
    User Landing on Plus Admin Page to Create New Case
    Click Next Page Button
    Verify on Tab    Appellant Details

Add New Appellant   
    [Arguments]   ${num}
    Click Button on     Add New Appellant
    Choose Add Appellant Title Name
    Input Add Appellant Title Name
    Choose Add Appellant ID Type
    Input Add Appellant ID Number    ${num}
    Input Add Appellant Contact Number 
    Input Add Appellant Alternative Contact Number
    Input Add Appellant Email
    Get Address on Add Appellant
    Scroll to OK Add Appelant

User Input Multiple Appellant with invalid Data
    Click Button On   Add New Appellant
    Choose Add Appellant ID Type
    Input Add Appellant ID Number    1111`11

User Already add Multiple Costumer
    User Landing on Appellant Details Tab
    Add Multiple Appellant

Add Multiple Appellant
    Add New Appellant     ${NRIC3}
    Add New Appellant     ${NRIC2}

User Want to Edit Existing Appellant
    Click Edit on Appellant Data
    Verify New Window is Display
    Choose Add Appellant Title Name
    Input Add Appellant Title Name
    Choose Add Appellant ID Type
    Input Add Appellant ID Number    ${NRIC}
    Input Add Appellant Contact Number 
    Input Add Appellant Alternative Contact Number
    Input Add Appellant Email
    Get Address on Add Appellant
    Scroll to OK Add Appelant

Address is Auto-populated
    Scroll to Bottom Page
    Get Street Name Address     

Submit Create New Case Data
    Click Submit Button
    Click Button on     Ok
    Verify Submit Data is Success

Address is Not Auto-populated
    Scroll to Bottom Page
    Address is Empty

Mailing Address auto-populated similar with Registered Address
    Scroll To Bottom Page
    Get Street Name on Mailing Address    ANG MO KIO AVENUE 6

Mark Checkbox Copy From Registered Address
    Click on Tab   Appellant Details
    Scroll To Bottom Page
    Verify Get Address is populated
    Set Mailing Address same as Registered Address

Change Mailing Address
    Mark Checkbox Copy From Registered Address
    #Choose Mailing Address Country Postal Code
    Get Mailing Address     546181

Mailing Address is Auto-populated
    Scroll to Bottom Page
    Get Street Name on Mailing Address  ANG MO KIO AVENUE 6

User Already Copy Address from Registered Address
    User Landing on Appellant Details Tab
    Mark Checkbox Copy From Registered Address

Input Data but forget Case Title
    Choose Case Date
    Input Case Time
    Input Case Description
    Input Officer Remark
    Set Driver as Yes
    Choose Primary OIC
    Choose Secondary OIC
    Upload Motorist Attachment   ${supportFile1}
    Upload Officer Document      ${supportFile2}
    Click Button on  Submit

Upload Attachment with 
    [Arguments]  ${file1}  ${file2}
    Upload Motorist Attachment   ${file1} 
    Upload Officer Document      ${file2}

User Able to Input Data on Appeal Details Field
    OIC Should be Selected
    Driver Should Be Selected
    Officer Remark Inputted
    Scroll To Top Page
    Case Title Inputted
    Case Description Inputted

User See Attachment List
    Motorist Document Attached
    Scroll To Bottom Page
    Officer Document Attached

User See Error Message Failed Attach File
    User See Error Message Invalid File Format
    Customer Attachment list Not Display
    Scroll To Bottom Page   
    Office Attachment list Not Display

User Landing on Profile Tab
    User Landing on Plus Admin Page to Create New Case
    Click Button on     Profile
    Verify on Profile Tab

Mark Checkbox Driver Status
    Scroll to Bottom Page
    Set Driver as Yes

User Landing on Reference Case Tab
    User Landing on Plus Admin Page to Create New Case
    Click Reference Case Tab

#!No need?!
Input Reference Case Search Data
    Add Reference Case      ${NoticeNum}
    Input Vehicle Number 
    Input Notice Number
    Input Summon Number
    Input NIRC Number 
    Input Start Date
    Input End Date
    Choose Payment Status

User Able to Add Multiple Nopo
    Scroll to Bottom Page
    User Able Add NOPO as Reference Case    ${NOPO}
    User Able Add NOPO as Reference Case    ${NOPO2}

User Assign Appellant as Driver 
    Click on Tab    Reference Case
    Scroll To Bottom Page
    Select Notice to Apply Processing   ${NOPO}
    Click Assign Appellant as Driver Button
    Get first Appellant name 
    Confirm Assign Appellant as Driver  [1]

User Wants Assign Driver without Fill Appellant Details
    Click Reference Case Tab
    Add Reference Case          ${NOPO}
    Select Added Nopo
    Click Assign Appellant as Driver Button 

User Already Fill Appellant Details Field
    Input Data on Appeal Details        ${supportFile1}    ${supportFile2}
    User Landing on Appellant Details Tab
    Input Data on Appellant Details Tab     ${NRIC}    ${PostalCode}

User Close Assign Appellant as Driver
    Click on Tab    Appellant Details
    Input Appellant Details Name
    Click on Tab    Reference Case
    Add Reference Case      ${NOPO}
    Select Added Nopo
    Click Assign Appellant as Driver Button
    Close Assign Appellant as Driver Window

User Already Assign driver as Appellant
    User Landing on Plus Admin Page to Create New Case
    User Already Fill Appellant Details Field
    Add Multiple Appellant
    Click Reference Case Tab
    debug
    Submit added reference case    ${NOPO}
    User Assign Appellant as Driver 
    User Able to Assign Nopo to Appellant

User Want to Re-Assign Appellant 
    Click Button on    Ok Got it
    Click Assign Appellant as Driver Button
    Confirm Assign Appellant as Driver  [2]

User Able to Change Driver Assign
    User Able to Assign Nopo to Appellant
    Click Button on    Ok Got it
    Submit Case
    Click Button on    Ok Got it
    Verify summary Data is Loaded
    Scroll To Bottom Page
    Select Notice to Edit     ${NOPO}
    Verify summary Data is Loaded
    Scroll to Section  Relation with Vehicle Owner
    Verify Assigned Appellant has changed
    

User Already Fill field
    User Landing on Plus Admin Page to Create New Case
    Input Data on Appeal Details        ${supportFile1}   ${supportFile2}
    Click Next Page Button
    Input Data on Appellant Details Tab   ${NRIC}    ${PostalCode}

User Able to Assign Case to OIC
    Verify Selected Primary OIC
    Verify Selected Secondary OIC

Able to Assign Case to OIC
    Verify summary Data is Loaded
    Verify on Draft section
    Get Case Number on Summary
    User Able to Assign Case to OIC

Saved case will display to personal inbox
    User Want to Login using selected User  Zulfi
    Landing to Menu    Inbox
    Search for Case   Inbox  ${case}
    Case save as Draft   ${case}

User Landing on Reply tab with Appellant Details Data
    User Already Fill Appellant Details Field
    Click Reply Tab

User Landing on Reply tab
    User Landing on Plus Admin Page to Create New Case
    Click Reply Tab

Input Email on CC and BCC
    Open CC field
    Input CC Email
    Open BCC Field
    Input BCC email

Search Data within data range
    Select Today Date
    Click Button on    Search
    Select Tomorrow Day
    Click Button on    Search

User Already Search for History
    User in Selected Inbox  Allocation Inbox    0101230500001
    User wants Access History Tab by Edit Case
    Search Data within data range

User Access Reference Case tab by Inbox entry point
    User in Selected Inbox  Inbox   ${casenum}
    User wants Access History Tab by Edit Case
    Click Reference Case Tab

User Submit NOPO to Selected NOPO decision 
    Select Notice to Apply Processing   ${NOPO}
    Click NOPO Decision Button
    Select NOPO Decision Type   Pending for Documents
    Click NOPO Decision Submit Button
    Verify Result Table is Display  
    Click Button on   Proceed
    Verify Notice is Submited

User Submit NOPO to Selected Functionality 
    Select Notice to Apply Processing   ${NOPO}
    Click Functional Button
    Select Functionality Type   Apply TS
    Click Select Functionality Submit Button
    Verify Result Table is Display  
    #Select TS Period    no need?
    Click Button on   Proceed
    Verify Notice is Submited
    

User Submit Selected NOPO Decision without Select NOPO
    Click NOPO Decision Button
    Select NOPO Decision Type   Pending for Documents
    Click NOPO Decision Submit Button

User Submit Selected NOPO Functionality without Select NOPO
    Click Functional Button
    Select Functionality Type   Apply TS
    Click Select Functionality Submit Button

Input Costumer with invalid ID Number
    Choose ID Type      Singapore NRIC 
    Input ID Number     11111

User Already Add Work Area
    User Landing on Profile Tab
    Add Work Area

Make Change on OIC Assigment
    Click on Tab    Appeal Details
    Scroll To Bottom Page
    Choose Primary OIC
    Choose Secondary OIC with   Zulfi
    Scroll To Top Page
    Submit Case
    Verify Submit Data is Success
    Click Edit Case Button

Make Change on NOPO Decision
    Click on Tab    Reference Case
    Verify Table is Loaded
    Select Added Nopo
    Click NOPO Decision Button
    Select NOPO Decision Type   Pending for Documents
    Click NOPO Decision Submit Button
    Click Button on  Proceed
    Verify Confirmation Submit Data
    Click Button on   Proceed Another Notice

User Select Story on Green tag
    Landing to Menu    Inbox
    Select Case on Green Tag
    User wants Access History Tab by Edit Case

User Select Case to Edit
    User in Selected Inbox    Inbox      ${casenum}
    User wants Access History Tab by Edit Case

Filter Date Time by Newest
    Click Date Time Filter
    Click Date Time Filter

Notice data is Update on OCMS
    Click Button    Ok Got it
    Click Added References Case
    Switch Window  New
    Verify Data is Updated

Notice data not Update on OCMS
    #Close Assign Appellant as Driver Window
    Click Button   Ok Got it
    Click Added References Case
    Switch Window  New
    Verify Data is Not Updated 

Submit Case and Back to Reference Case Tab
    Submit Case
    Click Button on     Ok Got it
    Click Edit Case Button
    Click Reference Case Tab


#!PLUS 15
User Can Access Personal Inbox  
    Landing on Personal Inbox
    Traffic Light Indicator Display
    Page Display Following Column

User Already Login as Manager
    User Want to Login using selected User  Zulfi
    User Already Login

Page Display Following Column
    Display Table Contain Column    S/N
    Display Table Contain Column    Appellant Name
    Display Table Contain Column    Feedback Source
    Display Table Contain Column    Case No.
    Display Table Contain Column    Case Type
    Display Table Contain Column    Case Description
    Display Table Contain Column    Days Left

Verification Inbox Contain Column
    Display Table Contain Column    S/N
    Display Table Contain Column    Case No.
    Display Table Contain Column    Case Type
    Display Table Contain Column    Feedback Source
    Display Table Contain Column    Last Processing Stage
    Display Table Contain Column    Payment Status
    Display Table Contain Column    Officer in Charge
    Display Table Contain Column    Supporting Officer
    Display Table Contain Column    Supporting &
    Display Table Contain Column    Document Validity Date
    Display Table Contain Column    Days Left
    Display Table Contain Column    Case Description
    Display Table Contain Column    Nopo Decision

Click on Auto Reply Inbox tab Menu
    Landing to Menu    Auto Reply Inbox
    Landing to Auto Reply Inbox

Summary of Assigned Case Displayed
    [Arguments]  ${num}
    Verify summary Data is Loaded
    Verify location is on Summary       ${num}
    Page Should Contain                 ${num}

User can Access
    [Arguments]   ${inbox}
    User Landing on Selected Inbox   ${inbox}
    Traffic Light Indicator Display
    Page Display Following Column

User can Access Verification Inbox
    User Landing on Selected Inbox   Verification Inbox
    Traffic Light Indicator Display
    Verification Inbox Contain Column

Able to Filter Case with Green Light Indicator
    Verify Result Table is Display  
    Filter Case By Traffic Light Green

Able to Filter Case with Red Light Indicator
    Verify Result Table is Display  
    Filter Case By Traffic Light Red

Able to Filter Case with Yellow Light Indicator
    Verify Result Table is Display  
    Filter Case By Traffic Light Yellow

User Already Save Case as Draft
    User Already Fill Appellant Details Field
    User save case with assigned OIC

User Already Landing on Personal Inbox
    User Already login
    Landing to Menu    Inbox

User Sorting Case Basic Information
    ${index}   Get Random Index of Inbox Column
    Click On Selected Inbox Column by Index     ${index}
    [Return]  ${index}

User Create Case with non Urgent Criteria
    User Landing on Plus Admin Page to Create New Case
    Input Data on Appeal Details    ${supportFile1}  ${supportFile2}
    Click Next Page Button
    Input Data on Appellant Details Tab     ${NRIC}   ${PostalCode}
    Click Next Page Button
    Verify on Profile Tab
    Choose Feeback Source       T
    User Able Submit Create New Case Data

Change Source with Urgent Criteria
    Landing to Menu    Inbox
    #Choose Case Date Filter on Allocation Inbox
    Search for Case    Inbox  ${case}
    #Verify Created Case is Loaded   ${case}
    Select Case to Edit       ${case}
    Click Edit Case Button
    Choose Feeback Source       CT
    User Able Submit Create New Case Data

Case Changed to Urgent Criteria
    Landing to Menu    Inbox
    #Choose Case Date Filter on Allocation Inbox
    Search for Case   Inbox  ${case}
    #Verify Created Case is Loaded   ${case}
    Scroll to Created Case  ${case}
    Red coloring-code display on Case
    
Create Case Using Urgent Criteria
    Input Data on Appeal Details    ${supportFile1}  ${supportFile2}
    Click Next Page Button
    Input Data on Appellant Details Tab     ${NRIC}   ${PostalCode}
    Click Next Page Button
    Input Data on Profile Tab
    User Able Submit Create New Case Data

User See Created Case Mark Urgent
    Landing to Menu     Inbox
    #Choose Case Date Filter on Allocation Inbox
    Search for Case   Inbox       ${case}
    #Verify Created Case is Loaded   ${case}
    Scroll to Created Case  ${case}
    Red coloring-code display on Case

Court Case Marked as Urgent Case
    Verify Table is Loaded
    Red coloring-code display on Case
    Case Marked Court Display

User Advance Search Case using ID type
    Verify Result Table Is Display  
    Click Advance Search
    Choose ID Type on Advance Search using      NRIC
    Input Identity Number on Advance Search using   ${NRIC}
    Click Button On    Apply

Then Able to Advance Search using ID Number
    Verify Result Table Is Display  
    Select Case to Edit    1406230500002
    Scroll to Text     Address
    Advance Search Result ID Number Valid

Able to Advance Search using Rule Code
    Verify Result Table is Display  
    Select Case to Edit    0307230500003
    Verify Summary Data Is Loaded
    Scroll to Text     Assessment
    Page Should Contain    30301

Able to Advance Search using NOPO Number
    Verify Result Table is Display
    Select Case to Edit    0201230500014
    Verify Summary Data Is Loaded
    Scroll to Text     Assessment
    Page Should Contain    241000037B

Able to Advance Search using Summon Number
    Verify Result Table is Display
    Select Case to Edit    0101230500004
    Verify Summary Data Is Loaded
    Scroll to Text     273502364M
    Page Should Contain    CASE123456/2021

User Submit the Draft Case
    Verify summary Data Is Loaded
    ${case}    Get Create Case Number
    Landing to Menu    Inbox
    Search for Case   Inbox    ${case}
    Verify Result Table Is Display
    #Verify Created Case Is Loaded   ${case}
    Case Attach with Draft Mark   ${case}
    Select Case to Edit    ${case}
    Click Edit Case Button
    Verify Profile Data is Loaded
    Submit Case
    Verify Submit Data is Success

Draft Mark Will Disappear
    Landing to Menu     Inbox
    Search for Case    Inbox  ${case}
    Verify Created Case is Loaded       ${case}
    Draft Mark not attached to cases    ${case}

Already landing on Reference case tab
    [Arguments]     ${num}
    User Already login
    User in Selected Inbox         Inbox    ${num}
    Click Edit Case Button
    Click on Tab   Reference Case
    Wait Until Page Process is Complete
    

User Already on Selected Case
    [Arguments]   ${notice}     ${num}
    Already landing on Reference case tab   ${num}
    Select Notice to Apply Processing   ${notice}

NOPO Decision that will trigger TS is displayed via dropdown NOPO Decision menu
    NOPO Decision Drop Down Button Contains     Pending for Documents
    NOPO Decision Drop Down Button Contains     Deferred
    NOPO Decision Drop Down Button Contains     Rejected

User Select Decision type
    [Arguments]   ${decision}
    Click NOPO Decision Button
    Select NOPO Decision Type   ${decision}

User Select Functionality type
    [Arguments]   ${func}
    Click Functional Button
    Select Functionality Type   ${func}

User Select Functionality Type with Scroll
    [Arguments]  ${type}
    Click Functional Button
    Scroll To Bottom Page
    Select Functionality Type   ${type}

page display info needed to TS the notice
    Suspension Summary section contain      Notice No.
    Suspension Summary section contain      Vehicle No.
    Suspension Summary section contain      NOPO Decision
    Suspension Summary section contain      Number of Days
    Suspension Summary section contain      Suspension Code
    Suspension Summary section contain      Remarks
    Suspension Summary section contain      Action

User Already Submit Notice to Apply Nopo Decision
    [Arguments]  ${notice}
    User Already on Selected Case       ${notice}           ${casenum}
    User Submit Notice to Apply NOPO Decision       Deferred 

Permanent suspned Details display several columns
    Suspension Summary section contain      Notice No.
    Suspension Summary section contain      Vehicle No.
    Suspension Summary section contain      NOPO Decision
    Suspension Summary section contain      Suspension Code
    Suspension Summary section contain      Remarks
    Suspension Summary section contain      Action

User Submit Notice to Apply NOPO Decision
    [Arguments]   ${type}
    User Select Decision type  ${type}  
    Click NOPO Decision Submit Button

Apply Nopo Decision on Selected Notice
    User Submit Notice to Apply NOPO Decision   Deferred 
    Wait Until Page Process is Complete
    User Want to edit Number of days    14
    User Want to Input Remarks on NOPO processing   TES
    Click Button on  Proceed
    Verify Pop up Alert Window   Confirmation  Deferred  Ok
    Click Button On  Ok

User Select Mutiple Notice to TS-ing
    Select Notice to Apply Processing   ${NOPOTS}
    Select Notice to Apply Processing   ${NOPOTS2}
    User Submit Notice to Apply NOPO Decision           Deferred 

User Already Submit case to Full Waiver
    User Already on Selected Case                         ${NOPOTS}        ${casenum}  
    User Submit Notice to Apply NOPO Decision              Full Waiver

User Able to Select Reason of Suspension
    [Arguments]  ${reason}
    ${text}   Get text     xpath=(//tr[@class="fw-1"]//span)[4]
    Should be equal  ${text}    ${reason}

User already select notice to apply functionality 
    [Arguments]   ${num}   ${num2}   ${func}
    User Already on Selected Case                         ${num}    ${num2}
    User Select Functionality type     ${func}
    Click NOPO Funcationality Submit Button

Verify Notice not in Court Stage
    Verify notice not in stage          CSD
    Verify notice not in stage          COS
    Verify notice not in stage          COW
    Verify notice not in stage          CWW

User already select notice with no PS or court status
    User Already on Selected Case                         ${NOPOTS}        ${casenum}
    Verify notice not in stage          PS
    Verify Notice not in Court Stage
    Apply Funcationality Permanent Suspension with        APP - Appeal Accepted

Apply Funcationality Permanent Suspension with
    [Arguments]   ${code}
    User Select Functionality type     Apply PS
    Click NOPO Funcationality Submit Button
    Wait Until Page Process is Complete
    Select suspension code on PLUS                  ${code}

User already select notice with no PS or court status to Apply Full Waiver
    User Already on Selected Case                         ${NOPOTS}        ${casenum}   
    Verify notice not in stage          PS
    Verify Notice not in Court Stage    
    User Select Decision type  Full Waiver 
    Click NOPO Decision Submit Button

Proceed to apply proccesing on selected notice
    [Arguments]   ${proccess}
    Click button on  Proceed
    Verify Pop up Alert Window      Confirmation  ${proccess}    Ok
    Click Button on  Ok

Suspension status of selected notice change to PS
    [Arguments]   ${num}    ${reason}
    Click Button on  Ok Got it
    Click Button on  Proceed Another Notice
    Wait Until Page Process is Complete
    Verify Notice is on stage   ${num}    PS
    Verify Notice is on stage   ${num}    ${reason}
    User Want to Login using selected User  TEST
    Wait Until Page Process is Complete
    Select Notice to Apply Processing   ${num}
    Revive PS to Selected Notice
    

Revive PS to Selected Notice
    User Select Functionality type      Revive PS
    Click NOPO Funcationality Submit Button
    Wait Until Page Process is Complete
    Proceed to Revive Suspension
    Prompt message success is display

Proceed to Revive Suspension
    Click Button on   Proceed
    Verify Pop up Alert Window      Confirmation  Revive PS    Ok
    Click Button on  Ok

Applied PS using reason
    [Arguments]   ${reason}
    User Select Functionality type     Apply PS
    Click NOPO Funcationality Submit Button
    Select suspension code on PLUS                 ${reason}
    Proceed to apply proccesing on selected notice      Apply PS

Success to applied PS using reason
    [Arguments]   ${reason}
    Success to apply Suspension on Selected Notice     ${NOPOTS}   Applied PS successfully
    Suspension status of selected notice change to PS   ${NOPOTS}  ${reason}

non autorized user want to apply PS to selected notice
    User Want to Login using selected User  Steven
    User Select Functionality type     Apply PS

Selected notice proccesing stage to PS 
    Success to apply Suspension on Selected Notice     ${NOPOTS}   status successfully submited
    Suspension status of selected notice change to PS  ${NOPOTS}  APP

User already select notice under PS status
    User Already on Selected Case                         ${NOPOPS}    ${casenumPS}  
    Verify Notice is on stage   ${NOPOPS}       PS

Sumbit selected notice to apply full waiver
    User Select Decision type  Full Waiver 
    Click NOPO Decision Submit Button

User See History of NOPO Decision
    Click Button on  Ok Got it
    Click Button on  Proceed Another Notice
    Click on Tab  Event Log
    Click on History type    PLUS NOPO Decision

Already Proceed to Applied PS on Selected Reference Case
    User already select notice with no PS or court status
    Proceed to apply proccesing on selected notice     Apply PS
    Success to applied PS using reason     APP

History is Updated according latest decision make
    Wait Until Page Process is Complete
    Verify History is Update

Set case reply status to
    [Arguments]   ${status}
    Click Button on  Ok Got it
    Click Button on  Proceed Another Notice
    Click on Tab  Reply
    Choose Reply Status     ${status}

Case send to Close Case Inbox with Closed Status
    Click Button on  Submit
    Verify to sumbit cases
    Verify Submit Data is Success
    Landing to Menu    Closed Cases
    Search for Case    Closed Cases  ${case}
    Page Should Contain   Closed

PLM user cannot edit the case
    User Want to Login using selected User  Zulfi
    Landing to Menu    Inbox
    Search for Case    Inbox  ${case}
    Verify Result Table is Display
    User in Selected Inbox         Inbox    ${case}
    Edit Button Should be disable

#PLUS 16
non-supervisor wants to revive notice
    [Arguments]   ${func}
    User Select Functionality Type with Scroll      ${func}
    Click NOPO Funcationality Submit Button

User Submit Selected Case to
    [Arguments]   ${func}
    User Want to Login using selected User  TEST
    User Select Functionality Type with Scroll       ${func}  
    Click NOPO Funcationality Submit Button

Landing to TS details page with following column displayed
    Suspension Summary section contain      Notice No.
    Suspension Summary section contain      Vehicle No.
    Suspension Summary section contain      Functionality
    Suspension Summary section contain      Suspension Code
    Suspension Summary section contain      Notice Type 
    Suspension Summary section contain      Last Processing Stage 
    Suspension Summary section contain      Reason to Revive TS

Landing to PS details page with following column displayed
    Suspension Summary section contain      Notice No.
    Suspension Summary section contain      Vehicle No.
    Suspension Summary section contain      Functionality
    Suspension Summary section contain      Suspension Code
    Suspension Summary section contain      Reason to Revive PS

Able to Submit Selected Case to Revive
    ${loc}  Get Location   
    Should be Equal   ${loc}   ${PLUSADMIN}cce-agents/edit/${casenum}/reference_case/nopo_processing
    Suspension Summary section contain      Reason to Revive TS

Last Active TS List Display
    Scroll To Bottom Page
    Verify Table is Loaded
    Page Should Contain   Active Suspension to be Revived

Cancel the revive proccess
    Click Button on  Proceed
    Click Button on  Cancel

Already Submit Reference Case to process Revive
    [Arguments]  ${NOPO}  ${case}   ${func}
    User Already on Selected Case            ${NOPO}    ${case}
    User Submit Selected Case to    ${func}

Applied Temporary Suspend on Selected refence case
    [Arguments]     ${num}
    Wait Until Page Process is Complete
    Select Notice to Apply Processing   ${num}
    Apply Nopo Decision on Selected Notice
    Success apply TS to TS-ed Notice    ${num}

Success to Revive Notice with Success Prompt Message
    Success to apply Suspension on Selected Notice     ${NOPO4}     Revive TS successfully
    Click Button on  Ok Got it
    Click Button on  Proceed Another Notice
    Verify Notice is on stage  ${NOPO4}     -
    Applied Temporary Suspend on Selected refence case  ${NOPO4}

Success to Revive PS Selected Notice
    [Arguments]     ${num}
    Success to apply Suspension on Selected Notice      ${num}     Revive PS
    Click Button on  Ok Got it
    Verify notice not in stage                          PS
    Click Button on  Proceed Another Notice
    Select Notice to Apply Processing                  ${num}
    Apply Funcationality Permanent Suspension with        VST - Valid Season Ticket
    Wait Until Page Process is Complete
    Proceed to apply proccesing on selected notice  Apply PS
    Prompt message success is display

User Will See Missing Data Alert
    Click Button on  Ok Got it
    Scroll To Top Page
    Error Message Validator Empty Data display      Case Title is required