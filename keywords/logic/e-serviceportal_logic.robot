***Keywords***
Scroll to Upload Section
    Run Keyword and ignore error  Scroll Element into View   id=doc-choose

Verify Logo is Loaded
    Wait Until Element is Visible  xpath=//div[@class="sgds-navbar-brand"]//child::img  timeout=${SHORT_TIMEOUT}

User Can See Information Section
    Element Should Be Visible  xpath=//div[@id="landing-box"]//ol    
    Element Should Be Visible  xpath=//div[@id="landing-box"]//ul

Click Pay Parking Fine Button
    Click Button   id=landing-pay-btn

User Direct to Payment Page
    Switch Window    New
    Wait Until Element is Visible     id=payable-fines-box              timeout=${MEDIUM_TIMEOUT}

Check Mark on Appeal Information Check Box
    Click Element  id=landing-checkox

Verify Create Appeal Button is Enabled
    Wait Until Element is Enabled  id=landing-next-btn  timeout=${SHORT_TIMEOUT}

Click Create Appeal Button 
    Click Element  id=landing-next-btn

Verify Pop up Alert Window
    [Arguments]   ${title}  ${body}   ${button}
    Verify Modal Window Visible
    Page Should Contain Element   xpath=//*[contains(text(),"${title}")]
    Page Should Contain Element   xpath=//*[contains(text(),"${body}")]
    Page Should Contain Element   xpath=//*[text()="${button}"]
    
Verify Pop up Alert Window on e-Service
    [Arguments]   ${title}  ${body}   ${button}
    Page Should Contain Element   xpath=//*[contains(text(),"${title}")]
    Page Should Contain Element   xpath=//*[contains(text(),"${body}")]
    Page Should Contain Element   xpath=//*[text()="${button}"]

Verify Checkbox is Display
    Wait Until Element is Visible  id=declaration-modal  timeout=${SHORT_TIMEOUT}
    Page Should Contain Element   css=.checkbox

Check Mark on Declaration Window
    Click Element  id=declaration-modal-checkox
    Wait Until Element is Enabled   id=declaration-modal-confirm-btn    timeout=${SHORT_TIMEOUT}

Click Appeal Confirm Button
    Click Button    id=declaration-modal-confirm-btn 

Verify Field Title is
    [Arguments]   ${title}
    Wait Until Element is Visible  xpath=//p[@class="field-title"][text()="${title}"]   timeout=${SHORT_TIMEOUT}

Verify Error Message Display
    [Arguments]   ${msg}
    Wait Until Element is Visible  xpath=//span[@id="msg"][contains(text(),'${msg}')]    timeout=${MEDIUM_TIMEOUT}  error=There is no error message display

Verify Error Message Not Display
    [Arguments]   ${msg}
    Element Should Not Be Visible  xpath=//span[@id="msg"][text()='${msg}'] 

Verify Scrolled to Error Section
    Element Should be Visible   id=isPaidParkApp-control

User are Currently on Appeal Step One
    Page Should Contain Element    xpath=//div[@id="appeal-step-1"][@class="sgds-step-item is-active"]

Click Create Appeal Tab
    Click Element  xpath=(//a[text()="Appeal for Parking Fines"]//parent::div)[2]
    Scroll to Bottom Page
    
Choose Parking Apps Usage
    Click Element   xpath=(//div[@id="isPaidParkApp"]//label)[2]

Choose Yes Parking Apps Usage
    Click Element   xpath=(//div[@id="isPaidParkApp"]//label)[1]
    Verify Parkir Session Apps Window Pop up

Verify Parkir Session Apps Window Pop up
    Verify Pop up Alert Window on e-Service       Retrieve    Parking Session  Ok
    Click Button   id=parking-modal-cancel-btn

Input Number on Offences Details
    [arguments]  ${Number}
    Scroll to Upload Section
    Input text    id=nopoNo   ${Number}

Verify Court Notice Pop Up Window
    Wait Until Element is visible    id=court-summon-modal-modal-close-btn    timeout=${MEDIUM_TIMEOUT}
    Verify Pop up Alert Window on e-Service      Court Notice  court action    Ok
    Click Button   id=court-summon-modal-modal-close-btn    

Verify Advisory Notice Pop Up Window
    Wait Until Element is visible    id=advisory-notice-modal-modal-close-btn  timeout=${MEDIUM_TIMEOUT}
    Verify Pop up Alert Window on e-Service       Advisory  No payment    Ok
    Click Button   id=advisory-notice-modal-modal-close-btn

Verify Notice Windows Pop Up   
    [Arguments]    ${window}
    Element Should be Visible   xpath=//div[@class="sgds-modal-card"]//p[text()="${window}"]

#changed la
Pop Up Window Base on Notice Type Display
    ${Court}    Run Keyword and Return Status      Verify Notice Windows Pop Up   Court Notice
    ${Advisory}    Run Keyword and Return Status      Verify Notice Windows Pop Up   Advisory Notice
    Run Keyword if  "${Court}" == "True"      Verify Court Notice Pop Up Window
    ...       ELSE IF  "${Advisory}" == "True"   Verify Advisory Notice Pop Up Window

Input Session ID Number
    [arguments]  ${Aplhabet}  ${Number1}   ${Number2}
    Input text  id=sessionPrefix  ${Aplhabet}
    Input text  id=sessionNum1  ${Number1}
    Input text  id=sessionNum2  ${Number2}

Click Number Add Button
    [Arguments]   ${num}
    Wait Until Keyword Succeeds  10 sec   1 sec     Text Field Value Should Be   id=vehicleNo   ${num}
    Click Button  id=addNopoBtn

Add Offence Notice
    [Arguments]   ${num}
    Click Number Add Button     ${num}
    Verify Offence has Added

Verify Offence has Added
    Wait Until Element is Visible  id=offence-box    timeout=${MEDIUM_TIMEOUT}

Add Offence Notice by Parking Apps User
    ${Status}  Run Keyword and Return Status  Element Should be Visible   id=parkingSessionID-control
    Run Keyword if   "${Status}" == "True"  Input Session ID Number     U   1234   5678
    Click Number Add Button     ${VehicleNum3}

User Not Able to Input Duplicate Nopo and See Error Message
    Page Should Not Contain Element   xpath=(//div[@id="offence-box"]//tr)[3]         message=Still Able to Input Duplicate Number
    Element Should be Visible      css=.alert-custom.alert-error   message=There is No Error Message Duplicate Number 

Click on Button
    [Arguments]     ${button}
    Wait Until Element is Visible   xpath=//Button[text()="${button}"]   timeout=${SHORT_TIMEOUT}
    Click Button  xpath=//Button[text()="${button}"]

User See Vehicle Number Auto-Populated
    Verify Court Notice Pop Up Window
    Textfield Value Should be    id=vehicleNo   ${VehicleNum3}

User See no Error Message on Nopo Input Section
    Element Should Not Be Visible  css=.alert-custom.alert-error 

User Able to Enter NOPO
    #Verify Court Notice Pop Up Window
    Click Number Add Button     ${VehicleNum3}
    Page Should Contain Element    id=offence-box
    User See no Error Message on Nopo Input Section

Able to Add Multiple NOPO
    Page Should Contain Element   xpath=(//div[@id="offence-box"]//td)[2]
    User See no Error Message on Nopo Input Section

Input Name
    ${name}   Generate Random Name
    Input Text    id=name    ${name}

Select Personal ID type with NIRC
    Press Keys  id=IDType   ARROW_DOWN+ENTER

Input ID Number with
    [Arguments]   ${num}
    Input Text   id=ID     ${num}
    
User Click Clear Button on Particular Data
    Scroll to Section   Postal Code
    Click Button    id=clear-btn

User Can See Personal Data is Empty
    TextField Value Should Be  id=name  ${EMPTY}
    TextField Value Should Be  id=ID  ${EMPTY}

User Get Address with Input Postal Code
    [arguments]  ${postalCode}
    Input Postal Code       ${postalCode}
    Get Address

Get Address
    Wait Until Element is Enabled   id=postal-btn   timeout=${MEDIUM_TIMEOUT}
    Click Button      id=postal-btn
    Sleep   3    #Changed later

User Click Cancel on Pop Up no Document Alert
    Verify Pop up Alert Window on e-Service       No Documentary    not attached  Confirm
    Click on Button   Cancel

Input Street Name
    ${Street}    Generate Random Street Address
    Input Text   id=street    ${Street}
Input Building Name
    ${building}    Generate Random Street Address
    Input Text   id=build    ${building}
Input Block Number
    ${no}  Generate Random Building Number
    Input Text   id=block    ${no}
Input Email Address with
    [Arguments]   ${email}
    Input Text  id=email  ${email}
    Set Test Variable   \${DriverEmail}  ${email}

Confirmation Email Address
    [Arguments]   ${email}
    Input Text  id=comEmail  ${email}

User See No Error Message on Address Section
    Element Should not Be Visible   css=.alert-box

Paste Email 
    Click Element   id=email
    Press Keys  none  CTRL+A
    Press Keys  none  CTRL+C
    Click Element    id=comEmail   
    Press Keys  none    CTRL+V

User Unable tp Paste Email Address
    Verify Error Message Display   Cannot Paste Email
    Textfield value Should be    id=comEmail    ${EMPTY}
    
User See Document Uploaded on List
    Wait Until Element is Visible  xpath=//span[text()="Delete"]/ancestor::div//div[@class="file-content"]    timeout=${LONG_TIMEOUT}

Choose and Upload File
    [arguments]  ${file1}
    Scroll to Bottom Page
    Choose File     id=doc   ${file1}

Upload File
    [Arguments]   ${file}
    Choose and Upload File      ${file}
    User See Document Uploaded on List

Error Message e-Service Portal Display
    [arguments]  ${errorMessage}
    Page Should Contain Element     css=.alert-msg      timeout=${SHORT_TIMEOUT}
    Page Should Contain   ${errorMessage}

User Input Text on Appeal Reason
    ${text}=    Generate Random Text
    Input text  id=reason  ${text}
    Set Test Variable    \${text}  ${text}

User Can See Appeal Reason Text Area Inputted
    Textarea Value Should Be   id=reason   ${text}

User See Hint Text Displayed with 0 Characters Left
    ${text_left}=  Get Text    xpath=//div[@id="reason-control"]//span[contains(text(), "characters left")]
    Should be Equal    0 characters left   ${text_left}

User Can See Hint Text Displayed
    Element should be Visible   xpath=//div[@id="reason-control"]//span[contains(text(), "characters left")]

User Direct to Appeal Reason Page
    Wait Until Element is Visible  xpath=//div[@id="appeal-step-3"][@class="sgds-step-item is-active"]   timeout=${SHORT_TIMEOUT}
    Verify Field Title is   Appeal Reason

Input Text With Maximum Data Length
    ${text}=    Generate Random Text Maximum Characters
    Input text  id=reason  ${text}

User Is The Driver
    Scroll To Bottom Page
    Click Element  xpath=(//div[@id="isDriver"]//label)[1]

User Is not The Driver
    Scroll To Bottom Page
    Click Element  xpath=(//div[@id="isDriver"]//label)[2]
    
User See Review Data Same as Inputted Data
    Element Text Should Be  xpath=(//div[@id="preview-offence-table-box"]//td)[2]  ${NOPO}  
    Element Text Should Be  xpath=(//div[@id="preview-offence-table-box"]//td)[3]  ${VehicleNum3} 
    Element Text Should Be  xpath=(//p[text()="Full Name"]/parent::div/p)[2]       ${DriverName}
    Element Text Should Be  xpath=(//p[text()="ID"]/parent::div/p)[2]        (NRIC) *****256D
    Element Text Should Be  xpath=(//p[text()="Postal Code"]/parent::div/p)[2]   (Singapore) ${PostalCode}
    Element Text Should Be  xpath=(//p[text()="Contact No."]/parent::div/p)[2]    (Mobile No.) (+65) ${validContact}
    Element Text Should Be  xpath=(//p[text()="Email Address"]/parent::div/p)[2]    ${DriverEmail}

User Landing to Appeal Reason Step
    Page Should Contain Element   xpath=//div[@id="appeal-step-2"][@class="sgds-step-item is-active"]
    Page Should Not Contain Element   xpath=//div[@id="appeal-step-3"][@class="sgds-step-item is-active"]

Verify on Step Five
    Wait Until Element is Visible  xpath=//div[@id="appeal-step-5"][@class="sgds-step-item is-active"]    timeout=${SHORT_TIMEOUT}
    Element Should be Visible  xpath=//div[@id="appeal-step-4"][@class="sgds-step-item is-active"]
    Element Should be Visible  xpath=//div[@id="appeal-step-3"][@class="sgds-step-item is-active"]
    Element Should be Visible    xpath=//div[@id="appeal-step-1"][@class="sgds-step-item is-active"]
    Element Should be Visible    xpath=//div[@id="appeal-step-2"][@class="sgds-step-item is-active"]
    Get Transaction Number

Get Transaction Number
    ${num}   Get Text   xpath=//p[contains(text(), "Transaction")]/span
    Set Test Variable   \${Trans_Number}     ${num}

Then User Still Allow to Upload
    Upload File   ${supportFile1}
    User See Document Uploaded on List

Input Postal Code
    [arguments]  ${postalCode}
    Scroll to Section  Contact No.
    Element Should be Visible   xpath=//select[@id="country"]//option[text()="Singapore"]
    Input Text  id=postal  ${postalCode}

Get Street Name
    ${name}=   Get Value    id=street  
    Set Test Variable   \${StreetName}    ${name}
    Should not be Equal    ${name}   ${EMPTY}

Get Building Name 
    ${name}=   Get Value   id=build
    Set Test Variable   \${BuildingName}    ${name}
    Should not be Equal    ${name}   ${EMPTY}

Get House Number
    ${number}=  Get Value  id=block
    Set Test Variable   \${BuildingNumber}  ${number}
    Should not be Equal    ${number}   ${EMPTY}

User See Floor Unit Pop Up Window
    Verify Pop up Alert Window on e-Service     Floor Unit No Reminder   remember to fill  Ok
    Click Button  xpath=(//Button[text()="Ok"])[4]
    Get Building Name
    Get House Number

Input Invalid Captcha
    Input text  id=PLUS26CaptchaCaptchaInput   WRONG

Input Valid Captcha
    ${captcha}    Get text    id=captcha-image
    Input text   id=PLUS26CaptchaCaptchaInput    ${captcha}
    Wait Until Element is Enabled    xpath=//Button[text()="Submit"]     timeout=${SHORT_TIMEOUT}


User Direct to Confirmation Page
    Wait Until Element is Visible    xpath=//div[@id="appeal-step-4"][@class="sgds-step-item is-active"]   timeout=${LONG_TIMEOUT}
User Direct to Acknowledgement Page
    Wait Until Element is Visible    xpath=//div[@id="appeal-step-5"][@class="sgds-step-item is-active"]   timeout=${LONG_TIMEOUT}

User can not Submit Appeal
    Element Should be Disabled  id=step-4-next-btn
    Element Should not be Visible   xpath=//div[@id="appeal-step-5"][@class="sgds-step-item is-active"]    message=Still Able to Submit Appeal

Proceed to Personal Particular
    Click Button    id=step-2-next-btn

Input Personal Particulars Name
    Input Text   id=name       ${name}
    ${Uppercase}   Convert To Upper Case   ${name}
    Set Test Variable   \${DriverName}   ${Uppercase}

Select Personal Particular ID Type
    Click Element    id=IDType
    Press Keys     none    ARROW_DOWN+ENTER

Input Personal Particular ID Number
    Input text   id=ID    ${NRIC}

Input Personal Particular Contact Number
    Input Text    id=contactNo    ${validContact}
    Element Should be Visible    xpath=//select[@id="contactType"]/option[text()="Mobile No."]
    Element Should be Visible    xpath=//select[@id="contactCode"]/option[text()="Singapore"]

#Gonna make it for Search appeal feature
Verify Check Outcome tab is Loaded
    Wait Until Element is Visible  xpath=(//a[contains(text(), "Check Outcome")]//parent::div)[2]  timeout=${SHORT_TIMEOUT}

Click Check Outcome Tab
    Click Element  xpath=(//a[contains(text(), "Check Outcome")]//parent::div)[2]
    
Click On Search Type
    Click Element  id=searchType

Choose Search Type with NOPO
    Press Keys  id=searchType  ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ENTER

Choose Search Type with NIRC
    Press Keys  id=searchType  ARROW_DOWN+ENTER

Choose Search Type with Vehicle Number
    Press Keys  id=searchType  ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ENTER

Choose Search Type with Transaction
    Press Keys  id=searchType  ARROW_DOWN+ARROW_DOWN+ARROW_DOWN+ENTER

Input Search Number
    [arguments]    ${Num}
    Input text     id=searchValue  ${Num}

Input Captcha
    ${Captcha}=  Get Text   id=captcha-image
    Input text     id=PLUS27CaptchaCaptchaInput  ${Captcha}

Click Search Button
    Wait Until Element is Enabled  id=appeal-search-btn      timeout=${SHORT_TIMEOUT}
    Click Button  id=appeal-search-btn

User Get No Result Found
    [arguments]     ${num}
    Wait Until Element is Visible   xpath=//b[text()="Transaction No. ${num}"]     timeout=${MEDIUM_TIMEOUT}
    Page Should Contain    No appeal record found

Get Search Method
    Verify Search Result is Display
    ${searchCriteria}=  Get text       xpath=(//span[contains(text(), "Total of")]/b)[2]
    ${type}   Fetch from left   ${searchCriteria}  ${SPACE}No.
    [Return]    ${type}

Get Search Number
    ${searchCriteria}=  Get text       xpath=(//span[contains(text(), "Total of")]/b)[2]
    ${num}   Fetch from right   ${searchCriteria}  No.${SPACE}
    [Return]  ${num} 

Get Total Appeal Result
    ${totalAppeal}=  Get text       xpath=(//span[contains(text(), "Total of")]/b)[1]
    [return]  ${totalAppeal}

Verify Search Result is Display
    Wait Until Element is Visible   id=view-btn    timeout=${SLEEP_TIMEOUT}

Click New Search Button
    Click Button   id=appeal-search-result-research-btn

Get Result and Verify
    Wait Until Element is Visible       xpath=(//button[@id="view-btn"])[4]  timeout=${SHORT_TIMEOUT}

Go to Next Page
    Click Element  xpath=(//div[@id="appeal-search-result-row-box"]//li)[2]

Go to Previous Page
    Click Element  xpath=(//div[@id="appeal-search-result-row-box"]//li)[1]

Verify Check Outcome Page is Loaded
    Wait Until Element is Visible    xpath=//h1[text()="Check Outcome of Appeals"]

Verify page is on Revival Summary
    Element should be visible  xpath=//span[text()="Summary"]//ancestor::div[@class="position-relative"]/button[contains(@class, "active fs-13px")]
    ${loc}    Get Location
    Should be Equal   ${loc}   ${OCMS5PAGE}notices/revival/summary

Prompt for user to choose between Proceed or cancel is displayed
    Verify Pop up Alert Window on e-Service       Confirmation    Revive   Ok
    Page Should Contain Element   xpath=//*[text()="Cancel"]

Click on Pagination Number   
    [Arguments]  ${num}
    Click Element   xpath=//ul[@class="pagination"]//a[text()="${num}"]
    Verify Result Table is Display  


