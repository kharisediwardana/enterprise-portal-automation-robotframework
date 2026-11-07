***Keywords***
Verify Portal Logo is Loaded
    Wait Until element is visible  id=kt_app_sidebar_logo    timeout=${MEDIUM_TIMEOUT}

Verify Page have Create Notice Side Bar Menu
    Page Should Contain element   id=#kt_app_sidebar_menu

Open Side Bar Menu Drop Down
    [Arguments]   ${menu}
    Wait until element is visible    xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="${menu}"]  timeout=${MEDIUM_TIMEOUT}
    Click element   xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="${menu}"]

Open Side Bar Menu
    [Arguments]  ${menu}
    Wait Until element is Visible  xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="${menu}"]/parent::a  timeout=${SHORT_TIMEOUT}
    Click Element  xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="${menu}"]/parent::a

Verify Page Title is
    [Arguments]  ${title}
    Wait Until Element is Visible   xpath=//div[@id="kt_page_title"]//h1[text()="${title}"]   timeout=60

Verify Page Contains Field 
    [Arguments]   ${field}
    Page Should Contain Element   xpath=//div[@id="kt_app_content_container"]//label[text()="${field}"]/parent::div


Select Registration Type 
    [arguments]  ${type}
    Click Button   xpath=//div[@id="form-controll-vehicle_registration_type"]//button
    Wait Until Element is Visible    xpath=//span[text()="${type}"]   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=//span[text()="${type}"]

Input Vehicle Number   
    [Arguments]  ${num}
    Input Text    xpath=//div[@id="form-controll-vehicle_no"]//input    ${num}

Select Vehicle Category
    [arguments]  ${type}
    Click Button   xpath=//div[@id="form-controll-vehicle_category"]//button
    Wait Until Element is Visible   xpath=//div[@id="form-controll-vehicle_category"]//span[text()="${type}"]   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=//div[@id="form-controll-vehicle_category"]//span[text()="${type}"]

Input Vehicle Category
    Click Element   xpath=//div[@id="form-controll-vehicle_category_data"]//button
    Wait Until Element is Visible   xpath=(//div[@id="form-controll-vehicle_category_data"]//div[@class="menu-item"])[1]   timeout=${SHORT_TIMEOUT}
    Click Element   xpath=(//div[@id="form-controll-vehicle_category_data"]//div[@class="menu-item"])[1]

Input Vehicle Maker
    [Arguments]     ${name}
    Input Text    xpath=//div[@id="form-controll-vehicle_make"]//input    ${name}

Input Vehicle Color
    [Arguments]     ${name}
    Input Text    xpath=//div[@id="form-controll-vehicle_color"]//input    ${name}

Select Road Text Expiry
    Click Element   xpath=//div[@id="form-controll-vehicle_road_tax_expiry"]//input
    Wait Until Element is Visible   css=.flatpickr-day.today   timeout=${SHORT_TIMEOUT}
    Click Element   css=.flatpickr-day.today

Select Offence Date
    Click element   xpath=//div[@id="form-controll-o_offence_date"]//input
    Wait Until Element is Visible        xpath=(//span[@class="flatpickr-day today"])[2]   timeout=${SHORT_TIMEOUT}
    Click Element   xpath=(//span[@class="flatpickr-day today"])[2]  # [4]

Select Offence Date Today
    Click Element  xpath=(//span[@class="flatpickr-day today"])[4]

Input Notice Offence Time
    ${num}   Generate Random Time
    Click Element      xpath=//div[@id="form-controll-o_offence_time"]//input
    Input Text         css=.numInput.flatpickr-hour    0${num}

Select Rule Infernged
    Click Element   xpath=(//div[@id="form-controll-o_rule_infringed_code"]//input)[1]
    Wait Until Element is Visible   xpath=(//div[@id="form-controll-o_rule_infringed_code"]//div[@class="menu-item"]/a)[1]  timeout=${SHORT_TIMEOUT}
    Click Element   xpath=(//div[@id="form-controll-o_rule_infringed_code"]//div[@class="menu-item"]/a)[1] 
    

Select POID
    Click Element   xpath=((//div[@id="form-controll-o_warden_no"])//input)
    Wait Until Element is Visible  xpath=((//div[@id="form-controll-o_warden_no"])//div[@class="menu-item"]/a)[2]  timeout=${SHORT_TIMEOUT}
    Click Element   xpath=((//div[@id="form-controll-o_warden_no"])//div[@class="menu-item"]/a)[2]       

Select Place of Offence
    Click Element   xpath=((//div[@id="form-controll-o_pp_code"])//input)[1]
    Wait Until Element is Visible   xpath=((//div[@id="form-controll-o_pp_code"])//div[@class="menu-item"]/a)[1]   timeout=${SHORT_TIMEOUT}
    Click Element   xpath=((//div[@id="form-controll-o_pp_code"])//div[@class="menu-item"]/a)[1]    

Select Composition Amount
    Click on Composition Amount Field
    Wait Until Element is Visible   xpath=(//div[@id="form-controll-o_composition_amount"]//div[@class="menu-item"]/a)[1]   timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=(//div[@id="form-controll-o_composition_amount"]//div[@class="menu-item"]/a)[1]   

Click on Composition Amount Field
    Scroll to Section   Batch Details
    Click Button   xpath=//div[@id="form-controll-o_composition_amount"]//button

Composition Amount Contain Value
    [Arguments]   ${value}
    Element Should be Visible   xpath=//div[@id="form-controll-o_composition_amount"]//span[@class="menu-title"][text()="${value}"]

Amount value should be
    [arguments]  ${value}
    ${amount}  Get Element Count   xpath=//div[@id="form-controll-o_composition_amount"]//span[@class="menu-title"]
    ${count}   Convert to String   ${amount}
    Should be Equal     ${count}   ${value}

Select Administration Fee
    Click Button   xpath=//div[@id="form-controll-o_administration_fee"]//button
    Wait Until Element is VIsible   xpath=(//div[@id="form-controll-o_administration_fee"]//a)[1]   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=(//div[@id="form-controll-o_administration_fee"]//a)[1]   

Select Surcharge Fee
    Click Button   xpath=//div[@id="form-controll-o_surcharge_fee"]//button
    Wait Until Element is VIsible   xpath=(//div[@id="form-controll-o_surcharge_fee"]//a)[1]   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=(//div[@id="form-controll-o_surcharge_fee"]//a)[1]

Select Incentive Payment Date
    Click Element   xpath=//div[@id="form-controll-o_incentive_payment_date"]//input
    Click Element   xpath=(//span[@class="flatpickr-day today"])[2]     #[4]

Select Incentive Payment
    Click Button   xpath=//div[@id="form-controll-o_incentive_payment_amount"]//button
    Wait Until Element is VIsible   xpath=(//div[@id="form-controll-o_incentive_payment_amount"]//a)[1]   timeout=${SHORT_TIMEOUT}
    Click Element  xpath=(//div[@id="form-controll-o_incentive_payment_amount"]//a)[1]  

Input Parking Lot
    Input text   xpath=//div[@id="form-controll-o_parking_lot_no"]//input     1

Input Due Date Revival
    Click Element   xpath=//div[@id="form-controll-o_revival_due_date"]//input
    Click Element   xpath=(//span[@class="flatpickr-day today"])[2]     #[4]

Select Batch Date
    Click Element   xpath=//div[@id="form-controll-batch_date"]//input
    Wait Until Element is Visible   xpath=(//span[@class="flatpickr-day today"])[1]   timeout=${SHORT_TIMEOUT}
    Click Element   xpath=(//span[@class="flatpickr-day today"])[1]

Input Notice Rule Remark
    Input text   xpath=//div[@id="form-controll-o_remark"]//input   ${Rremarks}

Input Notice Remark
    Input text   xpath=//div[@id="form-controll-o_remark"]//textarea   ${remark}

Upload Notice Attachment with
    [Arguments]  ${file}
    Scroll to Section   Batch Details
    Choose File   id=file-upload  ${file}
    
Input Batch Number
    Input text   xpath=//div[@id="form-controll-batch_no"]//input     1

Verify Modal Window Visible
    Wait Until Element is Visible   css=.modal-content  timeout=${MEDIUM_TIMEOUT}

Verify Modal Window Visible e-service
    Wait Until Element is Visible   css=.sgds-modal-card  timeout=${MEDIUM_TIMEOUT}

Modal Window Text is    
    [Arguments]   ${text}
    Wait Until Element is Visible   css=.modal-content    timeout=${LONG_TIMEOUT}
    Element Text Should Be      xpath=//div[@class="modal-content"]//p    ${text}

Error Message Empty Mandatory Field not Display
    Element Should not be Visible   xpath=//div[@class="fv-plugins-message-container invalid-feedback"]
    Element Should not be Visible   xpath=//span[@class="alert-msg text-danger"]

Registration type is cleared
    ${value}  Get text  xpath=//div[@id="form-controll-vehicle_registration_type"]//button
    Should not be Equal     ${value}    S - LOCAL
Vehicle Number is cleared
    Textfield Value Should be   xpath=//div[@id="form-controll-vehicle_no"]//input    ${EMPTY}
Vehicle Category is cleared
    ${value}  Get text  xpath=//div[@id="form-controll-vehicle_category"]//button
    Should not be Equal     ${value}    C - Car
Vehicle Maker is cleared
    Textfield Value Should be   xpath=//div[@id="form-controll-vehicle_make"]//input    ${EMPTY}
Vehicle Color is cleared
    Textfield Value Should be   xpath=//div[@id="form-controll-vehicle_color"]//input    ${EMPTY}
Vehicle road tax expiry is cleared
    Textfield Value Should be   xpath=//div[@id="form-controll-vehicle_road_tax_expiry"]//input    ${EMPTY}
IU Number is Cleared
    Textfield Value Should be   xpath=//div[@id="form-controll-iu_no"]//input    ${EMPTY}

Remarks Character Count Display
    [Arguments]  ${max}
    ${count}   Get Text  xpath=//div[contains(@id, "remark")]//span     
    Should not be equal     ${max}     ${count}
    
Able to Input Data by Select drop-down list
    ${value}  Get text  xpath=//div[@id="form-controll-vehicle_registration_type"]//button
    Should be Equal     ${value}    V - VIP

Value auto added
    ${value}  Get Value  xpath=//div[@id="form-controll-o_warden_name"]//input
    Should be Equal     ${value}    Dummy

Error Invalid Data Display  
    [arguments]   ${text}
    Wait Until Element is Visible      xpath=//div[@class="fv-plugins-message-container invalid-feedback"]/div[text()="${text}"]   timeout=${SHORT_TIMEOUT}

Input IU number with 
    [arguments]   ${num}
    Scroll to Section     Notice of Parking Offence Details
    Input text  xpath=//div[@id="form-controll-iu_no"]//input   ${num}

Error Invalid Data not Display
    [arguments]   ${text}
    Element Should not be Visible    xpath=//div[@class="fv-plugins-message-container invalid-feedback"]/div[text()="${text}"]

Attached file dispay on List
    Page Should Contain Element   xpath=//div[@id="kt_ecommerce_add_product_media"]//div[@class="ms-4"]

Download CSV Template
    Wait Until element is Visible   xpath=//div[@id="kt_app_content_container"]//a    timeout=${SHORT_TIMEOUT}
    Click Element   xpath=//div[@id="kt_app_content_container"]//a

Able to Download CSV file Template
    Wait Until Created  C:\\Users\\QA_Engineer\\Downloads\\Create-Parking-Offence-Notices-Template.csv     timeout=${MEDIUM_TIMEOUT}
    File Should Exist   C:\\Users\\QA_Engineer\\Downloads\\Create-Parking-Offence-Notices-Template.csv
    Remove file         C:\\Users\\QA_Engineer\\Downloads\\Create-Parking-Offence-Notices-Template.csv

Able to Download CSV Search Template
    Wait Until Created  C:\\Users\\QA_Engineer\\Downloads\\Search-Notices-Template.csv     timeout=${MEDIUM_TIMEOUT}
    File Should Exist   C:\\Users\\QA_Engineer\\Downloads\\Search-Notices-Template.csv
    Remove file         C:\\Users\\QA_Engineer\\Downloads\\Search-Notices-Template.csv

Verify CSV is Attached
    [Arguments]     ${doc}
    Page Should Contain     ${doc}

Remove File if Attached
    ${status}   Run Keyword and Return Status    Verify CSV is Attached
    Run Keyword if    '${status}' == 'True'      Reload Page   #Remove CSV Attached File
    
Remove CSV Attached File
    Click Element    xpath=//span[text()="createNotice.csv"]
    Modal Window Text is    No file are select.
    Click Button on   Ok Got it

User Upload Attached CSV File
    Double Click Element    xpath=//span[text()="Upload"]//ancestor::button

Page Contain Step to CSV File Upload
    Page Should Contain             Step 1. Download CSV Template
    Page Should Contain             Step 2. Please fill the CSV file
    Page Should Contain             Step 3. Upload CSV

Summary notice review Display
    Verify Page Title is  Upload Preview
    Page Should Contain Element  xpath=//tr[@class="fw-1"]//span[text()="2023-05-30 15:25"]         Error=Page Doesnt Contain Offence Date Notice
    Page Should Contain Element  xpath=//tr[@class="fw-1"]//span[text()="10700"]                    Error=Page Doesnt Contain Rule Infernged
    Page Should Contain Element  xpath=//tr[@class="fw-1"]//span[text()="O"]

Description single notice uploaded display
    Verify Page Title is  Upload Preview
    Summary notice review Display
    Page Should not Contain Element   xpath=(//tr[@class="fw-1"])[2]                                Error=Page Contains Multiple Notices

Description Multiple notice uploaded display
    Verify Page Title is  Upload Preview
    Summary notice review Display
    Page Should Contain Element   xpath=(//tr[@class="fw-1"])[2]                                Error=Page Only Contain Single Notice

Failed upload record display
    Verify Page Title is  Upload Preview
    Scroll To Bottom Page
    Page Should Contain    Rule infringed code is require...

Verify Notice Number
    ${num}   Get text  xpath=(//p[text()="Offence Notice No."]/following::b)[1]
    Should not be Equal     ${num}    -
    Set Suite Variable     \${createdNotice}    ${num}    

Verify Search notice is Created notice
    ${date}    Get text   xpath=(//div[@class="table-responsive"]//td)[4]/span 
    ${d}  Fetch from left   ${date}   /2023
    ${today}   Get Date for Today
    ${t}  Fetch from left   ${today}   /2023
    Should be Equal   ${d}   ${t}

Select Notice to Edit
    [Arguments]   ${notice}
    Click Element   xpath=//tr[@class="fw-1"]//span[text()="${notice}"]/parent::div
    Switch Window   New

Summary not showed any notice data
    Verify Page Title is  Upload Preview
    Page Should Contain   Error have found no notices pass
    Page Should not Contain Element   css=fw-1


Verify Page is Loaded
    Wait Until Element is Visible    id=kt_app_sidebar_logo    timeout=${MEDIUM_TIMEOUT}

Verify on Menu
    [Arguments]    ${title}
    Verify Page is Loaded 
    Click Element     xpath=//div[@class="menu-item"]//span[text()="${title}s"]
    Verify Notice Title Page    ${title}

Verify Notice Title Page
    [Arguments]    ${title}
    Wait Until Element is Visible   xpath=//div[@id="kt_page_title"]/h1[text()="${title}"]    timeout=${MEDIUM_TIMEOUT}

Click Notice Edit Button
    Click Button    xpath=(//span[text()="Edit"]//ancestor::button)[2]


Inpur Driver Name
    ${name}      Generate Random Name
    Input text   xpath=//div[@id="form-controll-driver_name"]//input     ${name} 
Input Driver ID Number
    [Arguments]   ${num}
    Input text   xpath=//div[@id="form-controll-driver_identity_no"]//input     ${num}
Input Driver Phone Number
    Input text   xpath=//div[@id="form-controll-driver_mobile_no"]//input       123456789
Input Driver Email
    ${email}     Generate Random Email
    Input text   xpath=//div[@id='form-controll-["driver_emails"][0]["email"]']//input     ${email} 
Input Postal Code
    Input Text    xpath=//div[@id="form-controll-driver_reg_postal_code"]//input     ${PostalCode}
    Click Button   xpath=//div[@id="form-controll-driver_reg_postal_code"]//button
Select Driver Relation
    Click Button   xpath=//div[@id="form-controll-driver_relation_owner"]//button
    Click Element   xpath=(//div[@id="form-controll-driver_relation_owner"]//div[@class="menu-item"])[1]

    

Copy Notice Mailing Address from Registered Address
    Click Element   xpath=//div[@id="form-controll-driver_mail_is_reg_address"]//input

Submit Created Notice
    Scroll To Top Page
    Click Button on    Save
    Verify Notice is Submited
    
Verify Notice is Submited
    Wait Until Element is Visible    css=.modal-content    timeout=${LONG_TIMEOUT}
    Click Button on    Ok

Verify Submit Notice is Success
    Wait Until Element is visible    xpath=//i[contains(@class, "success")]   timeout=${MEDIUM_TIMEOUT}
    Page Should Contain    Your notice has been successfully submitted.
    Click Button on  Ok Got it
    ${number}   Get Notice Number
    [Return]    ${number}

Get Notice Number
    Wait Until Element is Visible    xpath=(//b[@class="fs-14px"])[1][contains(text(),"0")]   timeout=${SLEEP_TIMEOUT}
    ${noticenumber}     Get text    xpath=(//div[@id="kt_app_content_container"]//b)[1]
    [Return]  ${noticenumber}

#OCMS 17
Landing on Notices Page
    Mouse Over     xpath=(//img[@alt="Logo"])[3]
    Wait Until Element is Visible   id=#kt_app_sidebar_menu  timeout=${MEDIUM_TIMEOUT}

User Click on Tab
    [Arguments]   ${tab}
    Click Element  xpath=//div[@id="#kt_app_sidebar_menu"]//span[text()="${tab}"]

Verify Drop Down is Loaded
    [Arguments]  ${text}
    Wait Until Element is Visible   xpath=(//button[text()="ID Type"]//ancestor::div[contains(@class,"sub-dropdown")]//a)[1]  timeout=${SHORT_TIMEOUT}

Search Category  
    [Arguments]   ${type}
    Element Should be Visible   xpath=//div[@id="kt_app_content_container"]//span[text()="${type}"]

Search Using ID Number
    Element Should be Visible   id=form-controll-id_number

Search Advance Computer Rule Display
    Element Should be Visible  id=form-controll-computer_rule_code

Search Advance Court Mention Date Display
    Element Should be Visible  id=form-controll-court_mention_date

Search Advance NTAC
    Element Should be Visible  id=form-controll-ntac

User Want see Advance Search
    Landing on View Notices Tab
    Verify Result Table is Display  
    Click Element   xpath=//a[text()="Advanced Search"]
    Wait Until Element is visible   xpath=//div[text()="Advanced Search"]//parent::div   timeout=${SHORT_TIMEOUT}

Close Advance Search Dropdown
    Click Element   id=form-controll-id_number

Search Notice Using 
    [Arguments]   ${type}
    Click Element   xpath=//div[@id="kt_app_content_container"]//span[text()="${type}"]/parent::a
    Wait Until Element is Visible   xpath=//div[@id="kt_app_content_container"]//button[text()="${type}"]

Input Search Using Number
    [Arguments]   ${num}
    Input Text   xpath=//div[contains(@id,"form-controll-")]//input[contains(@placeholder,"Type")]   ${num}

Input Search Using Vehicle Number
    [Arguments]   ${num}
    Input Text   xpath=//div[@id="form-controll-vehicle_no"]//input   ${num}

Verify Search Result is Correct
    [Arguments]  ${Num}
    Wait Until Element is Visible      xpath=//tr[@class="fw-1"]//span[text()="${Num}"]     timeout=${SHORT_TIMEOUT}   

Search Result using CSV display Correctly
    [Arguments]   ${Num1}  ${Num2}  ${Num3}
    Verify Result Table is Display  
    Page Should Not Contain Element  xpath=(//tr[@class="fw-1"])[4]
    Element Should be Visible  xpath=//tr[@class="fw-1"]//span[text()="${Num1}"]  
    Element Should be Visible  xpath=//tr[@class="fw-1"]//span[text()="${Num2}"]  
    Element Should be Visible  xpath=//tr[@class="fw-1"]//span[text()="${Num3}"] 

Error Message Display
    Page Should Contain Element   css=.alert-msg.text-danger        error=Error Message not Display

Short Table by Notice number
    Click Element   xpath=//span[text()="Notice No."]//ancestor::div[@class="d-flex align-items-center"]
    Verify Result Table is Display  

Upload CSV to Search
    [Arguments]  ${file}
    Choose File   id=file-upload    ${file}
    Page Should Contain Element   xpath=//span[contains(text(),".csv")]
    Click Button on   Upload

Landing on CSV upload page
    Click Element   xpath=//span[text()="CSV File Upload"]
    Wait Until Element is Visible   xpath=//h2[text()="Search Notices - CSV File Upload"]  timeout=${SHORT_TIMEOUT}

Able to View all Selected Notices
    ${a}=    get window handles
    ${list}=    Get length  ${a}
    Should be True   ${list} > 3

Upload CSV search with invalid format
    [Arguments]  ${file}
    User Want see Advance Search
    Scroll to Middle of Page
    Click Element   xpath=//span[text()="CSV File Upload"]
    Wait Until Element is Visible   xpath=//h2[text()="Search Notices - CSV File Upload"]  timeout=${SHORT_TIMEOUT}
    Choose File   id=file-upload    ${file}

Search Notice in Advance Using  
    [Arguments]   ${type}   ${num}
    Click Element   xpath=//div[@id="form-controll-id_type"]//span[text()="${type}"]
    Input Text      xpath=//div[@id="form-controll-id_number"]//input     ${num}

Select Offender Type
    [Arguments]  ${type}
    Click Element   xpath=//div[@id="form-controll-offender_name"]//span[text()="${type}"]

Selected notice have driver details
    Scroll to Section  Relation with Vehicle Owner
    Page Should Contain Element   xpath=//h2[text()="Driver Details"]//ancestor::div[@class="card-header"]//following-sibling::div[@class="collapse show"]//b[text()="ALBERT ANG"]

Page Display Column
    [Arguments]  ${column}
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//span[text()="${column}"]

Select Notice from Search Result
    [Arguments]     ${notice}
    Wait Until Element is Visible   xpath=//span[text()="${notice}"]/parent::div        timeout=${MEDIUM_TIMEOUT}
    Click Element   xpath=//span[text()="${notice}"]/parent::div
    Switch Window   New

Details of Notice Display
    [Arguments]   ${num}
    Verify summary Data is Loaded
    Verify Notice Title Page  View Notice
    Page Should Contain  ${num}

Verify Search Result Vehicle Correctly
    [Arguments]   ${num}
    Element Should be Visible  xpath=//tr[@class="fw-1"]//span[text()="${num}"]  

Select Notice to View
    [Arguments]   ${index}
    Wait Until Element is Visible  xpath=(//tr[@class="fw-1"]//input)[${index}]   timeout=${MEDIUM_TIMEOUT}
    Click Element  xpath=(//tr[@class="fw-1"]//input)[${index}]

Notices Opened Multiple
    [Arguments]  ${notice}   ${index}
    ${handles}   Get Window Handles
    ${window}   Get From List   ${handles}   ${index}
    Switch Window   ${window}
    Verify summary Data is Loaded
    Page Should Contain   ${notice}

Open Multiple Notices
    Click Element   xpath=//span[text()="Open Mutiple Notices"]//ancestor::button

Select All Notice
    Click Element   xpath=//input[@type="checkbox"][@value="all"]

Select Apply Operation Option
    [Arguments]   ${option}
    Click Element  xpath=//div[@id="kt_app_content_container"]//span[text()="${option}"]

Verify Notice on Permanen Suspend Status
    Wait Until Element Contains   xpath=(//tr[@class="fw-1"]//span)[9]  PS   timeout=${MEDIUM_TIMEOUT}

Direct to Temporary Suspend Details Page
    ${location}    Get Location
    Should be Equal   ${location}      ${OCMS5PAGE}notices/ts/ts_details

Verify Message on Pop Up Window
    [Arguments]   ${text}
    Element Should be visible   xpath=//div[@class="modal-content"]//p[text()="${text}"]



#OCMS 17
Suspension Summary section contain    
    [Arguments]  ${column}
    Page Should Contain Element   xpath=//div[@class="table-responsive"]//span[text()="${column}"]      message=page doenst contain column ${column}

Suspension Summary section allow input  
    [Arguments]  ${field}
    Page Should Contain Element    xpath=//label[text()="${field}"]//following-sibling::div             message=page doesnt contain field ${field}

Select Suspension Code 
    Wait Until Element is Visible   xpath=//div[@id="form-controll-suspension_code"]//button    timeout=${MEDIUM_TIMEOUT}
    Scroll To Bottom Page
    Click Button    xpath=//div[@id="form-controll-suspension_code"]//button
    Click Element   xpath=(//div[@id="form-controll-suspension_code"]//a)[1]

Number of days will auto-populated
    Text field value should be         xpath=//div[@id="form-controll-day_no"]//input                 14

Able to select temporary suspension code
    Element Text Should Be          xpath=//div[@id="form-controll-suspension_code"]//button     APE - Appeal Extension

Able to edit number of days
    Text field value should be         xpath=//div[@id="form-controll-day_no"]//input                 9

Edit Number of days
    Input text   xpath=//div[@id="form-controll-day_no"]//input     9

Input Temporary suspension remarks field 
    Scroll To Bottom Page
    Input text    xpath=//div[@id="form-controll-ts_remark"]//textarea      ${remark}

Able to Input Suspension 
    Textarea Value Should be   xpath=//div[@id="form-controll-ts_remark"]//textarea    ${remark}

Able to Temprorary Suspend Notice
    Verify Pop up Alert Window   Confirmation  Temporary Suspension   Ok
    Click Button On  Ok
    Wait Until Element is Visible   xpath=//p[contains(text(),"Temporary Suspension Applied Successfully")]   timeout=${LONG_TIMEOUT}

TS ed notice displays in yellow
    Page Should Contain element    css=.fw-1.bg-primary.bg-warning.bg-opacity-20            message=TS ed Notice not Color as Yellow

Temporary Suspension Record Display
    [Arguments]   ${field}
    Element Should Be Visible   xpath=//div[@id="kt_app_content"]//b[text()="${field}"]

Temporary Suspension Record Display Field
    [Arguments]   ${field}
    Element Should Be Visible   xpath=//div[@id="kt_app_content"]//p[text()="${field}"]

Verify Suspension Summary is Loaded
    Wait Until Element is Visible   xpath=//div[@class="table-responsive"]//span[text()="Action"]       timeout=${MEDIUM_TIMEOUT}



User Still on Details Page
    ${loc}   Get Location
    Should be Equal   ${loc}            ${OCMS5PAGE}notices/ps/summary

Verify Landing on Edit Notice Page
    Wait Until Element is Visible   xpath=//div[@id="form-controll-vehicle_no"]//input[@value="SMK4288Z"]    timeout=${MEDIUM_TIMEOUT}

Click on TS/PS History
    Click Element    xpath=//a[text()="PS/TS History"]
    Wait Until Element is Visible  xpath=//span[text()="PS"]/ancestor::div[@class="table-responsive"]  timeout=${MEDIUM_TIMEOUT}

Suspension Record Display
    Page Should Contain Element     xpath=//tr[@class="fw-1"]//span[text()="PS"]

User advance search using Rule Infernged
    User Want see Advance Search
    Input text   xpath=//div[@id="form-controll-computer_rule_code"]//input     31304
    Scroll to Middle of Page
    Click Button on  Apply

User advance search using notice type
    User Want see Advance Search
    Click Search Advance Type   Notice Type
    Click Element   xpath=//div[@id="form-controll-notice_type"]//span[text()="O - Parking Offence"]
    Scroll to Middle of Page
    Click Button on  Apply

User advance search using Reason of Suspension
    Click Search Advance Type   Reason of Suspension
    Click Element   xpath=//div[@id="form-controll-epr_reason_of_suspension"]//span[text()="ANS - Advisory Notice"]
    Scroll to Middle of Page
    Click Button on  Apply

User advance search using Vehicle registration type
    User Want see Advance Search
    Click Search Advance Type   Vehicle of Registration Type
    Click Element   xpath=//div[@id="form-controll-vehicle_registration_type"]//span[text()="F - FOREIGN"]
    Scroll to Middle of Page
    Click Button on  Apply

Able to Advance Search using Notice type
    Verify Result Table is Display  
    Select Single Notice to View
    Verify Summary Data Is Loaded
    Page Should Contain  O - Parking Offence

Able to advance search using vehicle registration type
    Verify Result Table is Display  
    Select Single Notice to View
    Verify Summary Data Is Loaded
    Scroll to Section  IU No.
    Page Should Contain    F - FOREIGN

Able to Permanent Suspension Mutiple Notice
    Verify Page Title is  Permanent Suspension (PS)
    Page Should Contain Element   xpath=(//tr[@class="fw-1"])[2]
    
#OCMS 19
Page redirects user to revival process menu
    Verify Page Title is       Revival Notice
    ${loc}   Get Location
    Should be Equal    ${loc}   ${OCMS5PAGE}notices/revival/revival_details

Notice status is removed after overall process of revival
    Page Should not Contain    ${TSdate}
    Apply TS to Revival Notice

Verify Revival Page is Loaded
    Wait Until Element is Visible   xpath=//div[@id="form-controll-revival_reason"]//input   ${MEDIUM_TIMEOUT}

Select Temporary Suspension to revive
    Scroll to Section  Revival Notice Record
    ${TSdate}   Get text  xpath=((//tr[@class="fw-1"])[2]//span)[1]
    Click element   xpath=(//tr[@class="fw-1"]//input)[1]
    Set Test Variable   \${TSdate}  ${TSdate}

Input Revival Reason
    Input Text    xpath=//div[@id="form-controll-revival_reason"]//input   REV

Input Revival Remarks
    Input text    xpath=//div[@id="form-controll-revival_remark"]//textarea         AUTOMATION TEST REVIVAL

Select Staff Authorized By 
    Click Element  xpath=//div[@id="form-controll-authorized_by"]//button
    Click Element  xpath=(//div[@id="form-controll-authorized_by"]//a)[2]

User see error message on search notice
    [Arguments]    ${text}
    Page Should Contain Element   xpath=//span[@class="alert-msg text-danger"][text()="${text}"]

Page redirect user to suspension notice detail for user to revive
    ${loc}   Get Location
    Should be Equal   ${loc}   ${OCMS5PAGE}notices/revival/revival_details

Select Notice with Temporary Status
    [Arguments]  ${index}
    Click Element   xpath=(//span[text()="TS"]//ancestor::tr[@class="fw-1"]//input)[${index}]

User able to input all the mandatory field required to revive the notice
    Textfield Value Should be   xpath=//div[@id="form-controll-revival_reason"]//input      REV
    Textarea Value Should be   xpath=//div[@id="form-controll-revival_remark"]//textarea   AUTOMATION TEST REVIVAL
    ${OIC}   Get Text   xpath=//div[@id="form-controll-authorized_by"]//button
    Should be Equal   ${OIC}   OIC 2

Notice suspension status is not changed
    Click on Tab  Revival Notice
    Scroll to Section  Revival Notice Record
    Page Should Contain Element   xpath=//tr[@class="fw-1"]//span[text()="${TSdate}"]

