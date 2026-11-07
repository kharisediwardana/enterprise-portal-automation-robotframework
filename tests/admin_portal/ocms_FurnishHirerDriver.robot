*** Settings ***
Documentation        This is automation of Enterprise Portal Automation Suite On Furnish Hire/Driver Particular
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Page OCMS 42
Test Setup           Go to OCMS42 Page
Test Teardown        Capture Page If Test Failed
Suite Teardown       Close All Browsers
Force Tags           OCMS42


*** Test Cases ***
OCMS_42.01_001-User Wants to Furnish Driver using Valid SingPass
    Given Verify Pass Window Pop Up Display
    When Choose Login Using Singpass
    Then Able to Login Using Singpass
#Handle by Manual?
#OCMS_42.01_002-User want to furnish driver using valid CorpPass
    #Given User Landing on Furnish/Driver Notice Page with Login Status
    #When User Login Corpass with Notice             ${NRIC}
    #Then User see all notice under Corp Pass ID

#OCMS_42.01_003-User wants to furnish driver using Non Existing SingPass ID
#OCMS_42.01_004-User wants to furnish driver using Non Existing CorpPass ID
#OCMS_42.01_005-User wants to furnish driver using SingPass password login with wrong password
#OCMS_42.01_006-User wants to furnish driver using CorpPass password login with wrong password
#?
#OCMS_42.01_007-User wants to furnish driver from portal website to customer portal
#OCMS_42.01_008-User access portal website/ Customer portal when internet user is down
#OCMS_42.01_009-User access portal website/ Customer portal when service is down

OCMS_42.2_001-User wants to see notice details in pending management approval
    Given Already Have notice on Sing Pass Account      ${NRIC}
    When User Click Notice tab on    Payable Notices
    Then User See Parking Offence Details Data      Payable Notices

OCMS_42.02_002-User wants to edit the offence details record on the page
    Given Already Have notice on Sing Pass Account      ${NRIC}
    When User Edit the Record           Payable Notices
    Then User Cannot Edit The Record    Payable Notices

OCMS_42.02_003-User wants to check offence details under his/her login ID in customer portal page
    Given Already Have notice on Sing Pass Account without Notice
    When User Reach Section     Furnishable Notices
    Then User See no Record Contain on Login ID 

#Handle on Manual
#OCMS_42.02_004-User wants to see all notice under Corp Pass ID
    #Given User Landing on Furnish/Driver Notice Page with Login Status
    #When User Login Corpass with Notice
    #Then User see all notice under Corp Pass ID

#?Need to make test data already furnish
#OCMS_42.02_005-User as Driver wants to see offences details after success sumbit furnish

OCMS_42.02_006-User wants to see past notices from XX months ago
    Given User Landing on Furnish/Driver Notice Page with Login Status
    When Already Have notice on Sing Pass Account      ${NRIC}
    Then Notice display data          Furnishable Notices       2023 12:00

#? Outstanding notices?
#OCMS_42.03_001-User wants to access and see the details on the outstanding notices under his ID    
OCMS_42.3_002-User wants to make payment in non furnishable parking offence
    Given Already Have notice on Sing Pass Account without Notice
    When User Reach Section     Payable Notices
    Then User See no Record Contain on Login ID 

OCMS_42.03_003-User wants to access and see the details on the outstanding notices under his ID
    [Tags]  Duplicate    #OCMS 42.3_002
    Given Already Have notice on Sing Pass Account without Notice
    When User Reach Section     Payable Notices
    Then User See no Record Contain on Login ID 

OCMS_42.4_001-User wants to check any parking offence under his/her ID
    Given Already Have notice on Sing Pass Account without Notice
    When User Reach Section     Furnishable Notices
    Then User See no Record Contain on Login ID 

OCMS_42.4_002-User wants to edit data on offence details
    Given Already Have notice on Sing Pass Account  ${NRIC}
    When User Edit the Record           Furnishable Notices
    Then User Cannot Edit The Record    Furnishable Notices

OCMS_42.5_001-User wants to make payment without select any notices
    Given Already Have notice on Sing Pass Account     ${NRIC}  
    When User Want to Pay without Select Notice 
    Then User Cannot Click Pay Button

#?Payment Page?
#OCMS_42.5_002A-User wants to make payment and get auto-selected on payment page
#OCMS_42.5_002B-User wants to unselect the payable notice
#OCMS_42.5_003-User See Notice Status Remarks
#OCMS_42.5_004-User Wants to Re-furnish management approval
#OCMS_42.5_005-User Want to See Payable Notice Details

OCMS_42.6_001-User wants to select offence notice to furnish driver
    Given User Landing on Furnish/Driver Notice Page with Login Status
    When User Select Multiple Notice
    Then Selected Notice will Furnish as 1 set Driver Particular

#OCMS_42.7_001-User wants to use auto fill his particulars
    #[Tags]  Covered by 01
    #Given Verify Pass Window Pop Up Display
    #When Choose Login Using Singpass
    #Then Able to Login Using Singpass

#OCMS_42.7_001B-User wants to use auto fill his particulars but failed upon login

OCMS_42.8_001-User wants to access my info in owner particulars info and update the info manually
    Given Already Landing on Step Two Furnish Notice 
    When User update editable info manually
    Then User able to update editable info manually

OCMS_42.8_002A-User input contact number and/ email address with invalid data
    Given Already Landing on Step Two Furnish Notice
    When User Input Owner Data with     ${incorrectContact}    ${incorrectEmail}
    Then Error message incorrect data input display    

OCMS_42.8_002B-User leave contact number and / email field empty
    Given Already Landing on Step Two Furnish Notice
    When User Let The Owner Field Empty
    Then Error Message Empty Data Input Display

OCMS_42.9_001-User wants to fill personal particular information as driver/hirer
    Given Already Landing on Step Two Furnish Notice
    When User Input Particular Data with Valid Data
    Then All Form can be Filled

OCMS_42.9_002A-User can choose one of option that display
    Given Already Landing on Step Two Furnish Notice
    When User Input Particular Data with Valid Data
    and Choose Driver Relationship with     family
    Then User Able to Choose Answer on Option

#!Expired Time
#OCMS_42.9_002B-User will see expired page pop up after leave it of X=? minutes
OCMS_42.9_002C-User not see suggestion when input data to field
    Given Already Landing on Step Two Furnish Notice
    When User Double Click to See Suggestion
    Then User See Any No Suggestion

OCMS_42.9_002D-User see validation check after input data to field
    Given Already Landing on Step Two Furnish Notice
    When User Input Particular Data with Valid Data
    User No See Any Error Message on Particular Details

OCMS_42.9_003-User Wants to Input Incorrect data format
    Given Already Landing on Step Two Furnish Notice
    When User Input Owner Data with     ${incorrectContact}    ${incorrectEmail}
    Then Error message incorrect data input display 
#! Cek lagi nanti
OCMS_42.9_004-User want to upload supporting document
    Given Already Landing on Step Two Furnish Notice
    When Upload Supporting Document with    ${supportFile1}
    Then User Able to Upload Supporting Document
    
#OCMS_42.10_001A-User wants to use auto fill his particulars
#OCMS_42.10_001B-User wants to use auto fill his particulars but failed upon login
OCMS_42.11_001-User wants to edit users particular to update particulars data
    Given Already Landing on Step Two Furnish Notice
    When User Edit non-Grey User information
    Then Able to Edit non-Grey User Information

OCMS_42.11_002A-User wants to edit users particular to update particulars data using wrong format
    Given Already Landing on Step Two Furnish Notice
    When User Input Owner Data with     ${incorrectContact}    ${incorrectEmail}
    Then Error message incorrect data input display  

OCMS_42.11_002B-User wants to edit users particular to update particulars data but leave the field blank
    Given Already Landing on Step Two Furnish Notice
    When User Let The Owner Field Empty
    Then Error Message Empty Data Input Display

OCMS_42.12_001-User wants to fill the furnish driver/hirer particulars
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field 
    Then Able to Complete HirerDriver Particular Step

OCMS_42.12_002-User wants to complete the driver/hirer particulars relation with user
    [Tags]  #Duplicate 42.09_002A
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field 
    and Choose Driver Relationship with     family
    Then User Able to Choose Answer on Option

OCMS_42.12_003A-User wants to complete the driver/hirer particulars but forgot to select relationship with user
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field
    Then User Cannot Continue step without fill relationship  Please Fill Relationship  #Add Error Assertion

OCMS_42.12_003B-User wants to complete the driver/hirers particulars relation with other and leave the field empty
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field 
    and Choose Driver Relationship with     other
    Then User Cannot Continue step without fill relationship    Please select relation with vehicle owner

#!Expired Time
#OCMS_42.12_004A-User left idle on the page for XX minutes and wants to continue his session
#OCMS_42.12_004B-User left idle on the page for XX minutes and wants to cancel his session
#OCMS_42.12_004C-User left idle on the page for XX minutes until timer is expired

OCMS_42.12_005A-User upload file attachment for driving license
    Given Already Landing on Step Two Furnish Notice
    When Upload Supporting Document with    ${supportFile1}
    Then User Able to Upload Supporting Document

#OCMS_42.12_005B-User attach valid document under FIN selection
#! need to findout verify
#OCMS_42.12_005C-User attach valid document under UEN selection
#OCMS_42.12_005D-User attach valid document under passport selection
OCMS_42.12_006-User uploads supporting documents using non designated file format
    Given Already Landing on Step Two Furnish Notice
    When Upload Supporting Document with    ${unsupportFile}
    Then Verify Error Message Display    as not uploaded because the format is not supported.
    And Failed to Upload File

OCMS_42.12_007-User leave the supporting document empty
    Given Already Landing on Step Two Furnish Notice
    When User not Attach Supporting Document
    Then Pop Up Window No Document Attach Display

OCMS_42.12_008-User uploads supporting documents exceeding file size
    Given Already Landing on Step Two Furnish Notice
    When Upload Supporting Document with    ${bigFile}
    Then Verify Error Message Display    was not uploaded because the size is more than 10 MB.
    And Failed to Upload File

OCMS_42.13_001-User wants to describe relationship between vehicle owner and hirer/driver with others selection
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field 
    and Choose Driver Relationship with     other
    Then Text box other relation Displayed

OCMS_42.13_002-User wants to describe relationship between vehicle owner and hirer/driver with others selection with long word description
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field 
    and User input long description of other relation
    Then Able to input other description with long word
# cannot be automated
#OCMS_42.14_001-User wants to provide vehicle rental period and select period between the offence occurs
#OCMS_42.14_002-User wants to provide vehicle rental period using invalid end date
#OCMS_42.15_001-User wants to input rental period earlier than offence time
#OCMS_42.15_002-User wants to input rental period later than offence time
#OCMS_42.16_001-User want to submit all the data including rental period user provided
OCMS_42.16_002-User wants to leave rental period field empty
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field
    and Choose Driver Relationship with     vehicle_leased
    Then User Cannot Continue step without fill relationship    Please select start time

OCMS_42.17_001-User wants to furnish driver/hirer and giving relevant information about the furnish
    [Tags]  Duplicate   #42.09_002A
    Given Already Landing on Step Two Furnish Notice
    When User Input Particular Data with Valid Data
    and Choose Driver Relationship with     family
    Then User Able to Choose Answer on Option

OCMS_42.17_002-User wants to leave question section empty
    [Tags]  Duplicate   #42.12_003A
    Given Already Landing on Step Two Furnish Notice
    When User Input All Mandatory Field
    Then User Cannot Continue step without fill relationship
#! Need Data with Expired FIN
#OCMS_42.18_001-User wants to input FIN ID for owner/hirer

OCMS_42.18_002-User wants to input incorrect FIN Number
    Given Already Landing on Step Two Furnish Notice
    When Input Driver Data with FIN Type  ${invalidNumber}
    Then Verify Error Message Display   Invalid ID number. Please enter again.

#! Need Data with Expired FIN
#OCMS_42.18_003-Under expired FIN number User wants to decide whether user wants to submit data or make payment
#OCMS_42.19_001-User want to input drivers particular

#!
#OCMS_42.20_001-User wants to proceed payment for its offence notice
#OCMS_42.20_001-User decided to make payment during furnish driver particulars process
#OCMS_42.20_002-Page to provide user between furnish driver or make payment for offence notice(s)
#OCMS_42.20_003-User decided to make payment that are pending Portal's approval

#modal canot handle with visible element?
OCMS_42.21_001-User wants to auto use get address function using valid postal code
    Given Already Landing on Step Two Furnish Notice
    When Get Adress Driver with  ${PostalCode}
    Then User See Address is Auto-Populated

OCMS_42.21_002-User want to use get address function with invalid postal code
    Given Already Landing on Step Two Furnish Notice
    When Input Driver Address with   ${InvalidPostalCode}
    Then Failed to Get Address

OCMS_42.22_001-User wants to leave NRIC/FIN Field Empty
    Given Already Landing on Step Two Furnish Notice
    When User Let ID Number Field Empty
    Then User See Error on Driver ID Section

OCMS_42.22_002-User input invalid NRIC/FIN
    [Tags]  Duplicated  #42.18_002
    Given Already Landing on Step Two Furnish Notice
    When Input Driver Data with FIN Type  ${invalidNumber}
    Then Verify Error Message Display   Invalid ID number. Please enter again.

OCMS_42.22_003-User let one mandatory field empty
    Given Already Landing on Step Two Furnish Notice
    When User Let One Mandatory Field Empty
    Then User See Error Message on Empty Mandatory Field

OCMS_42.23_001-User wants to proceed the furnish after complete form
    Given Already Fill All Mandatories Field on Step Two
    When Proceed to Next Page
    Then Verify Landing on Step Three

OCMS_42.23_002-User wants to back and edit data in Furnish Notice Particular Step
    Given Landing on Confirmation Step
    When Want Back to Furnish Notice Particular Page
    Then Able to Edit Furnish Notice Particular Page

#!Look Through it
OCMS_42.24_001-User wants to confirm details summary page
    Given Landing on Confirmation Step
    When Scroll to Section   Hirer's / Driver's Particulars
    Then User Success Proceed data

OCMS_42.24_002-User wants to back and edit data in Furnish Notice Particular Step
    [Tags]  Duplicated   #42.23_002
    Given Landing on Confirmation Step
    When Want Back to Furnish Notice Particular Page
    Then Able to Edit Furnish Notice Particular Page

OCMS_42.25_001-User is decided to submit the form after complete fill all the details
    [Tags]  Duplicated  #42.23_001
    Given Already Fill All Mandatories Field on Step Two
    When Proceed to Next Page
    Then Verify Landing on Step Three

OCMS_42.25_002-User wants to edit particular details owner/driver
    [Tags]  #Duplicated 42.23_002
    Given Landing on Confirmation Step
    When Want Back to Furnish Notice Particular Page
    Then Able to Edit Furnish Notice Particular Page

OCMS_42.26_001-User access checkbox before submit
    Given Landing on Confirmation Step
    When Scroll to Bottom Page
    Then User Able to Select Acknowledgement Checkbox Menu

OCMS_42.26_002-User wants to input captcha before submit data
    Given Already Select Checkbox on Confirmation Page
    When User Input Confirmation Details Valid Captcha
    Then Verify Error Message Not Display   Please ensure that the captcha correct.

OCMS_42.26_003-User attempts to submit data using wrong captcha
    Given Already Select Checkbox on Confirmation Page
    When Input Captcha Furnish Hirer Driver      WRONG
    Then Verify Error Message Display    Invalid captcha. Please enter again.

OCMS_42.26_004-User attempts to submit data using blank captcha
    Given Already Select Checkbox on Confirmation Page
    When Click Submit Furnish
    Then User Cannot Submit Furnish Notice

OCMS_42.27_001-User wants to submit the form to proceed without select on checkbox
    Given Landing on Confirmation Step
    When User Input Confirmation Details Valid Captcha
    Then Verify Error Message Display     Please acknowledge the declaration if you wish to proceed.

OCMS_42.28_001-User see summary details on acknowlegement page
    Given Already input Captcha on Confirmation Page
    When Proceed to Submit Furnish
    Then Summary Details of Furnished Notice is Display

OCMS_42.28_002-User wants to print notice summary
    Given User Already on Acknowledgement Page
    When Click Print Button
    Then User Can Print Furnish Data

OCMS_42.28_003-User wants to download notice summary
    Given User Already on Acknowledgement Page
    When Click Print Button
    Then User Can Print Furnish Data
