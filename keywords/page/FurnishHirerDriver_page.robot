*** Keywords ***
Able to Login Using Singpass
    Verify Success Login using SingPass
    Landing on Furnish Notice Step One
    Verify Logged with Correct Singpass

Get Data Notice Number
    [Arguments]   ${number}
    Scroll to Section   Parking Offence Details
    Verify Step one Page is Loaded
    Input Owner ID Number   ${number}
    Click on Button  Get Data
    Verify Page Loaded Notice

Verify Notice Data is Loaded
    Landing on Furnish Notice Step One
    Scroll To Bottom Page
    Verify Page Loaded Notice

Already Have notice on Sing Pass Account
    [Arguments]   ${num}
    User Landing on Furnish/Driver Notice Page with Login Status
    Get Data Notice Number          ${num}
    Verify Notice Data is Loaded

Already Have notice on Sing Pass Account without Notice
    User Landing on Furnish/Driver Notice Page with Login Status
    Get Data Notice Number          123456

User Landing on Furnish/Driver Notice Page with Login Status
    Verify Furnish/Driver Notice Page Loaded
    Verify The Step is on Step one

Select Furnishable Notice
    User Click Notice tab on    Furnishable Notices
    Scroll to Bottom Page
    Select Notice to Furnish    Furnishable Notices    

User See Parking Offence Details Data
    [Arguments]    ${tab}
    Verify Notices Is Loaded    ${tab}
    Scroll To Bottom Page
    Verify Active tab is   ${tab}
    Table is Display Following Data     ${tab}

User Edit the Record
    [Arguments]  ${section}
    User Click Notice tab on    ${section}   
    Select Notice to Furnish    ${section}
    Page not Contain Edit Button

Parking Offence Details Display 
    [Arguments]   ${tab}
    Corpass Header Display       ${tab}        SMK4288Z
    Notice display data          ${tab}        341000170T 
    Notice display data          ${tab}        2023 12:00
    Notice display data          ${tab}        ANTHONY/CAIRNHILL
    Notice display data          ${tab}        10300
    Notice display data          ${tab}        $ 50.00
    Notice display data          ${tab}        2023

Notice display following data on
    [Arguments]   ${tab}
    User Click Notice tab on            ${tab}
    Parking Offence Details Display     ${tab}

User see all notice under Corp Pass ID
    Scroll To Bottom Page
    Parking Offence Details Display   Furnishable Notices 
    Notice display following data on   Payable Notices

#! Check
User Click Pay Button After Select Notice
    Select Furnishable Notice
    Click on Button   Pay 

Already Landing on Step Two Furnish Notice
    Already Have notice on Sing Pass Account        ${NRIC}
    Select Furnishable Notice
    Proceed to Furnish Selected Notice
    
Proceed to Furnish Selected Notice
    Click on Button    Proceed to Furnish
    Verify Pop up Alert Window on e-Service  Furnish   particular   Ok
    Click on Button   Ok
    Verify on Furnish Step Two

User Input Owner Data with
    [Arguments]   ${Contact}  ${Email}
    Input Owner Contact with    ${Contact} 
    Input Owner Email with  ${Email}
    ReInput Owner Email with  ${Email}

User update editable info manually
    Scroll to Section  Email Address
    textfield value should be   id=oName   ANDY LAU
    textfield value should be   id=oID     *****048A
    User Input Owner Data with  ${validContact}  ${validemail}

User able to update editable info manually
    textfield value should be   id=oContactNo   ${validContact}
    textfield value should be   id=oEmail       ${validemail}
    textfield value should be   id=oComEmail       ${validemail}

User See Address is Auto-Populated
    Driver Street Name Inputted
    Driver Building Name Inputted
    Driver House Number Inputted
    
User Already on Confirmation Page
    User already finished input all the data
    Proceed to Next Page
    User Will Direct to Confirmation Page

User Success Proceed data
    Confirmation Owner Name
    Confirmation Owner ID
    Confirmation Owner Contact    
    Confirmation Owner Email  
    Scroll to Section  My Declaration of Accurate and Truthful Submission
    Confirmation Hirer/Driver ID    
    Confirmation Hirer/Driver Name    
    Confirmation Hirer/Driver Postal Code    
    Confirmation Hirer/Driver Contact    
    Confirmation Hirer/Driver Email    
    Confirmation File Uploaded Type 

User Proceed Without Select Acknowledgement Checkbox
    User Input Confirmation Details Valid Captcha
    Proceed to Submit Furnish

User Already Finish Input All Data on Confirmation Page
    User Already on Confirmation Page
    User Input Confirmation Details Valid Captcha
    User Able to Select Acknowledgement Checkbox Menu

User Already on Acknowledgement Page
    Already input Captcha on Confirmation Page
    Proceed to Submit Furnish
    User See Sumbit Data Status

User Click Print Button
    Scroll To Bottom Page
    Click Print Button

User Reach Section
    [Arguments]  ${section}
    Scroll To Bottom Page
    User Click Notice tab on    ${section}
    Verify Active tab is    ${section}

User Want to Pay without Select Notice
    Scroll to Bottom Page 
    User See Parking Offence Details Data       Furnishable Notices

User Let The Owner Field Empty
    Let Owner Contact Number Empty
    Let Owner Email Empty

Error Message Empty Data Input Display
    Verify Error Message Display     Please enter contact no.
    Verify Error Message Display     Please enter email address.

Error message incorrect data input display
    Verify Error Message Display     Invalid contact no.
    Verify Error Message Display     Invalid email address. Please enter again.

Get Adress Driver with 
    [Arguments]   ${num}
    Input Driver Address with   ${num}
    Get Driver Address
    Verify Floor Unit Reminder Display
    Verify Address is Auto Populated

User Input Driver Data with  
    [Arguments]   ${num}  ${code}  
    Scroll to Section   Street Name    
    Select NIRC ID Type 
    Input Driver ID Number with      ${num} 
    Input Driver Name   ALBERT ANG
    Get Adress Driver with  ${code}
    Input Driver Contact with  ${validContact}
    Input Driver Email with  ${validemail}

Input Driver Data with FIN Type
    [Arguments]  ${type}
    Scroll to Section   Street Name    
    Select FIN ID Type 
    Input Driver ID Number with      ${type}

Attach File with ID Type FIN
    Input Driver Data with FIN Type     ${FIN} 
    Scroll To Bottom Page
    Select Document Type
    Upload Supporting Document      ${supportFile2}
    Select Second Document Type
    Upload Supporting Document      ${supportFile1}

User Input Particular Data with Valid Data
    User Input Owner Data with     ${validContact}          ${validemail}
    User Input Driver Data with    ${NRIC}          ${PostalCode}

User No See Any Error Message on Particular Details
    Verify Error Message Not Display     Please enter contact no.
    Verify Error Message Not Display     Please enter email address.
    Verify Error Message Not Display     Invalid contact no.
    Verify Error Message Not Display     Invalid email address. Please enter again.

Upload Supporting Document with
    [Arguments]   ${doc}
    User Input Particular Data with Valid Data
    Scroll To Bottom Page
    Select Document Type
    Upload Supporting Document      ${doc}

User not Attach Supporting Document
    User Input Particular Data with Valid Data
    Scroll To Bottom Page
    Select Document Type

User Able to Upload Supporting Document
    Verify File is Uploaded
    Verify Document Type is   Driver's Licence
    Verify Name and Size Document is    1.jpg   0.14MB

User Edit non-Grey User information
    ${num}    Generate Random Contact
    Input Owner Contact with    ${num} 
    ${email}  Generate Random Email
    Input Owner Email with  ${email}
    ReInput Owner Email with  ${email}

User Input All Mandatory Field
    User Input Particular Data with Valid Data
    Scroll To Bottom Page
    Select Document Type
    Upload Supporting Document      ${supportFile1}

Able to Complete HirerDriver Particular Step
    All Form can be Filled
    User Able to Upload Supporting Document
    Click on Button   Next
    Landing on Step 3 Confirmation

User Able to Upload with Spesific Document
    Verify Upload File Work Permit
    User Able to Upload Supporting Document

Pop Up Window No Document Attach Display
    Proceed to Next Page
    Verify Pop up Alert Window  No Documentary  proceed?  Confirm

Failed to Get Address
    Get Driver Address
    Verify Error Message Display      Postal code does not existing.
    Textfield value should be  id=hdStreet   ${EMPTY}

User Let ID Number Field Empty
    User Input Owner Data with     ${validContact}          ${validemail}
    Input Driver Data with FIN Type  ${EMPTY}

Proceed to Next Page
    Scroll To Bottom Page
    Click on Button  Next

User Let One Mandatory Field Empty
    User Input Owner Data with     ${validContact}          ${validemail}
    Scroll to Section   Street Name    
    Select NIRC ID Type 
    Input Driver ID Number with      ${NRIC}
    Input Driver Name               ANDY LAU
    Get Adress Driver with  ${PostalCode}
    Input Driver Contact with  ${EMPTY}
    Input Driver Email with  ${validemail}

User See Error Message on Owner Contact
    Proceed to Next Page
    Verify Error Message Display    Please fill in postal code.  

User See Error Message on Empty Mandatory Field
    Proceed to Next Page
    Verify Error Message Display    Please enter contact no.

Already Fill All Mandatories Field on Step Two
    Already Landing on Step Two Furnish Notice
    Upload Supporting Document with    ${supportFile1}

Landing on Confirmation Step
    Already Fill All Mandatories Field on Step Two
    Proceed to Next Page

Able to Edit Furnish Notice Particular Page
    Verify on Furnish Step Two
    User Input Driver Data with    ${NRIC2}          ${PostalCode}

Already Select Checkbox on Confirmation Page
    Landing on Confirmation Step
    User Able to Select Acknowledgement Checkbox Menu

Summary Details of Furnished Notice is Display
    Verify Landing on Step Four
    Verify Owner Name
    Verify Owner ID
    Verify Owner Contact       
    Verify Owner Email
    Verify Hirer/Driver ID
    Verify Hirer/Driver Name    
    Verify Hirer/Driver Postal Code    
    Verify Hirer/Driver Contact    
    Verify Hirer/Driver Email    
    Verify File Uploaded Type

User See Sumbit Data Status
    Submission Status Displayed
    Summary Details of Furnished Notice is Display

Already input Captcha on Confirmation Page
    Already Select Checkbox on Confirmation Page
    User Input Confirmation Details Valid Captcha

User Already Submit Notice to Furnish
    Landing on Acknoledgement Page
    Click on Button  Submit

User Login Corpass with Notice
    [Arguments]   ${num}
    Scroll to Section   Parking Offence Details
    Verify Step one Page is Loaded
    Select UEN ID Type
    Input Owner ID Number   ${num}
    Click on Button  Get Data
    Verify Page Loaded Notice

User Select Multiple Notice
    Scroll To Bottom Page
    Click Element   css=.checkbox-big
    
Selected Notice will Furnish as 1 set Driver Particular
    Proceed to Furnish Selected Notice
    Scroll to Section  Name
    Notice selected is Multiple