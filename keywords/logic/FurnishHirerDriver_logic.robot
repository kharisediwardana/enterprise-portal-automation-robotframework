***Keywords***
Verify Vehicle Owner Name
    [arguments]  ${name}
    Textfield Value Should Be   id=qName   ${name} 

Verify Vehicle Owner ID number
    [arguments]  ${num}
    Textfield Value Should Be   id=qIDNo     ${num}

Verify Pass Window Pop Up Display
    Wait Until Element is Visible   id=ocms-42-sing-corp-pass-modal  timeout=${MEDIUM_TIMEOUT}

Choose Login using Singpass
    Click Button   id=singpass-btn

Landing on Furnish Notice Step One
    Wait Until Element is Visible   id=ocms-42-step-1   timeout=${MEDIUM_TIMEOUT}

Verify Success Login using SingPass
    Wait Until Element is Visible   id=ocms-42-body    timeout=${SLEEP_TIMEOUT}

Verify Logged with Correct Singpass
    ${value}   Get Value   id=qIDNo
    Should be Equal   S6005048A   ${value}

Input Owner Name
    ${name}   Generate Random Name
    Input text    id=qName    TF ${name}
    Set Test Variable    \${OwnerName}   ${name}

Verify Step one Page is Loaded
    Wait Until Element is Visible   xpath=//div[@id="ocms-42-step-1"][@name="content"]    timeout=${MEDIUM_TIMEOUT}

Input Owner ID Number
    [Arguments]   ${num}
    Input Text   id=qIDNo   ${num}
    Sleep   .5

Verify Page Loaded Notice
    Wait until element is visible  xpath=//div[@id="furnish-notices" or "payable-notices" or "pending-notices"]  timeout=${MEDIUM_TIMEOUT}   #locator with or

Select Notice to Furnish
    [Arguments]     ${section}
    Wait Until Element is Visible   xpath=(//h5[text()="${section}"]/parent::div//input)[2]    timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=(//h5[text()="${section}"]/parent::div//input)[2]

Verify Furnish/Driver Notice Page Loaded
    Wait Until Element is Visible   xpath=//h1[text()="Furnish Hirer / Drivers Particulars"]

Verify The Step is on Step one
    Page Should Contain Element   xpath=//div[@id="ocms-42-step-1"][@class="sgds-step-item is-active"]   message=User are not at step one

Page not Contain Edit Button
    Page Should Not Contain Element  xpath=//span[text()="Edit"]//ancestor::button

User Cannot Edit The Record
    [Arguments]  ${section}
    ${text}   Get text    xpath=(//h5[text()="${section}"]/parent::div//tr)[2]
    Should be Equal     341000142M SMK4288Z 08/08/2023 10:00 ALLENBY ROAD 10300 $ 50.00 29 August 2023    ${text}

User See no Record Contain on Login ID
    Page Should Contain     No records are found under ID No. "**3456" 

User Click Notice tab on  
    [Arguments]   ${notices}
    Wait Until Element is Visible   xpath=//span[text()="${notices}"]//ancestor::li   timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=//span[text()="${notices}"]//ancestor::li


Verify Notices is Loaded
    [Arguments]  ${section}
    Wait Until Element is Visible    xpath=(//h5[text()="${section}"]/parent::div//tr)[2]   timeout=${LONG_TIMEOUT}

Verify Active tab is
    [Arguments]   ${section}
    Element Should be Visible    xpath=//span[text()="${section}"]//ancestor::li[@class="is-active"]
    
Table is Display Following Data
    [Arguments]   ${tab}
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Notice No."]
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Vehicle No."]
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Date & Time of Offence"]
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Car Park"]
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Offence Committed"]
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Payment Due Date"]
    Page Should Contain Element   xpath=//h5[text()="${tab}"]/parent::div//th[text()="Amount Payable"]

Corpass Header Display
    [Arguments]     ${tab}   ${num}
    Element Should be Visible    xpath=//h5[text()="${tab}"]/parent::div//p[text()="${num}"]

Notice display data
    [Arguments]   ${teb}        ${data}
    Wait Until Element is Visible   xpath=//h5[text()="${teb}"]/parent::div//td[contains(text(),"${data}")]  timeout=${MEDIUM_TIMEOUT}

Input Vehicle Owner Name
    [Arguments]   ${name}
    Input Text   id=qName   ${name}

Select UEN ID Type
    Press Keys   id=qIDType     ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ENTER

Select NRIC ID Type
    Press Keys   id=qIDType     ARROW_UP+ARROW_UP+ARROW_UP+ENTER

Click Get Data Button
    Sleep   .5
    Click Button  id=query-btn

User Cannot Click Pay Button
    Element Should Be Disabled     id=redirect-table-btn 

Input Owner Contact with
    [Arguments]   ${num}
    Scroll to Section  Hirer's / Driver Particulars
    Input text   id=oContactNo    ${num}
    Set Test Variable     \${Ownercontact}      ${num}

Input Owner Email with 
    [Arguments]   ${email}
    Input text   id=oEmail     ${email} 
    Set Test Variable     \${Owneremail}      ${email} 

ReInput Owner Email with 
    [Arguments]   ${email}
    Input text   id=oComEmail    ${email} 
    Set Test Variable     \${Owneremail}      ${email} 

Verify on Furnish Step Two
    Wait Until Element is Visible  xpath=//div[@id="ocms-42-step-2"][@class="sgds-step-item is-active"]    timeout=${SHORT_TIMEOUT} 

Let Owner Contact Number Empty
    Press Keys    id=oContactNo     CTRL+A+DELETE
Let Owner Email Empty
    Press Keys    id=oEmail    CTRL+A+DELETE
    Press Keys    id=oComEmail  CTRL+A+DELETE

Input Driver Address with 
    [Arguments]   ${num}
    ${country}      Get Value   id=hdCountry
    Should be Equal   "SG"     ${country}   
    Input text   id=hdPostal   ${num}

Get Driver Address
    Wait Until Element is Enabled    id=postal-btn   timeout=${SHORT_TIMEOUT}
    Click Button   id=postal-btn

Verify Floor Unit Reminder Display
    Verify Pop up Alert Window on e-Service  Reminder  floor  Ok
    Wait Until Element is visible   id=floor-unit-modal-ok-btn   timeout=${MEDIUM_TIMEOUT}
    Close Floor Unit Modal

Close Floor Unit Modal
    Click Button    id=floor-unit-modal-ok-btn

Verify Address is Auto Populated
    Textfield Value Should be   id=hdStreet    ANG MO KIO AVENUE 6

All Form can be Filled
    Textfield Value Should be    id=hdID           ${NRIC}
    Textfield Should Contain     id=hdName         ${DriverName}
    Textfield Value Should be    id=hdPostal       ${PostalCode}
    Textfield Value Should be    id=hdStreet       ANG MO KIO AVENUE 6

Input Driver Name
    [Arguments]   ${name}
    Input text   id=hdName   ${name}
    Set Test Variable  \${DriverName}   ${name}

Input Driver ID Number with
    [Arguments]  ${num}
    Input Text    id=hdID   ${num}

User Double Click to See Suggestion
    Double Click Element   id=hdID

User See Any No Suggestion
    Element Should not Be Visible   xpath=//input[@id="hdID"]//div

Select Document Type
    Press Keys   id=docType    ARROW_DOWN+ENTER
    #Click element   xpath=//select[@id="docType"]/option[text()="Driver's Licence"]

Select Second Document Type
    Press Keys   id=docType    ARROW_DOWN+ARROW_DOWN+ENTER

Upload Supporting Document
    [Arguments]   ${doc}
    Choose File    id=doc    ${doc}

Verify File is Uploaded
    Wait Until Element is visible   css=.file-content  timeout=${LONG_TIMEOUT}

Verify Document Type Is
    [arguments]  ${type}
    Page Should Contain Element   xpath=//label[@class="label"][text()="${type}"]

Verify Name and Size Document is 
    [Arguments]  ${name}  ${size}
    Page Should Contain Element   xpath=//div[@class="file-content"]/p[contains(text(),"${name} ")]
    Page Should Contain Element   xpath=//div[@class="file-content"]/p[text()="${size}"]

Select NIRC ID Type 
    Press Keys   id=hdIDType  ARROW_DOWN+ENTER

Select FIN ID Type 
    Press Keys   id=hdIDType  ARROW_DOWN+ARROW_DOWN+ENTER

Select UEN Type ID 
    Press Keys   id=hdIDType  ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ENTER

Select Passport Type ID 
    Press Keys   id=hdIDType  ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ENTER

Able to Edit non-Grey User Information
    Textfield Value Should Be   id=oContactNo   ${Ownercontact} 
    Textfield Value Should Be   id=oEmail       ${Owneremail}  
    Textfield Value Should Be   id=oComEmail      ${Owneremail}  

Input Driver Contact with
    [Arguments]  ${contact}
    Input Text    id=hdContactNo     ${contact}
    Set Test Variable   \${DriverContact}   ${contact}

Input Driver Email with
    [Arguments]  ${email}
    Input Text      id=hdEmail   ${email}
    Set Test Variable   \${DriverEmail}   ${email}

Landing on Step 3 Confirmation
    Wait Until Element is Visible   xpath=(//div[@id="furnish-step"]//div[@class="sgds-step-item is-active"])[3]   timeout=${MEDIUM_TIMEOUT}

Verify Upload File Work Permit
    Page Should Contain Element   xpath=//div[@id="doc-control"]//label[text()="Employment Pass / Work Permit"]

Failed to Upload File
    Page Should not Contain Element  css=.file-content

User See Error on Driver ID Section
    Proceed to Next Page
    Verify Error Message Display                Please enter ID number.

Verify Landing on Step Three
    Page Should Contain Element   xpath=//div[@id="ocms-42-step-3"][@class="sgds-step-item is-active"]

Want Back to Furnish Notice Particular Page
    Click Button   id=step-3-back-btn

User Able to Select Acknowledgement Checkbox Menu
    Click Element  id=declaration
    Checkbox Should be Selected    xpath=//div[@id="declaration"]//input

Confirmation Owner Name
    Element Text Should Be   xpath=(//p[text()="Name"]/following-sibling::p)[1]     ANDY LAU
Confirmation Owner ID
    Element Text Should Be   xpath=(//p[text()="ID"]/following-sibling::p)[1]       (NRIC) *****256D
Confirmation Owner Contact    
    Element Text Should Be   xpath=(//p[text()="Contact No."]/following-sibling::p)[1]   (Mobile No.) (+65) ${validContact}
Confirmation Owner Email    
    Element Text Should Be   xpath=(//p[text()="Email"]/following-sibling::p)[1]    ${OwnerEmail}
Confirmation Hirer/Driver ID    
    Element Text Should Be   xpath=(//p[text()="ID"]/following-sibling::p)[2]   (NRIC) *****256D
Confirmation Hirer/Driver Name    
    Element Text Should Be   xpath=(//p[text()="Name"]/following-sibling::p)[2]     ${DriverName} 
Confirmation Hirer/Driver Postal Code    
    Element Text Should Be   xpath=(//p[text()="Postal Code"]/following-sibling::p)[1]    (Singapore) ${PostalCode}
Confirmation Hirer/Driver Contact    
    Element Text Should Be   xpath=(//p[text()="Contact No."]/following-sibling::p)[2]    (Mobile No.) (+65) ${validContact}
Confirmation Hirer/Driver Email    
    Element Text Should Be   xpath=(//p[text()="Email"]/following-sibling::p)[2]   ${validemail}
Confirmation File Uploaded Type
    Element Text Should Be    xpath=(//div[@id="uploaded-doc-table-box"])[1]//td[2]  1.jpg
    
Verify Owner Name
    Element Text Should Be   xpath=(//p[text()="Name"]/following-sibling::p)[3]     ANDY LAU
Verify Owner ID
    Element Text Should Be   xpath=(//p[text()="ID"]/following-sibling::p)[3]       (NRIC) *****256D
Verify Owner Contact    
    Element Text Should Be   xpath=(//p[text()="Contact No."]/following-sibling::p)[3]   (Mobile No.) (+65) ${validContact}
Verify Owner Email    
    Element Text Should Be   xpath=(//p[text()="Email"]/following-sibling::p)[3]    ${OwnerEmail}
Verify Hirer/Driver ID    
    Element Text Should Be   xpath=(//p[text()="ID"]/following-sibling::p)[4]   (NRIC) *****256D
Verify Hirer/Driver Name    
    Element Text Should Be   xpath=(//p[text()="Name"]/following-sibling::p)[4]     ${DriverName} 
Verify Hirer/Driver Postal Code    
    Element Text Should Be   xpath=(//p[text()="Postal Code"]/following-sibling::p)[2]    (Singapore) ${PostalCode}
Verify Hirer/Driver Contact    
    Element Text Should Be   xpath=(//p[text()="Contact No."]/following-sibling::p)[4]    (Mobile No.) (+65) ${validContact}
Verify Hirer/Driver Email    
    Element Text Should Be   xpath=(//p[text()="Email"]/following-sibling::p)[4]   ${validemail}
Verify File Uploaded Type
    Element Text Should Be    xpath=(//div[@id="uploaded-doc-table-box"])[2]//td[2]  1.jpg
Submission Status Displayed
    Page Should Contain Element   xpath=//div[@id="ocms-42-step-4"][@class="sgds-step-item is-active"]
    Page Should Contain    Your Submission has been received.

User Input Confirmation Details Valid Captcha
    Scroll to Bottom Page
    ${Captcha}=   Get Text   id=captcha-image
    Input Captcha Furnish Hirer Driver      ${Captcha}
    Proceed to Submit Furnish

Proceed to Submit Furnish
    Wait Until Element is Enabled   id=step-3-next-btn  timeout=${MEDIUM_TIMEOUT}
    Click Submit Furnish

Click Submit Furnish
    Click Button   id=step-3-next-btn

Verify Landing on Step Four
    Wait Until Element is Visible   xpath=//div[@id="ocms-42-step-4"][@class="sgds-step-item is-active"]     timeout=${MEDIUM_TIMEOUT}

Input Captcha Furnish Hirer Driver
    [Arguments]   ${captcha}
    Input Text    id=OCMS42CaptchaCaptchaInput  ${Captcha}

User Can Print Furnish Data
    Element Should be Visible   id:viewer  message=Feature not Exist Yet

Driver Street Name Inputted
    Text Field Value Should Be  id=hdStreet  ANG MO KIO AVENUE 6
Driver Building Name Inputted
    Text Field Value Should Be  id=hdBuild  ANG MO KIO 61
Driver House Number Inputted
    Text Field Value Should Be  id=hdBlock  645

Click Print Button
    #Press Keys   none   ARROW_DOWN+ARROW_DOWN
    Click Button   id=step-4-print-btn

User Cannot Submit Furnish Notice
    Element Should be Disabled    id=step-3-next-btn

Choose Driver Relationship with
    [Arguments]   ${relation}
    Scroll to Section  Type of Document
    Click Element   xpath=//div[@id="hdRelation"]//input[@value='"${relation}"']

User Able to Choose Answer on Option
    Click on Button    Next
    Verify Pop up Alert Window on e-Service   No Documentary  proceed?  Confirm
    Click on Button  Confirm
    Scroll to Section  1.docx
    Element Should be Visible  xpath=//p[text()="Relationship with Owner"]/following::p[text()="Family"]

User Cannot Continue step without fill relationship
    [Arguments]  ${error}
    Click on Button  Next
    Element Should not Be Visible   xpath=//div[@id="ocms-42-step-3"][@class="sgds-step-item is-active"]
    Verify Error Message Display     ${error}

Text box other relation Displayed
    Element Should be Visible    id=hdOtherRelation

User input long description of other relation
    Choose Driver Relationship with     other
    Input text   id=hdOtherRelation     AUTOMATION OTHER RELATION WITH A LONG TEXT OF RELATION

Able to input other description with long word
    textfield value should be   id=hdOtherRelation     AUTOMATION OTHER RELATION WITH A LONG TEXT OF RELATION

Notice selected is Multiple
    ${count}   Get Element Count    xpath=//th[text()="Notice No."]/parent::tr
    Should Not be Equal    2     ${count}