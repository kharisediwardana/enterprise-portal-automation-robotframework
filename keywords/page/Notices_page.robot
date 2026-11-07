***Keywords***
User Landing on Notice Page
    Verify Portal Logo is Loaded
    Verify Page have Create Notice Side Bar Menu

Click on Side Bar Menu
    [Arguments]   ${menu}
    Open Side Bar Menu Drop Down    Notices
    Open Side Bar Menu              ${menu}s
    Verify Page Title is            ${menu}

Verify Vehicle Details Section Contain Field
    Verify Page Contains Field   Registration Type
    Verify Page Contains Field   Vehicle No.
    Verify Page Contains Field   Vehicle Category
    Verify Page Contains Field   Vehicle Make
    Verify Page Contains Field   Vehicle Color
    Verify Page Contains Field   Road Tax Expiry
    Verify Page Contains Field   IU No.

Verify Offence Details Section Contain Field
    Scroll to Section  Notice of Parking Offence Details
    Verify Page Contains Field   Offence Notice No.
    Verify Page Contains Field   Notice Type

Verify Notice Parking Offence Details Section Contain Field
    Scroll to Section            Composition Amount
    Verify Page Contains Field   Date of Offence
    Verify Page Contains Field   Time of Offence
    Verify Page Contains Field   Parking Lot No.
    Verify Page Contains Field   PO. ID
    Verify Page Contains Field   Rule Infringed Code
    Verify Page Contains Field   Place of Offence
    #Verify Page Contains Field   Due Date of Revival
    Verify Page Contains Field   Composition Amount
    #Verify Page Contains Field   Administration Fee
    #Verify Page Contains Field   Surcharge Fee
    Scroll to Section  Batch Details
    #Verify Page Contains Field   Total Amount
    #Verify Page Contains Field   Incentive Payment Date
    #Verify Page Contains Field   Incentive Payment Amount
    Verify Page Contains Field   Remarks
    Verify Page Contains Field   Motorist Document
    Verify Page Contains Field   Officer Document

Landing on Create Notice Tab
    User Landing on Notice Page
    Click on Side Bar Menu  Create Notice

Verify Batch Detail Section Contain Field
    Scroll To Bottom Page
    Verify Page Contains Field   Batch No.
    Verify Page Contains Field   Batch Date
    Verify Page Contains Field   Created By
    Verify Page Contains Field   Source

Create Notice Page Contains Following Field
    Verify Page Title is    Create Notice
    Verify Vehicle Details Section Contain Field
    Verify Offence Details Section Contain Field
    Verify Notice Parking Offence Details Section Contain Field
    Verify Batch Detail Section Contain Field

User Input All Mandatory Field Create Notice
    Input Vehicle Data       ${VehicleNum3}
    Input Notice of Parking Offence Details Data
    Input Batch Details Data
    
Input Vehicle Data
    [Arguments]   ${num}
    Select Registration Type    S - LOCAL
    Notices_logic.Input Vehicle Number     ${num}
    Select Vehicle Category     C - Car
    Input Vehicle Maker     MUSTIBISA
    Input Vehicle Color     Cyan
    Scroll to Section  Offence Notice No.
    Select Road Text Expiry

User clear the form
    Scroll to Section  Offence Notice No.
    Click Button on  Clear Form

Input Notice of Parking Offence Details Data
    Scroll to Section   Composition Amount
    Select Offence Date
    Input Notice Offence Time
    Input Parking Lot
    Select POID
    Select Rule Infernged
    Select Place of Offence
    Scroll to Section  Documents to be attached
    #Input Due Date Revival
    Select Composition Amount
    #Select Administration Fee
    #Select Surcharge Fee
    #Select Incentive Payment Date
    #Select Incentive Payment
    Input Notice Remark
    Scroll to Section  Batch Details
    Upload Notice Attachment with  ${supportFile1}

Input Batch Details Data
    Scroll To Bottom Page
    Input Batch Number
    Select Batch Date
    #Click Button on    Next Page

Input Driver Details Data
    Click Button on    Driver Details
    Click Notice Edit Button
    Inpur Driver Name
    Input Driver ID Number     ${NRIC}
    OCMS5_logic.Input Postal Code
    Input Driver Phone Number
    Select Driver Relation
    Copy Notice Mailing Address from Registered Address

Edit Created Notice
    Click Button on   Edit
    Verify on Menu    Edit Notice

Add Driver Data
    Edit Created Notice
    Input Driver Details Data
    Submit Created Notice
    Verify Notice is Submited

User Create Notice with empty mandatory field
    Input Vehicle Data      ${EMPTY}
    Input Notice of Parking Offence Details Data
    Input Batch Details Data
    Scroll To Top Page
    Click Button on    Save

Failed to Create Notice
    Verify Modal Window Visible
    Modal Window Text is    Failed to submit the notice. Please check your form.

All Field on Section is Cleared
    Registration type is cleared
    Vehicle Number is cleared
    Vehicle Category is cleared
    Vehicle Maker is cleared
    Vehicle Color is cleared
    Vehicle road tax expiry is cleared
    IU Number is Cleared

Already fill Vehicle Data
    Landing on Create Notice Tab
    Input Vehicle Data      ${VehicleNum}

Select Data dropdown-list with value
    Scroll to Section   Composition Amount
    Sleep  .5
    Select POID

Already select vehicle category and rule infernged
    Landing on Create Notice Tab
    Select Vehicle Category     C - Car
    Scroll to Section  Officer Document
    Select Rule Infernged

Composition Amount According to Vehicle Category
    Amount value should be   2
    Composition Amount Contain Value        $ 50
    Composition Amount Contain Value        $ 70

User Select Special Registration type
    Landing on Create Notice Tab
    Select Registration Type    V - VIP
    Select Vehicle Category     C - Car

Prompt Message Mandatory Field Empty is Display
    Click Button on  Ok Got it
    Error Invalid Data Display    Please fill in Vehicle No.

User Want to go CSV page
    Scroll to Section  Composition Amount
    Click Button on  Upload CSV for Multiple Notices

User wants to download CSV Template
    User Want to go CSV page
    Download CSV Template

Instruction step creating notice by CSV file is displayed
    Verify Page Title is            Parking Offence Notices Upload
    Page Contain Step to CSV File Upload

Already attach CSV File with
    [Arguments]  ${CSV}     ${doc}
    Landing on Create Notice Tab
    User Want to go CSV page
    Remove File if Attached
    Upload Notice Attachment with  ${CSV}
    Verify CSV is Attached      ${doc}

Already fill all mandatory field
    Landing on Create Notice Tab
    User Input All Mandatory Field Create Notice

Summary Notice Display
    Modal Window Text is  Your notice has been successfully submitted.
    Click Button on  Ok Got it
    Verify summary Data is Loaded

Offence Notice Number auto-generated
    Summary Notice Display
    Verify Notice Number

Already Create Notice
    Already fill all mandatory field
    When Submit Created Notice
    Offence Notice Number auto-generated

Created notice able to view on View Notice
    Search Result Display Correctly               ${createdNotice} 
    Verify Search notice is Created notice

Able to edit Record
    Verify Page Title is  Upload Preview
    Select Notice to Edit     FR3395A
    Verify Page Title is  View Record
    Click Button on  Edit
    Verify Page Title is  Edit Record

Already Landing on Upload CSV page
    Landing on Create Notice Tab
    User Want to go CSV page

#OCMS 17
User Click on Search type
    Landing on View Notices Tab
    Verify Result Table is Display  
    Click On Button  Search By

Landing on View Notices Tab
    Open Side Bar Menu Drop Down    Notices
    Open Side Bar Menu              View Notices 2
    Verify Page Title is            View Notices

Search Function by Category Display
    Search Category     Notice Number
    Search Category     Vehicle Number
    Search Category     Summon Number
    Search Category     Warrant Number

Click Search Advance Type
    [Arguments]   ${type}
    Click on Button   ${type}
    Verify Drop Down is Loaded  ${type}

Search by ID Type Display
    Search Using ID Number
    Click Search Advance Type   ID Type
    Search Category     NRIC
    Search Category     FIN
    Search Category     Passport
    Search Category     UEN
    Close Advance Search Dropdown

Search by Offender Type
    Click Search Advance Type   Offender Type
    Search Category     D - Driver
    Search Category     O - Owner
    Search Category     H - Hirer
    Close Advance Search Dropdown

Search by Notice Type
    Click Search Advance Type  Notice Type
    Search Category     O - Parking Offence
    Search Category     E - Payment Evasion
    Search Category     U - Unauthorized Use of Parking Lots
    Close Advance Search Dropdown

Search by Suspension Type
    Click Search Advance Type   Suspension Type
    Search Category     A - Advisory Notice
    Search Category     O - Parking Offence
    Search Category     E - Payment Evasion
    Search Category     U - Unauthorized Parking
    Search Category     T - Parking Coupon
    Close Advance Search Dropdown

Search by Reason Suspension
    Click Search Advance Type   Reason of Suspension
    Search Category     ANS - Advisory Notice
    Search Category     APE - Appeal Extension
    Search Category     APP - Appeal Accepted
    Close Advance Search Dropdown

Search by Vehicle of Registration Type
    Click on Button  Vehicle of Registration Type
    Search Category     D - DIPLOMAT
    Search Category     F - FOREIGN
    Search Category     I - MINDEF
    Close Advance Search Dropdown

Advance Search Feature Display
    Search by ID Type Display
    Search by Offender Type
    Search by Notice Type
    Search Advance Computer Rule Display
    Search Advance Court Mention Date Display
    Scroll to Middle of Page
    Search by Suspension Type
    Search by Reason Suspension
    Search Advance NTAC

User Search Notice Using
    [Arguments]  ${type}   ${num}
    User Click on Search type
    Search Notice Using         ${type}
    Input Search Using Number   ${num}
    Sleep   .5
    Click Button On  Search

User Search for created Notice
    User Landing on Notice Page
    Open Side Bar Menu Drop Down    Notices
    Open Side Bar Menu              View Notices 2
    Verify Page Title is            View Notices
    User Search Notice Using   Notice Number        ${createdNotice}

Search Result Display Correctly
    [Arguments]   ${notice}
    Verify Result Table is Display 
    Sleep   .5 
    Verify Search Result is Correct     ${notice}

Search notice by Upload CSV using  
    [Arguments]     ${file}
    User Want see Advance Search
    Scroll to Middle of Page 
    Landing on CSV upload page
    Upload CSV to Search        ${file}

Search Advance by ID Type Using
    [Arguments]   ${num}
    User Want see Advance Search
    Click Search Advance Type   ID Type
    Search Notice in Advance Using  NRIC   ${num} 
    Scroll to Middle of Page
    Click Button on  Apply

User advance search using offender type
    User Want see Advance Search
    Click Search Advance Type   Offender Type
    Select Offender Type    D - Driver
    Scroll to Middle of Page
    Click Button on  Apply

Search Result Display Column with Several Data
    [Arguments]  ${num}
    Search Result Display Correctly     ${num}
    Page Display Column     Notice No.
    Page Display Column     Notice Type
    Page Display Column     Offence Date
    Page Display Column     Place of
    Page Display Column     Rule Code
    Page Display Column     Processing Stage
    Page Display Column     Vehicle No.
    Page Display Column     Registration Type
    Page Display Column     Suspension
    Page Display Column     Reason of
    Page Display Column     Payment Status
    Page Display Column     Amount Payable

User Wants to View Single Notice
    [Arguments]    ${notice}
    User Search Notice Using    Notice Number     ${notice}
    Search Result Display Correctly            ${notice}
    Select Notice from Search Result           ${notice}

Select Multiple Notice to View
    Short Table by Notice number
    Select Notice to View   1
    Select Notice to View   2
    Select Notice to View   3
    Open Multiple Notices

Select Single Notice to View 
    Scroll To Top Page
    Select Notice to View   1
    Open Multiple Notices
    Switch Window   New

Able to advance search using offender type
    Verify Result Table is Display
    Select Single Notice to View
    Verify Summary Data Is Loaded
    Selected notice have driver details

Able to advance search using rule infernged
    Verify Result Table is Display  
    Select Single Notice to View
    Verify Summary Data Is Loaded
    Scroll to Section  Total Amount
    Page Should Contain    Failure to pay parking charges using the prescribed method when parking in a coupon parking place - entering incorrect class of vehicle

Already Search with Multiple Result
    [Arguments]    ${num}
    Landing on Notices Page
    User Search Notice Using   Vehicle Number       ${num}
    Verify Result Table is Display  
    Verify Search Result Vehicle Correctly              ${num}

Able to View Details of Multiple Notices
    Notices Opened Multiple     341000147H       1
    Notices Opened Multiple     341000146B       2    
    Notices Opened Multiple     341000142M       3

Select All Notice on Search Result
    Select All Notice
    Open Multiple Notices

Able to Apply Temporary Suspend
    Verify Notice Title Page    Temporary Suspension (TS)
    Direct to Temporary Suspend Details Page

User Select Notice to Temporary Suspend
    Select Notice to View   2
    Apply Temporary Suspend on Selected Notice
    
User Select First Notice to Temporary Suspend
    Select Notice to View   1
    Apply Temporary Suspend on Selected Notice

Apply Temporary Suspend on Selected Notice
    Click on Button  Apply Operation
    Select Apply Operation Option       Apply TS
    Click Button on  Select
    
Apply Operation to Selected Notice
    [Arguments]  ${operation}
    Click on Button  Apply Operation
    Select Apply Operation Option        ${operation}
    Click Button on  Select

User Already Search Notice with Permanen Suspend Status
    Landing on Notices Page
    User Search Notice Using    Notice Number      ${NOPOPS} 
    Verify Notice on Permanen Suspend Status

Not Able to Apply Temprorary Suspend
    Verify Pop Up Window Display
    Verify Message on Pop Up Window   1 out of 1 Notices Failed to Applied Temporary Suspension (TS). Please see the error details of each notice in table.
    
User Already Submit Notice to Apply Suspension
    [Arguments]   ${notice}
    Landing on Notices Page
    User Search Notice Using    Notice Number     ${notice}
    Search Result Display Correctly               ${notice}

Proceed to Temporary Suspend Selected Notice
    User Select First Notice to Temporary Suspend
    Able to Apply Temporary Suspend
    Select Suspension Code 
    Click Button on   Procced to TS

#OCMS 17
The first Section will displays a notice summary table 
    Verify Suspension Summary is Loaded  
    Suspension Summary section contain      Notice No.
    Suspension Summary section contain      Notice Type
    Suspension Summary section contain      Offence Date
    Suspension Summary section contain      and Time
    Suspension Summary section contain      Place of
    Suspension Summary section contain      Offence
    Suspension Summary section contain      Rule Code
    Suspension Summary section contain      Current
    Suspension Summary section contain      Processing Stage
    Suspension Summary section contain      Vehicle No.
    Suspension Summary section contain      Suspension
    Suspension Summary section contain      Status
    Suspension Summary section contain      Reason of
    Suspension Summary section contain      Suspension
    Suspension Summary section contain      Payment Status
    Suspension Summary section contain      Amount Payable
    Suspension Summary section contain      Action

The 2nd section allows the user to configure the Suspension details
    Scroll To Bottom Page
    Suspension Summary section allow input        Suspension Code
    Suspension Summary section allow input        Number of Days
    Suspension Summary section allow input        Remarks
    Suspension Summary section allow input        Created By
    Suspension Summary section allow input        Authorized By


Landing Temporary Suspend Page 
    Already Search with Multiple Result   ${VehicleNum}
    User Select Notice to Temporary Suspend

Already select Temporary Suspension Code
    Already Search with Multiple Result   ${VehicleNum}
    and User Select Notice to Temporary Suspend
    Select Suspension Code 

Already Proceed to TS Notice
    Landing Temporary Suspend Page 
    Select Suspension Code 
    Input Temporary suspension remarks field 
    Click Button on   Procced to TS

No Field Cleared after cancel TS
    Scroll To Bottom Page
    Able to Input Suspension 
    And Remarks Character Count Display        25 character left

User Proceed to TS Multiple Notices
    Select All Notice
    Apply Temporary Suspend on Selected Notice
    Select Suspension Code 
    Click Button on   Procced to TS
    Able to Temprorary Suspend Notice
    Click button on  Ok Got it

Summary table list is displayed with suspension status updated to TS 
    Verify Table is Loaded
    Page Should Contain  TS
    Scroll To Bottom Page
    Temporary Suspension Record Display Field    Suspension Code
    Temporary Suspension Record Display Field    Number of Days
    Temporary Suspension Record Display Field    Remarks
    Temporary Suspension Record Display Field    Created By
    Temporary Suspension Record Display Field    Authorized By
    Temporary Suspension Record Display     APE - Appeal Extension
    Temporary Suspension Record Display     14
    Temporary Suspension Record Display     OIC 1

Apply Operation to Multiple Notice with
    [Arguments]    ${operation}
    Verify Result Table is Display  
    Select All Notice
    Apply Operation to Selected Notice   ${operation}

Already Select Notice to Temprorary Suspend
    Landing Temporary Suspend Page 
    Select Suspension Code 

User Proceed Single notice to Temporary Suspend
    Click Button on   Procced to TS
    Able to Temprorary Suspend Notice
    Click button on  Ok Got it

Advance Search Display Correct Data
    [arguments]  ${num} 
    Select Notice from Search Result            341000160H
    Verify Summary Data Is Loaded
    Scroll to Section  Relation with Vehicle Owner
    Page Should Contain   ${num}        message=Its display notice with wrong ID


#OCMS 18
Already Select Notice to Apply Operation
    [Arguments]     ${num}
    Landing on Notices Page
    User Search Notice Using   Notice Number       ${num}

Apply Permanent Suspension to Selected Notice 
    [Arguments]     ${num}
    Verify Result Table is Display  
    Verify Search Result Vehicle Correctly       ${num} 
    Select Notice to View   1
    Apply Operation to Selected Notice   Apply PS

Able to Apply Permanen Suspension to Selected Notice
    Verify Notice Title Page     Permanent Suspension (PS)
    ${loc}   Get Location
    Should be Equal    ${loc}   ${OCMS5PAGE}notices/ps/ps_details

User wants to Download CSV Search Template
    User Want see Advance Search
    Scroll to Middle of Page
    Landing on CSV upload page
    Download CSV Template

Already Select Notice with PS State to PS-ing
    User Already Search Notice with Permanen Suspend Status
    Apply Permanent Suspension to Selected Notice  ${NOPOPS}
    Modal Window Text is   1 out of 1 Notices Failed to Applied Permanent Suspension (PS). Please see the error details of each notice in table.

User Wants to Manually Override PS
    Click Button on  Manually Ovveride PS
    Verify Pop up Alert Window   Confirmation  Manually Ovverride   Ok
    Click Button On  Ok

Permanent Suspension Page Display Following Column
    The first Section of Page will displays a notice summary table  
    2nd section allows the user to configure the Permanent Suspension details

The first Section of Page will displays a notice summary table  
    Verify Suspension Summary is Loaded
    Page Display First Section of Summary

2nd section allows the user to configure the Permanent Suspension details
    Scroll To Bottom Page
    Suspension Summary section allow input        Suspension Code
    Suspension Summary section allow input        Reason for Permanent Suspension
    Suspension Summary section allow input        Created By
    Suspension Summary section allow input        Authorized By

User Proceed to PS Selected Notice
    [Arguments]   ${num}
    Apply Permanent Suspension to Selected Notice  ${num}
    Select Suspension Code 
    Click Button on  Next Page
    Scroll To Top Page
    Click Button on  Procced to PS

User Proceed to PS Selected Notice with empty mandatory field
    Apply Permanent Suspension to Selected Notice   341000531T
    Click Button on  Next Page
    Click Button on  Procced to PS

Able to Permanent Suspend Notice
    [Arguments]  ${num}
    Confirm to PS Selected Notice
    Verify Table is Loaded
    Page Should Contain  PS
    Revive Notice Already Apply Suspension      ${num}
    
Confirm to PS Selected Notice
    Verify Pop up Alert Window   Confirmation  Permanent Suspension   Ok
    Click Button On  Ok
    Modal Window Text is        Permanent Suspension Applied Successfully to 1 Notices.
    Click button on  Ok Got it

Revive Notice Already Apply Suspension
    [Arguments]  ${num}
    Click Button on  Procced To Another Notice
    Open Side Bar Menu              View Notices 2
    Verify Page Title is            View Notices
    User Search Notice Using   Notice Number        ${num} 
    Revive Suspension Notice                        ${num}

Able to Revival Notice
    Verify Pop up Alert Window on e-Service   Confirmation  Revive   Ok
    Click Button On  Ok
    Modal Window Text is        Revival Suspension Applied Successfully to 1 Notices.

Selected Notice Suspension Summary Display
    Click Button on  Cancel
    Page Display First Section of Summary

Permanen Suspension Record Display
    Click Button on  Cancel
    Scroll To Bottom Page
    Temporary Suspension Record Display     ANS - Advisory Notice
    Temporary Suspension Record Display     OIC 1

Already Proceed to Apply Permanen Suspension
    Already Select Notice to Apply Operation  341000531T
    User Proceed to PS Selected Notice         341000531T

User wants to See Suspension Record
    [Arguments]     ${num}
    Verify Result Table is Display  
    Verify Search Result Vehicle Correctly       ${num}
    Select Notice from Search Result             ${num}
    Verify summary Data is Loaded
    Click Button on  Edit
    Verify Landing on Edit Notice Page
    Click Button on  History
    Click on TS/PS History

Able to advance search using Reason of Suspension
    Verify Result Table is Display  
    Scroll table Horizontally
    Page Should Contain    ANS

#OCMS 19
#? Revival Notice
Revive Suspension Notice
    [Arguments]   ${num}
    User Select Notice to Revive    ${num}
    User Proceed to Revival Permanent Suspension
    Able to Revival Notice

User Select Notice to Revive
    [Arguments]   ${num}
    Verify Result Table is Display  
    Verify Search Result Vehicle Correctly       ${num} 
    Select Notice to View   1
    Apply Operation to Selected Notice   Apply Revival

Input Revival Notice Record
    Scroll To Bottom Page
    Input Revival Reason
    Input Revival Remarks
    Select Staff Authorized By

User Proceed to Revival Permanent Suspension
    Verify Revival Page is Loaded
    Input Revival Notice Record
    Click Button on  Next Page
    Scroll To Top Page
    Click Button on  Procced to Revival
    
User Already Search Notice to Revive
    [Arguments]   ${num}
    Landing on Notices Page
    User Search Notice Using   Notice Number    ${num}

User Proceed to Revival Temporary Suspension
    Verify Revival Page is Loaded
    Select Temporary Suspension to revive
    Input Revival Notice Record
    Click Button on  Next Page
    User Proceed to Revival
    Verify Pop up Alert Window      Confirmation    Revive   Ok
    Click Button on  Ok

User able to revive selected notice from suspension
    Modal Window Text is        Revival Suspension Applied Successfully to 1 Notices.
    Click Button on  Ok Got it

Apply TS to Revival Notice
    Search for Notice which just apply opeartion    ${NOPOTS}
    Apply Temporary Suspend on Searched Notice

Apply Temporary Suspend on Searched Notice
    User Select First Notice to Temporary Suspend
    Select Suspension Code 
    Click Button on   Procced to TS
    Able to Temprorary Suspend Notice

Search for Notice which just apply opeartion
    [Arguments]   ${num}
    Click Button on  Procced To Another Notice
    Wait Until Page Process is Complete
    #Open Side Bar Menu              View Notices 2
    #Verify Page Title is            View Notices
    #Verify Result Table is Display  
    Click On Button  Search By
    Search Notice Using         Notice Number
    Input Search Using Number   ${num}   
    Sleep   .5
    Click Button On  Search

PS status is remove from Notice
    Search for Notice which just apply opeartion    ${NOPOPS}
    User Proceed to PS Selected Notice          ${NOPOPS}
    Confirm to PS Selected Notice

User Select Two notice with TS status to
    [Arguments]    ${operation}
    Verify Result Table is Display  
    Select Notice with Temporary Status     2
    Select Notice with Temporary Status     3
    Apply Operation to Selected Notice   ${operation}

Page displays all active TS and PS on the notice for user to revive
    Verify Page Title is       Revival Notice
    Scroll to Section  Revival Notice Record
    Suspension Summary section contain      Date Time of Suspension
    Suspension Summary section contain      Suspension
    Suspension Summary section contain      Code
    Suspension Summary section contain      Source
    Suspension Summary section contain      Name of OIC
    Suspension Summary section contain      Remarks

Page to provide revival details for revival officer or OIC to input revival details
    Verify Page Title is       Revival Notice
    Suspension Summary section allow input        Reason of Revival
    Suspension Summary section allow input        Remarks
    Suspension Summary section allow input        Created By
    Suspension Summary section allow input        Authorized By

User Already Select Notice to Revive
    [Arguments]   ${num}
    User Already Search Notice to Revive    ${num}
    User Select Notice to Revive            ${num}

User Proceed to Revival
    Scroll To Top Page
    Click Button on  Procced to Revival


Fill All Mandatory Revival Suspension Record 
    Verify Revival Page is Loaded
    Select Temporary Suspension to revive
    Input Revival Notice Record
    Click Button on  Next Page

Page provides proceed to revival to process revive notice
    Verify Pop up Alert Window      Confirmation    Revive   Ok

User Cancel the Revive Process
    Verify Revival Page is Loaded
    Select Temporary Suspension to revive
    Input Revival Notice Record
    Click Button on  Next Page
    User Proceed to Revival
    Click Button    Cancel

User go to Summary Section
    Verify Revival Page is Loaded
    Select Temporary Suspension to revive
    Input Revival Notice Record
    Click Button on  Next Page

Page provides summary section for user to review his revival notice before processing the revival
    Verify page is on Revival Summary
    Page Display First Section of Summary

Page Display First Section of Summary
    Suspension Summary section contain      Notice No.
    Suspension Summary section contain      Notice Type
    Suspension Summary section contain      Offence Date
    Suspension Summary section contain      and Time
    Suspension Summary section contain      Place of
    Suspension Summary section contain      Offence
    Suspension Summary section contain      Rule Code
    Suspension Summary section contain      Current
    Suspension Summary section contain      Processing Stage
    Suspension Summary section contain      Vehicle No.
    Suspension Summary section contain      Payment Status

Notice status will no longer under suspension status
    User able to revive selected notice from suspension
    Search for Notice which just apply opeartion    ${NOPOPS}
    Notice not under suspension status  TS
    Notice not under suspension status  PS
    Select Notice to View   1
    Apply Operation to Selected Notice   Apply PS
    Select Suspension Code 
    Click Button on  Next Page
    Scroll To Top Page
    Click Button on  Procced to PS
    Confirm to PS Selected Notice

re-Apply Permanen Suspend to Selected Notice
    Click Button On  Cancel
    Click on Button  Apply Revival
    Select Apply Operation Option        Apply PS
    Click Button on  Select
    Select Suspension Code 
    Click Button on  Next Page
    Scroll To Top Page
    Click Button on  Procced to PS
    Confirm to PS Selected Notice

Prompt message indicating no suspension notice is displayed
    User able to revive selected notice from suspension
    Search for Notice which just apply opeartion    ${NOPOPS}
    User Select Notice to Revive                ${NOPOPS}
    Modal Window Text is       The notice unable to retrieve SR No. This notice don't have suspension status before.
    re-Apply Permanen Suspend to Selected Notice



Notice remove from suspension selected
    Page Should not Contain Element   css=.fw-1
    Search Result Show no Records



