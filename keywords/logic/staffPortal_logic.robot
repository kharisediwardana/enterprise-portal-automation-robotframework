***Keywords***
Click Create New Case Tab
    Wait Until Element is Visible   xpath=//div[@class="menu-item"]//child::span[text()="Create New Case"]   timeout=${SHORT_TIMEOUT}
    Click Element   xpath=//div[@class="menu-item"]//child::span[text()="Create New Case"]

User Want to Login using selected User
    [Arguments]   ${user}
    Wait Until Element is Visible  xpath=//div[@id="kt_app_toolbar_container"]//button   timeout=${LONG_TIMEOUT}
    Click Button  xpath=//div[@id="kt_app_toolbar_container"]//button
    Select User to Login  ${user}

Select User to Login
    [Arguments]  ${user}
    Wait Until Element is visible  xpath=//div[@id="kt_app_toolbar_container"]//span[text()="${user}"]   timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=//div[@id="kt_app_toolbar_container"]//span[text()="${user}"]

If there is no Reference case, Add it
    ${status}    Run Keyword and Return Status   Wait Until Element is Visible   css=.table-responsive    timeout=${SHORT_TIMEOUT}
    Run Keyword If     "${status}" == "False"  Submit added reference case
    
Submit added reference case
    [Arguments]   ${num}
    Add Reference Case    ${num}
    Submit Case and Back to Reference Case Tab

Verify on Appeal Details Tab
    Wait Until Element is Visible  id=kt_app_content_container   timeout=${SHORT_TIMEOUT}
    Page Should Contain Element   xpath=//h2[text()="Appeal Details"]

Click on Tab  
    [Arguments]  ${tab}
    Click Element   xpath=//span[text()="${tab}"]/parent::div

Choose Case Date
    Click Element  xpath=//div[@id="form-controll-case_date"]//child::input
    Click Element  xpath=//div[@class="flatpickr-days"]//child::span[contains(@class, "today")]
    
Click Button on
    [Arguments]   ${button} 
    Wait Until Page is Completely Loaded
    Wait Until Element is Enabled   xpath=//span[text()="${button}"]//ancestor::button    timeout=${SHORT_TIMEOUT}   
    Click Button   xpath=//span[text()="${button}"]//ancestor::button       

Input Case Time
    Click Element  xpath=//div[@id="form-controll-case_time"]//child::input
    Input Hours
    Input Minutes

Input Hours
    ${time}    Generate Random Time
    Input text     xpath=(//div[contains(@class, "flatpickr-time")]//child::input)[1]   0${time}
Input Minutes
    Input text     xpath=(//div[contains(@class, "flatpickr-time")]//child::input)[2]   00

Input Case Title
    Input text     xpath=//div[@id="form-controll-case_title"]//child::input    Case Title Test

Input Case Description
    Input text     xpath=//div[@id="form-controll-case_description"]//child::textarea    ${text}
    Set Test Variable   \${CaseDesc}   ${text}

Upload Motorist Attachment
    [Arguments]  ${file}
    Choose File  xpath=(//form[@id="form-file-upload"]//input)[1]    ${file}

Upload Officer Document
    [Arguments]  ${file}
    Choose File  xpath=(//form[@id="form-file-upload"]//input)[2]    ${file}

Input Officer Remark
    Input Text     xpath=//div[@id="form-controll-appeal.officer_remark"]//child::textarea      ${remark}
    Set Test Variable   \${OfcRemark}   ${remark}

Set Driver as Yes
    Click Element  xpath=//div[@id="form-controll-appeal.is_driver"]//child::label[text()="Yes"]

Set Driver as No
    Click Element  xpath=//div[@id="form-controll-appeal.is_driver"]//child::label[text()="No"]

Choose Primary OIC
    Sleep   .5
    Click Button   xpath=//div[@id="form-controll-plm"]//button
    Wait Until Element is Visible   xpath=//div[@id="form-controll-plm"]//a   timeout=${MEDIUM_TIMEOUT}
    #${count}   Get Element Count   xpath=//div[@id="form-controll-plm"]//a
    #${index}=  Generate Random Number  ${count}
    Click Element   xpath=(//div[@id="form-controll-plm"]//a)[2]
    ${OIC}    Get Text    xpath=//div[@id="form-controll-plm"]//button
    Set Test Variable    \${PrimaryOIC}   ${OIC}

Choose Secondary OIC
    Click Button   xpath=//div[@id="form-controll-plm2"]//button
    Wait Until Element is Visible   xpath=//div[@id="form-controll-plm2"]//a   timeout=${MEDIUM_TIMEOUT}
    ${count}   Get Element Count   xpath=//div[@id="form-controll-plm2"]//a
    ${index}=  Generate Random Number  ${count}
    Click Element   xpath=(//div[@id="form-controll-plm2"]//a)${index}
    #Click Element  xpath=//div[@id="form-controll-plm2"]//span[text()="Steven"]
    ${OIC}    Get Text    xpath=//div[@id="form-controll-plm2"]//button
    Set Test Variable    \${SecondaryOIC}   ${OIC}

Choose Secondary OIC with
    [Arguments]   ${OIC}
    Click Button   xpath=//div[@id="form-controll-plm2"]//button
    Wait Until Element is Visible   xpath=//div[@id="form-controll-plm2"]//a   timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=//div[@id="form-controll-plm2"]//span[text()="${OIC}" or "Jenny"]

Click Next Page Button
    Scroll To Bottom Page
    Click Button   xpath=//span[text()="Next Page"]//ancestor::button

Verify on Tab
    [Arguments]   ${tab}
    Scroll To Top Page
    Wait Until Element Is Visible   xpath=//h2[text()="${tab}"]   timeout=${SHORT_TIMEOUT}

Input Appellant Details Name
    Choose Title Name
    Input Appellant Name

Choose Title Name
    Wait Until Element is Visible  xpath=//div[@id="form-controll-customer.customer_title"]//button   timeout=${SHORT_TIMEOUT}
    Click Button  xpath=//div[@id="form-controll-customer.customer_title"]//button
    Wait Until Element is Visible   xpath=//span[text()="Dr"]//parent::a  timeout=${SHORT_TIMEOUT}
    Click Element  xpath=//span[text()="Dr"]//parent::a

Input Appellant Name
    #${data}        Generate Random Name
    #${name}        Convert to Upper Case       ${data}
    Input Text     xpath=//div[@id="form-controll-customer.name"]//input    ${name}
    Set Test Variable  \${CustName}  ${name}

Choose ID Type
    [Arguments]  ${type}
    Scroll Element into view   xpath=//b[text()="Address"]
    Click Button   xpath=//div[@id="form-controll-customer.id_type"]//button
    Click Element  xpath=//span[contains(text(),"${type}")]/parent::a

Input ID Number
    [Arguments]   ${num}
    Input Text     xpath=//div[@id="form-controll-customer.identity_no"]//input  ${num}

Choose Country Code Number
    [Arguments]  ${country}
    Click Button   xpath=//div[@id="form-controll-customer.mobile_code"]//button 
    Click Element  xpath=//span[text()="${country}"]/parent::a

Input Mobile Number
    Input Text      xpath=//div[@id="form-controll-customer.contact_1"]//input   ${validContact}

Choose Alternative Contact
    Click Button    xpath=//div[@id="form-controll-customer.tel_type"]//button
    Click Element   xpath=//div[@id="form-controll-customer.tel_type"]//span[text()="Mobile"]

Choose Alternative Contact Code Region
    [Arguments]  ${country}
    Click Button   xpath=//div[@id="form-controll-customer.tel_code"]//button 
    Click Element  xpath=//span[text()="${country}"]/parent::a

Input Alternative Contact Number
    Input Text      xpath=//div[@id="form-controll-customer.contact_2"]//input   ${validContact}

Input Email Address
    ${email}   Input Text      xpath=//div[@id='form-controll-["customer_emails"][0]["email"]']//input      ${validemail}
    Set Test Variable    \${CustEmail}   ${email}

Add Alternative Email
    Click Add Email Button
    Input Alternative Email
Click Add Email Button
    Click Element   xpath=//div[@id="form-controll-customer_emails"]//a
    Wait Until Element is Visible  xpath=//div[@id='form-controll-["customer_emails"][1]["email"]']//input    timeout=${SHORT_TIMEOUT}

Input Alternative Email
    ${email}   Input Text      xpath=//div[@id='form-controll-["customer_emails"][1]["email"]']//input     ${validemail}
    Set Test Variable    \${CustEmail2}   ${email}

Choose Address Country Postal Code
    #Click Button  xpath=//div[@id="form-controll-customer.address.country"]//button
    Element Text Should Be   xpath=//div[@id="form-controll-customer.area_code_1"]//button   Singapore

Choose Mailing Address Country Postal Code
    Element Text Should Be   xpath=//div[@id="form-controll-customer.area_code_2"]//button   Singapore

Get Registered Address
    [Arguments]  ${postal_code}
    Input Text    xpath=//div[@id="form-controll-customer.postal_code"]//input      ${postal_code}
    Click Button  xpath=//div[@id="form-controll-customer.postal_code"]//button
    Sleep     2

Get Mailing Address
    [Arguments]  ${postal_code}
    Input Text    xpath=//div[@id="form-controll-customer.postal_code_2"]//input      ${postal_code}
    Click Button  xpath=//div[@id="form-controll-customer.postal_code_2"]//button
    Sleep    2

Verify Checkbox Status
    Checkbox Should Be Selected     xpath=//div[@id="form-controll-customer.mailing.is_registered"]//input

Set Mailing Address same as Registered Address
    ${status}     Run Keyword and return status   Verify Checkbox Status
    Run Keyword if    '${status}' == 'False'    Copy Registered Address

Copy Registered Address
    Click Element   xpath=//div[@id="form-controll-customer.mailing.is_registered"]//input

Verify on Profile Tab
    Wait Until Element Is Visible   xpath=//h2[text()="Profile"]  timeout=${SHORT_TIMEOUT}

Choose Case Type
    [Arguments]  ${type}
    Wait Until Element is Visible   xpath=//div[@id="form-controll-case_type"]//button      timeout=${SHORT_TIMEOUT}
    Click Button    xpath=//div[@id="form-controll-case_type"]//button
    Select Case Type   ${type}
    Set Test Variable   \${caseType}   ${type}
    
Select Case Type
    [Arguments]   ${type}
    Wait Until Element is Visible   xpath=//div[@id="form-controll-case_type"]//span[text()="${type}"]/parent::button      timeout=${SHORT_TIMEOUT}
    Click Element   xpath=//div[@id="form-controll-case_type"]//span[text()="${type}"]/parent::button
    

#? no need later
Set Case Type Variable
    ${a}    Get Text        id=form-controll-case_type
    ${text}   Fetch From Right  ${a}  Case Type\n
    Set Test Variable   \${caseType}   ${text}

Choose Feedback Channel
    [Arguments]   ${channel}
    Wait Until Element is Visible   xpath=//div[@id="form-controll-feedback_channel"]//button     timeout=${SHORT_TIMEOUT}
    Click Button    xpath=//div[@id="form-controll-feedback_channel"]//button
    Select Feedback Channel   ${channel}
    Set Test Variable  \${feedbackChannel}    ${channel}

Select Feedback Channel
    [Arguments]   ${channel}
    Wait Until Element is Visible   xpath=//div[@id="form-controll-feedback_channel"]//span[text()="${channel}"]   timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=//div[@id="form-controll-feedback_channel"]//span[text()="${channel}"]
    
#? no need later
Set Feedback Channel Variable
    ${a}     Get Text        id=form-controll-feedback_channel
    ${text}   Fetch From Right  ${a}  Feedback Channel\n
    Set Test Variable   \${feedbackChannel}   ${text}

Verify Created Case is Loaded
    [Arguments]   ${case}
    ${status}   Run Keyword and Return Status  Wait Until Element is Visible  xpath=//div[@id="kt_app_content"]//div[contains(@class,"underline")]//span[text()="${case}"]  timeout=${SHORT_TIMEOUT}
    Run Keyword If     '${status}' == 'False'   Refresh the search result

Refresh the search result
    Scroll to Bottom Page
    Click Element    css=.next
    Click Element    css=.previous

Choose Feeback Source
    [Arguments]    ${source}
    Click Button    xpath=//div[@id="form-controll-feedback_source"]//button
    Select Feedback Source   ${source}
    Set Test Variable   \${feedbackSource}   ${source}

Select Feedback Source
    [Arguments]   ${source}
    Wait Until Element is Visible    xpath=//div[@id="form-controll-feedback_source"]//span[text()="${source}"]    timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=//div[@id="form-controll-feedback_source"]//span[text()="${source}"]

#? no need later
Set Feedback Source Variable
    ${a}     Get Text        id=form-controll-feedback_source
    ${text}   Fetch From Right  ${a}  Feedback Source\n
    Set Test Variable   \${feedbackSource}   ${text}

Click Work Area Button
    Click Button on    Add Work Area
    Wait Until Element is Visible   id=kt_modal_select_location    timeout=${LONG_TIMEOUT}

Choose Critera
    [Arguments]  ${criteria}
    Wait Until Element is Visible  xpath=//div[@id="kt_modal_select_location"]//ul/li  timeout=${SHORT_TIMEOUT}
    Click Element   xpath=//div[@id="kt_modal_select_location"]//div[@class="tab-content"]//div[text()="${criteria}"]

Select Reason 
    #${count}    Get Element Count   xpath=//div[@id="kt_modal_select_location"]//input
    #${index}=     Generate Random Number  ${count}
    Wait Until Element is Visible  xpath=(//div[@id="kt_modal_select_location"]//input)[1]   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=(//div[@id="kt_modal_select_location"]//input)[1]

Add Selected Work Area
    Wait Until Element is Enabled   xpath=(//span[text()="Add Work Area"]//ancestor::button)[2]     timeout=${SHORT_TIMEOUT}
    Click Element   xpath=(//span[text()="Add Work Area"]//ancestor::button)[2]

Scroll to Add Work Save Button
    Scroll Element into View   xpath=//span[text()="Save"]//ancestor::button
    Click Button on    Save

Scroll to OK Add Appelant
    Scroll Element into View   xpath=//span[text()="Ok"]//ancestor::button
    Click Button on   Ok

Verify on Reply Tab
    Wait Until Element Is Visible   xpath=//h2[text()="Reply"]  timeout=${SHORT_TIMEOUT}

Choose Sending Email
    Click Element   id=radio0     #path=(//div[@id="form-controll-case_reply.send_email"]//input)[1]

Choose Not Sending Email
    Click Element   id=radio1

Input Reply Date
    Click Element   xpath=//div[@id="form-controll-case_reply.reply_date"]//input
    Click Element  xpath=//div[@class="flatpickr-days"]//child::span[contains(@class, "today")]

Choose Reply Status
    [Arguments]  ${status}
    Click Button    xpath=//div[@id="form-controll-case_reply.reply_status"]//button
    Wait Until Element is Visible   xpath=//div[@id="form-controll-case_reply.reply_status"]//span[text()="${status}"]  timeout=${SHORT_TIMEOUT}
    Click Element   xpath=//div[@id="form-controll-case_reply.reply_status"]//span[text()="${status}"]

Choose Reply Channel
    Click Button    xpath=//div[@id="form-controll-case_reply.reply_channel"]//button
    Click Element   xpath=//div[@id="form-controll-case_reply.reply_channel"]//span[text()="SMS"]

Input Reply Destination
    #Input Text   xpath=//div[@id="form-controll-case_reply.to_emails"]//div[@class="tags-input"]     ${CustEmail}
    Click Element  xpath=//div[@id="form-controll-case_reply.to_emails"]//div[@class="tags-input"]
    Press Keys   none    ARROW_DOWN+ENTER

Input Reply Subject
    #${subject}     Generate Random Text
    Input Text   xpath=//div[@id="form-controll-case_reply.subject"]//input     ${remark}
    Set Test Variable   \${replySubject}   ${remark}

Input Reply Remark
    Input Text   xpath=//div[@id="form-controll-case_reply.reply_remark"]//p     ${remark}
    Set Test Variable   \${replyRemark}   ${remark}

Upload Reply Attachment with
    [Arguments]  ${File}
    Choose File  xpath=//div[@id="form-controll-documents"]//input  ${file}

Failed to Upload Attachment 
    Scroll to Bottom Page
    #Need Add Assertion Error Message
    Page Should not Contain  xpath=//div[@id="form-controll-documents"]//div[@class=("col-4 mb-2")]  message=Page Still Able Upload Document

Able to Select Reply Status by dropdown
    ${text}   Get text   xpath=//div[@id="form-controll-case_reply.reply_status"]//button
    Should be Equal  Replied   ${text}

Able to Select Reply Channel by dropdown
    ${text}   Get text   xpath=//div[@id="form-controll-case_reply.reply_channel"]//button
    Should be Equal  SMS   ${text}

Able to Input Email Direction by Suggestion
    ${text}   Get text   xpath=//div[@id="form-controll-case_reply.to_emails"]//Span
    Should be Equal  ${validemail}   ${text}

Able to Input Reply Subject
    ${text}   Get value   xpath=//div[@id="form-controll-case_reply.subject"]//input
    Should be Equal  ${replySubject}   ${text}
    
Able to Input Reply Remark
    ${text}   Get text   xpath=//div[@id="form-controll-case_reply.reply_remark"]//span
    Should be Equal  Paragraph   ${text}
    
Able to Attach Document 
    ${text}   Get text   xpath=//div[@id="form-controll-documents"]//span
    Should be Equal  1.pdf (0.14 Mb)  ${text}

Verify on Reference Case Tab
    Wait Until Element Is Visible   xpath=//h2[text()="Reference Case"]  timeout=${SHORT_TIMEOUT}



Select Reference Case
    Wait Until Element is Visible    xpath=//span[text()="Add"]//ancestor::button    timeout=${MEDIUM_TIMEOUT}
    #${count}   Get Element Count   xpath=//span[text()="Add"]//ancestor::button
    #${index}=    Generate Random Number    ${count}
    Click Button    xpath=(//span[text()="Add"]//ancestor::button)       #${index}

Click Add Reference Case Button
    Click Button on      Add Reference Case
    Wait Until Element is Visible   id=kt_modal_select_location  timeout=${SHORT_TIMEOUT}

Input Reduction Stage
    Input Text   xpath=//div[@id="form-controll-verificationform.reduction.reduction_stage"]//input   DR1

Input Payment Due date
    Click Element  xpath=//div[@id="form-controll-verificationform.reduction.payment_due_date"]//input
    Click Element  xpath=(//span[@class="flatpickr-day today"])[1]

Input Reduction Amount
    Input text  xpath=//div[@id="form-controll-verificationform.reduction.reduction_amount"]//input   10

Input Reduction Payment Cut Time
    Press Keys  xpath=//div[@id="form-controll-verificationform.reduction.payment_cut_of_time"]//input  ENTER

Input Status of reduction 
    Input text  xpath=//div[@id="form-controll-verificationform.reduction.status_reduction"]//input   TRUE

Input Validity Date of Document
    Click Element  xpath=//div[@id="form-controll-verificationform.reduction.validity_date_documents"]//input
    Click Element  xpath=(//span[@class="flatpickr-day today"])[1]

Input Date of Submission
    Click Element  xpath=//div[@id="form-controll-verificationform.reduction.date_time_submission"]//input
    Click Element  xpath=(//span[@class="flatpickr-day today"])[1]

Input PLM remarks
    input text   xpath=//div[@id="form-controll-verificationform.reduction.oic_remarks"]//textarea  AA
   
Select Supporting Officer
    Click Button  xpath=//div[@id="form-controll-verificationform.reduction.supporting_officer"]//button
    Click Element  xpath=(//div[@id="form-controll-verificationform.reduction.supporting_officer"]//a)[1]

Input supporting officer remarks
    input text   xpath=//div[@id="form-controll-verificationform.reduction.supporting_officer_remarks"]//textarea  AA

Select Approving Officer
    Click Button  xpath=//div[@id="form-controll-verificationform.reduction.approving_officer"]//button
    Click Element  xpath=(//div[@id="form-controll-verificationform.reduction.approving_officer"]//a)[1]

Input apporving officer remarks
    input text   xpath=//div[@id="form-controll-verificationform.reduction.approving_officer_remarks"]//textarea  AA


Input Vehicle Number
    [Arguments]   ${number}
    Input Text    xpath=//div[contains(@id, "form-controll-notice_no[$regex]")]//input   ${number}

Input Notice Number
    [Arguments]    ${num}
    Input Text    xpath=//div[contains(@id, "form-controll-notice_no")]//input  ${num}

#User for Non Exist Case
Input Summon Number
    Input Text    xpath=//div[contains(@id, "form-controll-summon_no")]//input  123456/2000

Input NIRC Number
    Input Text    xpath=//div[@id="form-controll-rcb_no"]//input  S1234567A

Select Today Date
    Click Element  css=.form-group
    Click Element  xpath=//span[@class="flatpickr-day today"]

Select Tomorrow Day
    Click Element  xpath=(//div[@class="form-group"])[2]
    Click Element  xpath=(//span[@class="flatpickr-day today"]//following::span)[1]

Search Result within date range Display
    ${current_date}         Get Date for Today
    Verify Table is Loaded
    Page Should Contain Element   xpath=//div[@id="kt_app_content"]//child::span[contains(text(),"${current_date}")]    message=Filter by Date Function is not working

Able to Sort Case History
    Verify Result Table is Display  
    Element should be visible    xpath=(//tr[@class="fw-1"])[1]/td/span[text()="Zulfi"]

Able to Sort OIC Assigment
    Verify Result Table is Display  
    Element should be visible    xpath=(//tr[@class="fw-1"]//span)[3][text()="${PrimaryOIC}"]
    Element should be visible    xpath=(//tr[@class="fw-1"]//span)[4][text()="Zulfi"]

Able to Sort NOPO Decision
    Verify Result Table is Display  
    ${Date}     Get Date on Table
    ${today}    Get Today's Date
    Should be Equal    ${Date}  ${today}
    
Get Date on Table
    ${D}   Get Text   xpath=((//tr[@class="fw-1"])[1]//span)[2]
    ${Date}   Fetch from left   ${D}   ,
    [Return]  ${Date}
    

Sort History Ascending
    [Arguments]   ${filter}
    Verify Result Table is Display  
    Click Element   xpath=//th[text()="${filter}"]/i
    Click Element   xpath=//th[text()="${filter}"]/i
    Click Element   xpath=//th[text()="${filter}"]/i

Verify Table is Loaded
    Wait Until Element is Visible   css=.table-responsive    timeout=${LONG_TIMEOUT}

Click Date Time Filter
    Click Element   xpath=//div[@class="table-responsive"]//span[contains(text(),"Date")]

Choose Payment Status
    Click Button  xpath=//div[@id="form-controll-payment_status"]//button
    Click Element  xpath=//div[@id="form-controll-payment_status"]//span[text()="Un Paid"]

Search for Reference Case
    [Arguments]     ${number}
    Click Add Reference Case Button
    Click Button  xpath=(//button[@id="button-id-Reset"])[2]
    Wait Until Page Process is Complete
    Input Notice Number     ${number} 
    Click Button   xpath=(//span[text()="Search"]//ancestor::button)[2]

Click Reference Case Close Button
    Scroll Element Into View   xpath=//h5[text()="Search Reference Case"]
    Click Element  xpath=//h5[text()="Search Reference Case"]//following-sibling::div

Verify on Summary Tab
    Wait Until Element Is Visible   xpath=//h2[text()="Appeal Details"]  timeout=${SHORT_TIMEOUT}

Inputted Appeal Details Data
    Element Text Should Be   xpath=//p[text()="Case Title"]/parent::div/following-sibling::div/b    Case Title Test
    Element Text Should Be   xpath=//p[text()="Case Description"]/parent::div/following-sibling::div/b  ${CaseDesc}
    Element Text Should Be   xpath=(//p[text()="Motorist Document"]/parent::div/following-sibling::div//child::span)[1]     1.docx
    Element Text Should Be   xpath=(//p[text()="Officer Document"]/parent::div/following-sibling::div//child::span)[1]     1.xlsx

Motorist Document Attached
    Page Should Contain Element  xpath=//form[@id="form-file-upload"]//span[text()="1.docx"]

Officer Document Attached
    Page Should Contain Element  xpath=//form[@id="form-file-upload"]//span[text()="1.xlsx"]  

Scroll to Summary Contact Number Section
    Scroll Element Into View    xpath=//p[text()="Contact Number"]

Inputted Appellant Details
    Scroll to Summary Contact Number Section
    Element Text Should Be   xpath=//p[text()="Name"]/parent::div/following-sibling::div/b      ${CustName}
    Element Text Should Be   xpath=//p[contains(text(),"FIN")]/parent::div/following-sibling::div/b   ${NRIC}
    Element Text Should Be   xpath=//p[text()="Email Address"]/parent::div/following-sibling::div/b    ${validemail}
    Element Text Should Be   xpath=//p[text()="Postal Code"]/parent::div/following-sibling::div/b     Singapore ${PostalCode}
    
Scroll to Summary Reply Section
    Scroll Element Into View   xpath=//h2[text()="Reply"]

Inputted Profile Data
    Scroll to Summary Reply Section
    Element Text Should Be   xpath=//p[text()="Case Type"]/parent::div/following-sibling::div/b     A     #${caseType}
    Element Text Should Be   xpath=//p[text()="Feedback Source"]/parent::div/following-sibling::div/b    CT    #${feedback_source}
    Element Text Should Be   xpath=//p[text()="Feedback Channel"]/parent::div/following-sibling::div/b     ${feedback_channel}
    
Scroll to Reference Case Section
    Scroll Element Into View   xpath=//h2[text()="Reference Case"]

Inputted Reply Data
    Scroll to Reference Case Section
    Element Text Should Be   xpath=//p[text()="To"]/parent::div/following-sibling::div/b          ${validemail}
    Element Text Should Be   xpath=//p[text()="Subject"]/parent::div/following-sibling::div/b     ${replySubject}
    Element Text Should Be   xpath=//p[text()="Reply Remark"]/parent::div/following-sibling::div//p    ${replyRemark}
    Element Text Should Be   xpath=(//p[text()="Reply Attachment"]//parent::div/following-sibling::div//child::span)[1]    1.pdf

Verify on Case History Section    
    Wait Until Element is Visible   xpath=//a[text()="Case History"]  timeout=${SHORT_TIMEOUT}

Submit Case
    Scroll To Top Page
    Click Button on  Submit
    Verify to sumbit cases

Verify to sumbit cases
    Wait Until Element is Visible   css=.modal-content   timeout=${MEDIUM_TIMEOUT}
    Click Button on    Ok

Verify Submit Data is Success
    Wait Until Element is Visible   xpath=//div[text()="Your case has been successfully submitted"]   timeout=${SLEEP_TIMEOUT}
    Click Button on  Ok Got it
    Wait Until Element is Not Visible   xpath=//p[text()="Case No."]/ancestor::div[@class="row mb-4"]//b[text()="-"]   timeout=${MEDIUM_TIMEOUT}
    Get Case Number on Summary

Get Case Number on Summary
    ${numcase}  Get text   xpath=//div[@id="kt_app_content_container"]//b
    Set Test Variable   \${case}    ${numcase} 

Case save as Draft
    [Arguments]  ${case}
    Scroll Element into view   xpath=//span[text()="${case}"]
    Page Should contain Element   xpath=//span[text()="Draft"]

User Able to Input Data on Field
    Textfield Value Should be   xpath=//div[@id="form-controll-customer.postal_code"]//input   ${PostalCode}
    Scroll To Top Page
    Textfield Value Should be   xpath=//div[@id="form-controll-customer.name"]//input   ${CustName}
    Textfield Value Should be   xpath=//div[@id="form-controll-customer.identity_no"]//input   ${NRIC}
    Textfield Value Should be   xpath=//div[@id='form-controll-["customer_emails"][0]["email"]']//input   ${validemail}
    Textfield Value Should be   xpath=//div[@id='form-controll-["customer_emails"][1]["email"]']//input   ${validemail}
    Textfield Value Should be   xpath=//div[@id="form-controll-customer.contact_1"]//input   ${validContact}
    Textfield Value Should be   xpath=//div[@id="form-controll-customer.contact_2"]//input   ${validContact}
    
Verify New Window is Display
    Wait Until Element is Visible    id=kt_modal_select_location   timeout=${SHORT_TIMEOUT}

Choose Add Appellant Title Name
    Verify New Window is Display
    Click Button   xpath=//div[@id="form-controll-customeradd.customer_title"]//button
    Click Element  xpath=//span[text()="Dr"]/parent::a/parent::div

Input Add Appellant Title Name
    ${name}  Generate Random Name
    Input Text    xpath=//div[@id="form-controll-customeradd.name"]//input  ${name}
    Set Test Variable   \${cust1}   ${name}

Click Edit on Appellant Data
    Scroll To Bottom Page
    ${firstcust}         Get Text     xpath=(//div[@id="kt_app_content_container"]//a)[3]
    Set Test Variable   \${firstcust}   ${firstcust}
    Click Element   xpath=//a[text()="${cust1}"]

Choose Add Appellant ID Type
    Click Button   xpath=//div[@id="form-controll-customeradd.id_type"]//button
    Wait Until Element is Visible   xpath=//span[text()="Singapore NRIC "]/parent::a/parent::div   timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=//span[text()="Singapore NRIC "]/parent::a/parent::div

Input Add Appellant ID Number
    [Arguments]   ${num}
    Input Text    xpath=//div[@id="form-controll-customeradd.identity_no"]//input  ${num}

Input Add Appellant Contact Number 
    Input Text    xpath=//div[@id="form-controll-customeradd.contact_1"]//input  1234567
Input Add Appellant Alternative Contact Number
    Input Text    xpath=//div[@id="form-controll-customeradd.contact_2"]//input  1234567
Input Add Appellant Email
    Input Text    xpath=//div[@id="form-controll-[customeradd][emails][0][email]"]//input  ${validemail}
Get Address on Add Appellant
    Input Text    xpath=//div[@id="form-controll-customeradd.postal_code"]//input  ${PostalCode}
    Click Button    xpath=//div[@id="form-controll-customeradd.postal_code"]//button

User Able to Add Multiple Appellant
    Page Should Contain Element   xpath=//span[text()="Delete"]/ancestor::div[contains(@class, "card-body")]

Get Street Name Address
    Verify Get Address is populated
    Textfield Value Should Be   xpath=//div[@id="form-controll-customer.street_name"]//input   ANG MO KIO AVENUE 6

Verify Get Address is populated
    Wait Until Element is Visible   xpath=//div[@id="form-controll-customer.building_name"]//input[@value="ANG MO KIO 61"]   timeout=${MEDIUM_TIMEOUT}

Address is Empty
    Textfield Value Should Be   xpath=//div[@id="form-controll-customer.street_name"]//input   ${EMPTY}

Get Street Name on Mailing Address
    [Arguments]   ${name}
    Wait Until Element is Visible   xpath=//button[text()="Get Address"]  
    Textfield Value Should Be   xpath=//div[@id="form-controll-customer.street_name"]//input   ${name}

Unable to Edit Mailing Address
    Get Street Name on Mailing Address      ANG MO KIO AVENUE 6
    Textfield Value Should Be   xpath=//div[@id="form-controll-customer.postal_code_2"]//input   ${PostalCode}    
    

Officer Remark Inputted
    Textarea Value Should be   xpath=//div[@id="form-controll-appeal.officer_remark"]//textarea   ${OfcRemark}

Case Description Inputted
    Textarea Value Should be   xpath=//div[@id="form-controll-case_description"]//textarea  ${CaseDesc}

Case Title Inputted
    Textfield Value Should be   xpath=//div[@id="form-controll-case_title"]//input   Case Title Test

OIC Should be Selected
    Page Should Contain Element   xpath=//div[@id="form-controll-plm2"]//button[text()="${SecondaryOIC}"]
    Page Should Contain Element   xpath=//div[@id="form-controll-plm"]//button[text()="${PrimaryOIC}"]

Driver Should Be Selected
    ${value}   Get Value   xpath=//label[text()="Yes"]/parent::div/input
    Should be equal  true  ${value}

Error Message Validator Empty Data display
    [Arguments]   ${section}
    Element Should Be Visible    css=.fa-solid.fa-circle-exclamation.text-danger
    Element Should be Visible    xpath=//div[@data-validator="notEmpty"][text()="${section}"]

Description Characters Count Display
    Page Should Contain Element   xpath=//div[@id="form-controll-case_description"]//span
    ${text}  Get Text   xpath=//div[@id="form-controll-case_description"]//span
    Should Not Be Equal   2000 characters left   ${text}

Officer Remark Characters Count Display
    Page Should Contain Element   xpath=//div[@id="form-controll-appeal.officer_remark"]//span
    ${text}  Get Text   xpath=//div[@id="form-controll-appeal.officer_remark"]//span
    Should Not Be Equal   2000 characters left   ${text}

User See Error Message Invalid File Format
    Page Should Contain Element   xpath=//div[text()="Invalid file format."]    message=Error Message not Display
    Click Button on   Ok Got it

Customer Attachment list Not Display
    Page Should not Contain  xpath=(//label[text()="Customer Document"]/following-sibling::div//span)[1]
  

Office Attachment list Not Display
    Page Should not Contain  xpath=(//label[text()="Officer Document"]/following-sibling::div//span)[1]

Exceed File Size Error Display
    Wait Until Element is Visible    css=.modal-content   timeout=${SHORT_TIMEOUT}
    Page Should Contain    Maximum file size is 10 MB.

Attach Multiple File until Exceeed Designate size
    Choose File    xpath=//h3[text()="Customer Attachment"]//ancestor::form//input[@id="file-upload"]  C:\\Users\\QA_Engineer\\Documents\\Workspace\\Portal\\Media\\3.3gp
    Choose File    xpath=//h3[text()="Customer Attachment"]//ancestor::form//input[@id="file-upload"]  C:\\Users\\QA_Engineer\\Documents\\Workspace\\Portal\\Media\\3.jpg
    Choose File    xpath=//h3[text()="Customer Attachment"]//ancestor::form//input[@id="file-upload"]  C:\\Users\\QA_Engineer\\Documents\\Workspace\\Portal\\Media\\3.png
    Choose File    xpath=//h3[text()="Customer Attachment"]//ancestor::form//input[@id="file-upload"]  C:\\Users\\QA_Engineer\\Documents\\Workspace\\Portal\\Media\\3.bmp

User Able to Input Data with Dropdown Menu
    Element Text Should Be   xpath=//label[text()="Case Type"]/parent::div//button   ${caseType}
    Element Text Should Be   xpath=//label[text()="Feedback Channel"]/parent::div//button    ${feedback_channel} 
    Element Text Should Be   xpath=//label[text()="Feedback Source"]/parent::div//button     ${feedback_source}

Performance Day Auto-Generate
    ${Status}   Run Keyword and return status    Get Value   xpath=//div[@id="form-controll-perfomance_standard.name"]//input
    Should be Equal as Strings    ${Status}   True

User Able to Select Work Area
    Scroll To Bottom Page
    Page Should Contain Element      //span[text()="Delete"]/ancestor::table

Select Same Work Area
    Wait Until Element is Visible    xpath=//label[text()="Run errands"]/parent::div/input    timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=//label[text()="Run errands"]/parent::div/input
    Click Button    xpath=(//span[text()="Add Work Area"]//ancestor::button)[2]

User Able to Choose Driver Status
    ${value}=   Get Value   xpath=(//div[@id="form-controll-appeal.is_driver"]//input)[1]
    Should be Equal   true  ${value}

#Make it one keyword
Click Reference Case Tab
    Scroll To Top Page
    Click Element  xpath=//div[@id="kt_app_content_container"]//span[text()="Reference Case"]//ancestor::button
    Wait Until Element is Visible   xpath=//div[@id="kt_app_content_container"]//h2[text()="Reference Case"]  timeout=${SHORT_TIMEOUT}

Click Summary Tab
    Scroll To Top Page
    Click Element  xpath=//div[@id="kt_app_content_container"]//span[text()="Summary"]//ancestor::button
    Wait Until Element is Visible   xpath=//div[@id="kt_app_content_container"]//h2[text()="Summary"]  timeout=${SHORT_TIMEOUT}

Click Reply Tab
    Scroll To Top Page
    Click Element  xpath=//div[@id="kt_app_content_container"]//span[text()="Reply"]//ancestor::button
    Wait Until Element is Visible   xpath=//div[@id="kt_app_content_container"]//h2[text()="Reply"]  timeout=${SHORT_TIMEOUT}

User Able to Input Data on Reference Case Search
    ${value}  Get Value   xpath=//div[contains(@id, "form-controll-notice_no")]//input
    Should be Equal  ${NOPO}   ${value}

Search Reference Case Result Display
    #Scroll Element into View   css=.pagination
    Scroll To Bottom Page
    Verify Result Table is Display  
    Page Should Contain Element  css=tr.fw-1    message=Search Result is Empty

User See No Record to Display
    Scroll to Bottom Page
    Wait Until Element is Visible   xpath=(//div[text()="No records to display"])[6]    timeout=${MEDIUM_TIMEOUT}
    Page Should Not Contain Element  css=tr.fw-1         

User Able Add NOPO as Reference Case
    [Arguments]    ${num}
    Page Should Contain Element  xpath=//tr[@class="fw-1"]//span[text()="${num}"]   message=Failed to add selected nopo

Select Added Nopo
    Wait Until Element is Visible   xpath=//tr[@class="fw-1"]//input[@type="checkbox"]    timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=//tr[@class="fw-1"]//input[@type="checkbox"]
    
Click Assign Appellant as Driver Button
    Wait Until Element is Enabled   xpath=//div[@id="kt_app_content_container"]//span[contains(text(),"Assign")]//ancestor::button  timeout=${SHORT_TIMEOUT}
    Click Button   xpath=//div[@id="kt_app_content_container"]//span[contains(text(),"Assign")]//ancestor::button

Get Appellant Name
    ${name}   Get text   xpath=//input[@id="radio0"]//following::label
    Set test Variable    \${AppellentName}   ${name}

Select Appellant
    [Arguments]  ${index}
    Wait Until Element is Visible   id=kt_modal_select_location   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=(//div[@id="kt_modal_select_location"]//input)${index}

No Appellant Display
    Element Should not be Visible  xpath=(//div[@id="kt_modal_select_location"]//input)

Confirm Assign Appellant as Driver
    [Arguments]     ${index}
    Select Appellant     ${index}
    Get Appellant Name
    Click Button   xpath=(//div[@id="kt_modal_select_location"]//button)[2]

User Able to Assign Nopo to Appellant
    Wait Until Element is Visible    xpath=//body[@id="kt_app_body"]//div[@class="modal-content"]   timeout=${MEDIUM_TIMEOUT}
    Wait Until Element is Visible   xpath=//body[@id="kt_app_body"]//div[@class="modal-content"]//i   timeout=${LONG_TIMEOUT}
    Page Should Contain Element   xpath=//body[@id="kt_app_body"]//div[@class="modal-content"]//b/parent::div
    Page Should Contain Element   xpath=(//body[@id="kt_app_body"]//div[@class="modal-content"]//span)[2]

Get first Appellant name 
    ${first}   Get Text    xpath=(//label[@class="form-check-label"])[6]
    Set Test Variable   \${first}    ${first}

#Click Ok Got It Button
    #Wait Until Element is Visible   xpath=//span[text()="Ok Got it"]//ancestor::button    timeout=${MEDIUM_TIMEOUT}
    #Click Button on    Ok Got it

Verify Assigned Appellant has changed
    ${second}  Get Driver Name on Notice Summary
    Should not be equal   ${first}   ${second}

Delete Added Appelant
    Click on Tab   Appellant Details
    Scroll To Bottom Page
    Click Button  xpath=(//button[@id="button-id-Delete"])[6]
    Click Button  xpath=(//button[@id="button-id-Delete"])[5]

Close Assign Appellant as Driver Window
    Click Button   xpath=(//div[@id="kt_modal_select_location"]//button)[1]

Driver Should Able to Close Up Pop up Window
    Wait Until Element is Not Visible   id=kt_modal_select_location     timeout=${MEDIUM_TIMEOUT}

Verify Selected Primary OIC
    Scroll Element into view   xpath=//h2[text()="Appeal Details"]
    Element Text Should Not Be   xpath=//p[text()="Primary OIC"]/parent::div/following-sibling::div/b  -
    ${OIC}    Get Text   xpath=//p[text()="Primary OIC"]/parent::div/following-sibling::div/b
    Set Test Variable    \${PrimaryOIC}   ${OIC}


Verify Selected Secondary OIC
    Element Text Should Not Be   xpath=//p[text()="Secondary OIC"]/parent::div/following-sibling::div/b  -
    ${OIC}    Get Text   xpath=//p[text()="Secondary OIC"]/parent::div/following-sibling::div/b
    Set Test Variable    \${SecondaryOIC}   ${OIC}

Verify on Draft section
    Page Should Contain Element  xpath=//span[@class="menu-title fw-bold text-primary"][text()="Inbox"]
    Page Should Contain   Appeal Details

User save case with assigned OIC
    Scroll To Top Page
    Click Button on    Save as Draft
    Wait Until Element is Visible   xpath=//div[text()="Save as Draft"]//ancestor::div[@class="modal-content"]   timeout=${MEDIUM_TIMEOUT}
    Click Button on    Ok
    Click Button on     Ok Got it

User Success Save Case as Draft    
    Verify summary Data is Loaded
    ${case}   Get Text   xpath=//div[@id="kt_app_content_container"]//b
    Landing to Menu    Inbox
    Search for Case   Inbox  ${case}

Open CC field
    Click Element  xpath=(//div[@id="kt_app_content_container"]//span[contains(text(), "CC")])[1]

Input CC Email
    Click Element  xpath=//div[@id="form-controll-case_reply.cc"]//div[@class="tags-input"]
    Press Keys   none   ARROW_UP+ENTER
    
Open BCC Field
    Click Element  xpath=(//div[@id="kt_app_content_container"]//span[contains(text(), "BCC")])
    
Input BCC email
    Press Keys   xpath=//div[@id="form-controll-case_reply.bcc"]//tags   ARROW_UP+ENTER

User Able to Input Email CC and BCC
    Page Should Contain Element   xpath=//div[@id="form-controll-case_reply.cc"]//span[@class="tagify__tag-text"]
    Page Should Contain Element   xpath=//div[@id="form-controll-case_reply.bcc"]//span[@class="tagify__tag-text"]

Input Remark with Maximum Characters
    ${text}=    Generate Random Text 2000 Characters
    Input Text   xpath=//div[@id="form-controll-case_reply.reply_remark"]//p      ${text}

Character count display inputted data
    Page Should Contain Element  xpath=//div[@id="kt_app_content_container"]/span   message=there is no character count

Verify on Summary Page
    #Switch Window   New
    Wait Until Element is Visible   xpath=//div[@id="kt_app_content"]//h2[text()="Appeal Details"]    timeout=${SHORT_TIMEOUT}

Landing to Menu 
    [Arguments]   ${menu}
    Click Element   xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="${menu}"]    

Verify User in 
    [Arguments]   ${page}
    Element Should be Visible   xpath=//span[contains(@class, "primary")][text()="${page}"]

User able to Access
    [Arguments]   ${type}
    #Wait Until Element is Visible  xpath=//div[@id="kt_app_content"]//span[text()="${type}"]   timeout=${SHORT_TIMEOUT}
    Page Should Contain Element   xpath=//div[@id="kt_page_title"]/h1[text()="Inbox"]

Case Display under Selected User
    Page Should Contain Element    xpath=//div[@id="kt_app_content"]//span[text()="Allocation Inbox"]
    Page Should Contain Element    css=.table-responsive

Search for Case
    [Arguments]  ${type}     ${case}
    User able to Access     ${type}
    Verify Result Table is Display  
    Input text   xpath=//div[@id="kt_app_content_container"]//input[contains(@class, "search-input")]    ${case} 

Refresh pagination if result not show
    ${status}  Run Keyword and Return Status   Page Should not Contain Element    xpath=(//tr[@class="fw-1"])[2]
    Run Keyword if    '${status}' == 'True'   Refresh Search Result

Refresh Search Result
    Scroll To Bottom Page
    Click Element   css=.next
    Click Element   css=.previous

Select Case to Edit 
    [Arguments]   ${case}
    Wait Until Element is Visible   xpath=//div[@id="kt_app_content"]//div[contains(@class,"underline")]//span[text()="${case}"]
    Click Element  xpath=//div[@id="kt_app_content"]//div[contains(@class,"underline")]//span[text()="${case}"]
    Switch Window   New

Get Driver Name on Notice Summary
    ${driver}   Get text   xpath=(//h2[text()="Driver Details"]//ancestor::div[@class="card card-xxl-stretch"]//div[@class="col"])[1]
    [Return]   ${driver}

Click Edit Case Button
    Verify summary Data is Loaded
    Click Button   xpath=(//div[@id="kt_app_content_container"]//button)[2]
    Wait Until Page Process is Complete

Verify summary Data is Loaded
    Wait Until Element is Visible  xpath=//div[@id="kt_app_content_container"]//b[contains(text(),"0")]     timeout=${SLEEP_TIMEOUT}

Filter Search Funtion Display
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//span[(text()="Date Time Activity")]
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//span[(text()="Activity Type")]
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//span[(text()="Updated By")]

Click on History type  
    [Arguments]   ${type}
    Click Element   xpath=//a[text()="${type}"]/parent::li
    Wait Until Element is Visible   xpath=//a[text()="${type}"][contains(@class, "active")]   timeout=${SHORT_TIMEOUT}

Able to Download history
    File Should Exist       C:\\Users\\QA_Engineer\\Downloads\\history.pdf    message=File has not downloaded

User Able to Submit NOPO to Selected type
    Wait Until Element is Visible   xpath=//div[@class="modal-content"]//b[text()="Success"]   timeout=${LONG_TIMEOUT}
    Page Should Contain    status successfully submited 

User Able to Submit NOPO Functionality
    Wait Until Element is Visible   xpath=//div[@class="modal-content"]//b[text()="Success"]   timeout=${LONG_TIMEOUT}
    Page Should Contain   Apply TS status successfully submited

Select TS Period
    Scroll to Bottom Page
    Click Element   xpath=(//tr[@class="fw-1"]//input)[2]
    Scroll To Top Page

Click NOPO Decision Button
    Click Button    xpath=//span[text()="Select Nopo Decision"]/parent::button

Select NOPO Decision type
    [Arguments]  ${decision}
    Wait Until Element is Visible  xpath=//div[@id="form-controll-undefined"]//div[@class="menu-item"]   timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=//div[@id="form-controll-undefined"]//div[@class="menu-item"]//span[text()="${decision}"]

Click NOPO Decision Submit Button
    Wait Until Element is Enabled  xpath=(//div[@id="form-controll-undefined"]//button[@id="button-id-Submit"])[1]    timeout=${MEDIUM_TIMEOUT}
    Click Button                   xpath=(//div[@id="form-controll-undefined"]//button[@id="button-id-Submit"])[1]  

Click NOPO Funcationality Submit Button
    Wait Until Element is Enabled  xpath=(//div[@id="form-controll-undefined"]//button[@id="button-id-Submit"])[2]    timeout=${MEDIUM_TIMEOUT}
    Click Button                   xpath=(//div[@id="form-controll-undefined"]//button[@id="button-id-Submit"])[2]

Click Functional Button
    Click Button    xpath=//span[text()="Select Functionality"]/parent::button

Select Functionality Type   
    [Arguments]  ${decision}
    Wait Until Element is Visible  xpath=//div[@id="form-controll-undefined"]//div[@class="menu-item"]   timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=//div[@id="form-controll-undefined"]//div[@class="menu-item"]//span[text()="${decision}"]

Verify Confirmation Submit Data
    Wait Until Element is Visible   xpath=//div[text()="Confirmation"]  timeout=${MEDIUM_TIMEOUT}
    CLick Button On  Ok
    Wait Until Element is Visible   xpath=//b[text()="Success"]  timeout=${LONG_TIMEOUT}
    Click Button on   Ok Got it
    #${Decision}   Get Text   xpath=(//tr[@class="fw-1"]//td)[5]/span
    #Set Test Variable   \${Decision}   ${Decision}

Click Select Functionality Submit Button
    Wait Until Element is Enabled   xpath=(//span[text()="Submit"]//ancestor::button)[3]     timeout=${MEDIUM_TIMEOUT}
    Click Button   xpath=(//span[text()="Submit"]//ancestor::button)[3]

User See Error Message NOPO not Selected
    Page Should Contain   Please select at least one notice

User Try to Access Allocation Inbox
    Run Keyword and Expect Error   STARTS: Element  Click Element   xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="Allocation Inbox"]

Allocation Inbox not Display
    Page Should not Contain Element   xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="Allocation Inbox"] 

User Cannot Access Allocation Inbox
    Page Should not Contain Element   xpath=//div[@id="kt_app_content_container"]//span[text()="Allocation Inbox"] 
    Location Should be      ${PLUSADMIN}
    User Want to Login using selected User   OIC 1   #!Gonna delete when login feature is ready

User Cannot Select Same Work Area
    Scroll To Bottom Page
    ${text1}=    Get text   xpath=(//div[@class="table-responsive"]//span)[6]  
    Page Should not Contain Element   xpath=(//div[@class="table-responsive"]//span[text()="${text1}"])[2]       message=Still Able Select Same Work Area

Able to Edit Appellant
    ${name}   Get Text    xpath=(//div[@class="flex-grow-1 me-2"]//a)[1]
    Should not be equal    ${name}   ${firstcust}

Alert Message Should Display
    Element Should be Visible   xpath=//span[@class="alert-msg text-danger"][text()="Identity Number is not valid"]    message=Error Message Not Display

User Want Delete Work Area
    Scroll To Bottom Page
    Click Button on   Delete
    Click Button on   Delete

Select Case on Green Tag
    Click Button   xpath=(//div[@id="kt_app_content_container"]//button)[2]
    Wait Until Element is Visible  xpath=(//div[@class="table-responsive"]//i[contains(@class, "success")])[1]   timeout=${LONG_TIMEOUT}
    Click Element  xpath=(//div[@id="kt_app_content"]//div[contains(@class,"underline")])[1]
    Switch Window  New

Click Added References Case
    Click Element   xpath=//tr[@class="fw-1"]//div[contains(@class,"primary")]/span

Verify Data is Updated
    Verify Summary Data Is Loaded
    Scroll Element Into View   xpath=//p[text()="Relation with Vehicle Owner"]
    ${name}    Get Text     xpath=(//h2[text()="Driver Details"]//ancestor::div[contains(@class,"card")]//b)[1]
    Should Be Equal    ${AppellentName}    ${name}                  message=Driver data is not Updated

Verify Data is Not Updated 
    Verify Summary Data Is Loaded
    Scroll Element Into View   xpath=//p[text()="Relation with Vehicle Owner"]
    ${name}    Get Text     xpath=(//h2[text()="Driver Details"]//ancestor::div[contains(@class,"card")]//b)[1]
    Should not Be Equal    ${EMPTY}     ${name}



#! PLUS 15
User Already Login
    Page Should Not Contain Element   xpath=//div[@id="kt_app_toolbar_container"]//span[text()="Select User"]
    Page Should Contain Element   xpath=//div[@id="kt_app_toolbar_container"]//span[text()="OIC 1" or "Zulfi" or "Steven" or "Lateph" or "Jenny"]

Landing on Personal Inbox
    Page Should Contain Element   xpath=//div[@id="kt_page_title"]/h1[text()="Inbox"]
    Page Should Contain Element   xpath=//div[@id="kt_app_content"]//span[text()="Case Inbox"]
    Verify Result Table is Display  

Landing to Auto Reply Inbox
    Click Element   xpath=(//span[text()="Inbox"]//ancestor::div[@class="menu-item"])[2]

Traffic Light Indicator Display
    Page Should Contain Element   xpath=//div[@id="kt_app_content_container"]//button[contains(@class,"danger")]
    Page Should Contain Element   xpath=//div[@id="kt_app_content_container"]//button[contains(@class,"warning")]
    Page Should Contain Element   xpath=//div[@id="kt_app_content_container"]//button[contains(@class,"success")]

Court Case Type Will be On top of Inbox
    Verify Result Table is Display  
    Element Should be Visible   xpath=(//tr[@class="fw-1"])[1]//i[contains(@class, "building-columns")]

Display Table Contain Column
    [Arguments]    ${column}
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//span[text()="${column}"]

User Landing on Selected Inbox
    [Arguments]   ${inbox}
    #Page Should Contain Element   xpath=//div[@id="kt_page_title"]/h1[text()="Inbox"]
    Page Should Contain Element   xpath=//div[@id="kt_app_content"]//span[text()="${inbox}"]
    #${location}      Get Location
    #Should be Equal  ${location}   ${PLUSADMIN}#/${inbox}

Verify location is on Summary
    [Arguments]  ${num}
    ${location}       Get Location
    Should be Equal   ${location}    ${PLUSADMIN}icases/summary/${num}

Case Attach with Draft Mark
    [Arguments]   ${case}
    Page Should Contain Element   xpath=//span[text()="${case}"]//ancestor::td//child::span[text()="Draft"]

Get Create Case Number
    ${case}    Get text    xpath=(//div[@id="kt_app_content_container"]//b)[1]
    [Return]   ${case}

Draft Mark not attached to cases
    [Arguments]   ${case}
    Page Should Not Contain Element   xpath=//span[text()="${case}"]//ancestor::td//child::span[text()="Draft"]

Choose Case Date Filter on Allocation Inbox
    Click Element    xpath=//div[@class="bg-input-white"]//input
    Wait Until Element is Visible    css=.flatpickr-day.today     timeout=${MEDIUM_TIMEOUT}
    Click Element    css=.flatpickr-day.today

Get Random Index of Inbox Column
    Wait Until Element is Visible    xpath=//div[@class="table-responsive"]//i[contains(@class, "arrow")]   timeout=${MEDIUM_TIMEOUT}
    ${count}    Get Element Count    xpath=//div[@class="table-responsive"]//i[contains(@class, "arrow")]
    ${index}   Generate Random Number       ${count}
    [Return]    ${index}

Click On Selected Inbox Column by Index
    [Arguments]   ${index}
    Click Element   xpath=(//div[@class="table-responsive"]//i[contains(@class, "arrow")])${index}

Able to Sort out Any Menu in the Page
    [Arguments]   ${index}
    Verify Result Table is Display  
    Run Keyword If   ${index} == 1   Element Text Should Be    xpath=(//td[@class="is-block-mobile"])[2]//span  ${EMPTY}
    ...     ELSE IF  ${index} == 2   Page Should not Contain Element   xpath=(//td[@class="is-block-mobile"])[3]//span/i
    ...     ELSE IF  ${index} == 3   Element Text Should Be    xpath=(//td[@class="is-block-mobile"])[4]//span  0101230500002
    ...     ELSE IF  ${index} == 4   Element Text Should Be    xpath=((//td[@class="is-block-mobile"])[5]//span)[2]  C-
    ...     ELSE IF  ${index} == 5   Page Should Contain Element   xpath=(//td[@class="is-block-mobile"])[6]//div[contains(text(),"Appellant indicated")]
    ...     ELSE   Days Left Column Sorting

Days Left Column Sorting
    ${Num}    Get Text    xpath=((//td[@class="is-block-mobile"])[7]//span)[1]
    Should be True   ${Num}  <7

Filter Case By Traffic Light Red
    Page Should Contain Element        xpath=//i[contains(@class,"danger")]         error=Page not contain Red cases
    Page Not Contain Yellow Cases
    Page Not Contain Green Cases
Filter Case By Traffic Light Yellow
    Page Should Contain Element        xpath=//i[contains(@class,"warning")]        error=Page not contain Yellow cases
    Page Not Contain Red Cases
    Page Not Contain Green Cases

Filter Case By Traffic Light Green
    Page Should Contain Element        xpath=//i[contains(@class,"success")]        error=Page not contain Green cases
    Page Not Contain Red Cases
    Page Not Contain Yellow Cases

Page Not Contain Red Cases
    Page Should Not Contain Element    xpath=//i[contains(@class,"danger")]         error=Page still contain Red cases
Page Not Contain Yellow Cases
    Page Should Not Contain Element    xpath=//i[contains(@class,"warning")]        error=Page still contain Yellow cases
Page Not Contain Green Cases
    Page Should Not Contain Element    xpath=//i[contains(@class,"success")]        error=Page still contain Green cases

Select Traffic Light Green Indicator
    Wait Until Element is Visible   xpath=//div[@class="position-relative"]/button  timeout=${SHORT_TIMEOUT}
    Click Button   xpath=(//div[@class="position-relative"]/button)[2]
    
Select Traffic Light Red Indicator
    Wait Until Element is Visible   xpath=//div[@class="position-relative"]/button  timeout=${SHORT_TIMEOUT}
    Click Button   xpath=(//div[@class="position-relative"]/button)[4]

Select Traffic Light Yellow Indicator
    Wait Until Element is Visible   xpath=//div[@class="position-relative"]/button  timeout=${SHORT_TIMEOUT}
    Click Button   xpath=(//div[@class="position-relative"]/button)[3]

Scroll to Created Case
    [Arguments]    ${case}
    Verify Result Table is Display  
    Scroll Element Into View   xpath=//div[@id="kt_app_content"]//div[contains(@class,"underline")]//span[text()="${case}"]

Red coloring-code display on Case
    Verify Result Table is Display  
    Wait Until Element is Visible    xpath=//div[@class="table-responsive"]//i[contains(@class,"circle")]   timeout=${MEDIUM_TIMEOUT}
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//i[contains(@class,"circle")][contains(@class,"danger")]    message=Case not mark as urgent

Filter Case by Red Indicator
    Click Button   xpath=(//div[@class="position-relative"]/button)[4]

Case Marked Court Display
    Page Should Contain Element   xpath=(//div[@class="table-responsive"]//i[contains(@class, "columns")])[1]

Able to Access Case Details
    Element Should Be Visible   xpath=//div[@id="kt_page_title"]/h1[text()="Edit Appeal"]   timeout=${MEDIUM_TIMEOUT}

Search Result Displayed
    [Arguments]    ${case}
    Verify Result Table is Display  
    Page Should Contain  ${case}

Search Result Show no Records
    Wait Until Element is Visible    xpath=//div[@class="table-responsive"]//div[text()="No records to display"]   timeout=${MEDIUM_TIMEOUT}

Click Advance Search
    Click Element  xpath=//div[@id="kt_app_content_container"]//a[text()="Advanced Search"]

Choose ID Type on Advance Search using
    [Arguments]    ${type}
    Click Button on  ID Type
    Wait Until Element is Visible   xpath=//div[@id="form-controll-customer.id_type"]//a   timeout=${SHORT_TIMEOUT}
    Click Element    xpath=//span[text()="${type}"]/parent::a

Input Identity Number on Advance Search using
    [Arguments]    ${num}
    Input text     xpath=//div[@id="form-controll-identity_no"]//input   ${num}

Verify Result Table is Display
    Wait Until Element is Visible   xpath=//tr[@class="fw-1"]  timeout=${LONG_TIMEOUT}

Advance Search Result ID Number Valid
    ${text}   Get Text     xpath=//p[text()="NRIC/FIN/Passport Number"]/parent::div//following-sibling::div/b
    Should be Equal  ${text}   ${NRIC}

User Advance Search using Role Code
    [Arguments]   ${code}
    Verify Result Table Is Display  
    Click Advance Search
    Input text    xpath=//div[@id="form-controll-rule_code"]//input     ${code}
    Click Button On    Apply

User Advance Search using NOPO Number
    Click Advance Search
    Input text    xpath=//div[@id="form-controll-notice_no"]//input    241000037B
    Click Button On    Apply

User Advance Search using Summon Number
    Click Advance Search
    Input text    xpath=//div[@id="form-controll-summons_no"]//input    CASE123456/2021
    Click Button On    Apply

User Advance Search using Non Existing Data
    Click Advance Search
    Input text    xpath=//div[@id="form-controll-summons_no"]//input    CASE
    Click Button On    Apply

Verify Profile Data is Loaded
    Wait Until Element is Visible   xpath=//div[@id="form-controll-case_type"]//span[text()="A - Appeal"]   timeout=${SHORT_TIMEOUT}

#PLUS 17
NOPO Decision Drop Down Button Contains
    [Arguments]  ${decision}
    Element Should be Visible  xpath=//div[@id="form-controll-undefined"]//span[text()="${decision}"]

Able to Select Decision
    [Arguments]   ${decision}
    Element should be Visible   xpath=(//div[@id="form-controll-undefined"]//span)[text()="${decision}"]

Able to Select Nopo Functionality
    [Arguments]   ${func}
    Scroll To Top Page
    Element should be Visible   xpath=//div[@id="form-controll-undefined"]//span[text()="${func}"]

User Want to edit Number of days
    [Arguments]   ${num}
    Input text    xpath=(//tr[@class="fw-1"]//input[@type="text"])[1]   ${num}

Able to edit suspension number of days
    [Arguments]   ${num}
    Page Should Contain Element   xpath=//tr[@class="fw-1"]//input[@type="text"][@value="${num}"]

unable to input number of days with non Numberical
    [Arguments]   ${num}
    Page Should not Contain Element   xpath=//tr[@class="fw-1"]//input[@type="text"][@value="${num}"]

User Want to Input Remarks on NOPO processing
    [Arguments]  ${word}
    Input text    xpath=(//tr[@class="fw-1"]//input[@type="text"])[2]      ${word}

Able to input remarks on NOPO Processing
    [Arguments]  ${word}
    Page Should Contain Element   xpath=//tr[@class="fw-1"]//input[@type="text"][@value="${word}"]

User Want to Input PS suspension remark
    [Arguments]  ${word}
    Input text    xpath=//tr[@class="fw-1"]//input    ${word}

Able to Input PS suspension remark
    [Arguments]  ${word}
    Text field value should be    xpath=//tr[@class="fw-1"]//input    ${word}


Select Notice to Apply Processing
    [Arguments]   ${notice}
    Wait Until Page is Completely Loaded
    Click Element   xpath=//span[text()="${notice}"]//ancestor::tr//input[@type="checkbox"]

Failed to TS-ing Notice on PS-State
    Wait Until Element is Visible   css=.modal-content    timeout=${MEDIUM_TIMEOUT}
    Element Text Should Be      xpath=//div[@class="modal-content"]//span    Notice already in Permanent Suspend, cannot be processed

Able to Multiple Notice to TS-ing
    Verify Page Title is    Edit Appeal
    Page Should Contain Element   xpath=//tr[@class="fw-1"]//span[text()="${NOPOTS}"]
    Page Should Contain Element   xpath=//tr[@class="fw-1"]//span[text()="${NOPOTS2}"]

Select suspension code on PLUS
    [Arguments]  ${reason}   
    Click Element   xpath=(//tr[@class="fw-1"]//button)[1]
    Input Text      xpath=//tr[@class="fw-1"]//input        ${reason}
    Click Element   xpath=//tr[@class="fw-1"]//span[text()="${reason}"]/parent::a

Unable to apply PS
    Element Should be disabled   xpath=(//div[@id="form-controll-undefined"]//button)[4]

Prompt message error display
    [Arguments]   ${msg}
    Element should be visible   xpath=//div[@class="modal-content"]//div[text()="${msg}"]

Verify History is Update
    ${d}   Get Text   xpath=(((//span[text()="Functionality"])[2]//ancestor::div[@class="table-responsive"]//tr)[2]//span)[2]
    ${date}   Fetch from Left   ${d}   ,
    ${tdate}  Get Today's Date
    Should be Equal   ${date}   ${tdate}

Edit Button Should be disable
    Element should be disabled    id=button-id-Edit

Selected notice still on suspension State
    [Arguments]  ${state}
    Scroll To Bottom Page
    Page Should Contain Element    xpath=//tr[@class="fw-1"]//span[text()="${state}"]


Verify notice not in stage
    [Arguments]  ${stage}
    Page Should not contain element    xpath=(//tr[@class="fw-1"]//span)[3][text()="${stage}"]

Notice not under suspension status
    [Arguments]   ${status}
    Page Should not Contain Element  xpath=(//tr[@class="fw-1"]//span)[9][text()=" ${status}"]

Success apply TS to TS-ed Notice
    [Arguments]   ${num}
    Wait Until Element is Visible   xpath=//b[@class="fs-3"][text()="Success"]   timeout=${LONG_TIMEOUT}
    Page Should Contain Element     xpath=//div[@class="modal-content"]//li[text()="${num}"]
    Page Should Contain Element     xpath=//div[@class="modal-content"]//li[text()="status successfully submited"]

Success to apply Suspension on Selected Notice 
    [Arguments]   ${num}  ${text}
    Prompt message success is display
    Page Should Contain Element     xpath=//div[@class="modal-content"]//li[text()="${num}"]
    Page Should Contain Element     xpath=//div[@class="modal-content"]//li[text()="${text}"]

Prompt message success is display
    Wait Until Element is Visible   xpath=//b[@class="fs-3"][text()="Success"]   timeout=${LONG_TIMEOUT}

unable to input number of days with
    Textfield value should be     xpath=//tr[@class="fw-1"]//input[@type="number"]   ${EMPTY}

Unable to input remark reason with many characters
    ${a}   Get Value      xpath=//tr[@class="fw-1"]//input[@type="text"] 
    Should not be Equal   ${text}   ${a}

Verify Notice is on stage
    [Arguments]    ${notice}     ${stage} 
    Page Should Contain Element  xpath=(//span[text()="${notice}"]//ancestor::tr//span[text()="${stage}"])[1]
