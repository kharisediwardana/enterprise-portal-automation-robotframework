*** Settings ***
Documentation       This is automation of Enterprise Portal Automation Suite On Create Appeal e-Service
Resource             ../../resources.robot
Suite Setup          Open Browser and Go to Page Plus Appeal
Test Setup           Go to Plus Appeal Page
Test Teardown        Capture Page If Test Failed
Suite Teardown       Close All Browsers
Force Tags           PLUS26

*** Test Cases ***
# Using Expired Time
#PLUS_NF_001A-User left the page on idle and resumes the current session
#PLUS_NF_002A-User left the page on idle and terminates the current session
#PLUS_NF_003A-User left the page on idle too long and the current session expired
#PLUS_NF_001B-User left the page on idle and resumes the current session
#PLUS_NF_001C-User left the page on idle and resumes the current session
#PLUS_NF_002B-User left the page on idle and terminates the current session
#PLUS_NF_002C-User left the page on idle and terminates the current session
#PLUS_NF_003B-User left the page on idle too long and the current session expired
#PLUS_NF_003C-User left the page on idle too long and the current session expired

# No need to wait
#PLUS_NF_004A-User navigates to different service in the current session, and goes back to the Appeal eService
#PLUS_NF_004B-User navigates away from the page using browser navigation buttons
#PLUS_NF_005-User accesses the eService with a mobile device to create an appeal

PLUS_2601_001-User to see all required information/disclaimers when using this eService
    Given User Landing on Create Appeal Page
    When Scroll to Section    Information
    Then User Can See Information Section 

PLUS_2601_002-User wants to make payment instead of creating an appeal
    Given User Landing on Create Appeal Page
    When Click Pay Parking Fine Button
    Then User Direct to Payment Page

PLUS_2601_003-User wants to proceed to create an appeal
    Given User Landing on Create Appeal Page
    When User Agree with Declaration
    Then User Direct to First Step of Create Appeal

PLUS_2602_001A-User wants to enter a single NOPO number
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number  ${NOPO}
    Then User Able to Enter NOPO   

PLUS_2602_001B-User wants to enter a single Court Summon number
    Given User Create New Appeal and Agree with Term Condition
    When User Add Valid Court Number  ${CourtNumber}
    Then User Able to Enter NOPO

PLUS_2602_002-User enters duplicate NOPO / Court Summon numbers
    Given User Create New Appeal and Agree with Term Condition
    When User Input Multiple Number on Offences Details  ${NOPO}  	${NOPO}
    Then User Not Able to Input Duplicate Nopo and See Error Message

PLUS_2602_003-User enters multiple distinct NOPO / Court Summon numbers
    User Create New Appeal and Agree with Term Condition
    debug
    When User Input Multiple Number on Offences Details   ${NOPOCourt}   	${NOPOCourt2}
    Then Able to Add Multiple NOPO

PLUS_2602_004-User to see the vehicle number after entering a valid NOPO / Court Summon number
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number   ${NOPO}
    Then User See Vehicle Number Auto-Populated     
    
PLUS_2603_001-User adds at least 1 NOPO/Court Summon number to the appeal
    Given User Create New Appeal and Agree with Term Condition
    When User Proceed Appeal Without Attach File
    Then User Can Sumbit Data and Get Offence Notice Pop Up

PLUS_2603_002A-User does not add any NOPO/Court Summon number to the appeal
    Given User Create New Appeal and Agree with Term Condition
    When Proceed Appeal Without Input Nopo
    Then User Will Direct to Offence Section and See Error Message      Please enter notice number or summon number.

PLUS_2603_002B-User does not answer Parking.SG questionnaire
    User Create New Appeal and Agree with Term Condition
    When Proceed Appeal without choose parking apps    ${NOPO}
    Then User Will Direct to Offence Section and See Error Message      Please indicate "Yes" or "No".

#Covered by 26.2
#PLUS_2604_001A-User wants to input his/her parking session
#Covered by 26.3
#PLUS_2604_001B-User does not need to input his/her parking session
#Covered by 26.2
#PLUS_2605_001-User enters a valid Parking.SG session number

PLUS_2605_002A-User unintentionally leave the field empty
    Given User Create New Appeal and Agree with Term Condition
    When Proceed Appeal with Yess Parking apps Without input Nopo
    Then User Will Direct to Offence Section and See Error Message      Please enter notice number or summon number.

PLUS_2605_002B-User enters a Parking.SG session number with incorrect format
    Given User Create New Appeal and Agree with Term Condition
    When User Input Valid Number and Invalid Session Number   ${NOPO}
    Then User Will Direct to Offence Section and See Error Message      Invalid parking session label. Please enter again.
    

PLUS_2605_002C-User enters an Parking.SG session number that does not exist
    Given User Create New Appeal and Agree with Term Condition
    When User Input Valid Number and Invalid Session Number   ${NOPO}
    Then User Will Direct to Offence Section and See Error Message      Invalid parking session label. Please enter again.    #need confirmed doesnt exist session number

#Change after have court summon number
PLUS_2606_001A-User adds a Court Summon number to the appeal
    [Tags]  #Duplicated 26.2
    Given User Create New Appeal and Agree with Term Condition
    When User Add Valid Court Number  ${CourtNumber}
    Then User Able to Enter NOPO

PLUS_2606_001B-User adds a Court Summon number to the appeal
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number  CASE123456/200
    Then User Will Direct to Offence Section and See Error Message      Invalid notice number or summon number. Please ensure that it is a valid portal offence.

# Covered by PLUS26.3
#PLUS_2606_002A-User adds a notice number to the appeal

#?Flacky
PLUS_2606_002B-User adds a notice number to the appeal
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number  12345678A
    Then User Will Direct to Offence Section and See Error Message     Notice number or summon number does not exist.

PLUS_2606_003A-User enters an invalid notice number
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number  12345ABCD
    Then User Will Direct to Offence Section and See Error Message  Invalid notice number or summon number. Please ensure that it is a valid portal offence.

PLUS_2606_003B-User enters an invalid Court Summon number
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number  Portal123456
    Then User Will Direct to Offence Section and See Error Message    Invalid notice number or summon number. Please ensure that it is a valid portal offence.

#Change after have court summon number
PLUS_2607_001A-User enters a Court Summon number to the appeal
    [Tags]  Duplicated  #26.2
    Given User Create New Appeal and Agree with Term Condition
    When User Add Valid Court Number  ${CourtNumber}
    Then User Able to Enter NOPO

PLUS_2607_001B-User enters a notice number to the appeal, and this notice number is a Court case
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number      ${NOPOCourt}
    Then Verify Court Notice Pop Up Window

PLUS_2607_001C-User enters a notice number to the appeal, and this notice number is an Advisory Notice
    Given User Create New Appeal and Agree with Term Condition
    When Choose Parking Apps Paid and Input Number   ${NOPO}
    Then User Able to Enter NOPO

#?Flacky
PLUS_2608_001A-User attempts to upload multiple documents from computer in the appeal
    Given User Create New Appeal and Agree with Term Condition
    When User Upload Multiple Document
    Then User See Document Uploaded on List

#mobile
#PLUS_2608_001B-User attempts to upload multiple documents from mobile device in the appeal

PLUS_2608_002-User did not attach any document in appeal form page
    Given User Create New Appeal and Agree with Term Condition
    When User Proceed Appeal Without Attach File
    Then User Can Sumbit Data and Get Offence Notice Pop Up

PLUS_2608_003A-User upload unsupported document type
    Given User Create New Appeal and Agree with Term Condition
    When User Upload Unsupported File    ${unsupportFile}
    Then Error Message e-Service Portal Display  as not uploaded because the format is not supported.

PLUS_2608_003B-User upload documents exceeding maximum document upload size
    User Create New Appeal and Agree with Term Condition
    When User Upload Unsupported File   ${bigFile}
    Then Error Message e-Service Portal Display  as not uploaded because the size is more than 10 MB.

PLUS_2608_003C-User upload duplicate documents
    User Create New Appeal and Agree with Term Condition
    When User Upload Duplicate File
    Then Error Message e-Service Portal Display  have selected under the list.  #sometime error not display

#Need Sing Pass
#PLUS_2609_001A-User is using Singpass/Corppass to retrieve personal particulars successfully
#PLUS_2609_001B-User is using Singpass/Corppass to retrieve personal particulars, but the login is unsuccessful
#PLUS_2609_001C-User cssloses an initial prompt to login with SingPass/CorpPass, and wants to retrieve particulars with SingPass/CorpPass

PLUS_2609_002-User fills up personal particulars without using SingPass/CorpPass login
    Given User Create New Appeal and Agree with Term Condition
    When User Sumbit Data without Using Singpass
    Then User Able to Fill Personal Particular Data Manually

PLUS_2609_003-User clicks on button to clear the filled particulars
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    User Click Clear Button on Particular Data 
    Then User Can See Personal Data is Empty

#Need Singpass
#PLUS_2609_004-User re-fills up personal particulars using SingPass/CorpPass login successfully

PLUS_2610_001A-User enters postal code and retrieves the address
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    When User Get Address with Input Postal Code    ${PostalCode}
    Then User See Address Data Filled with Auto-Populated 
    
PLUS_2610_001B-User enters postal code and retrieves the address
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    When User Get Address with Input Postal Code     ${InvalidPostalCode}
    Then Error Message e-Service Portal Display   Postal code does not existing.

PLUS_2610_002-User fills up personal particulars without using SingPass/CorpPass login
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    When User Able to Fill Personal Particular Data Manually
    Then User See No Error Message on Personal Particular Section

PLUS_2610_003A-User fills up other valid info manually i.e. address, email address
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    When Input Valid Email Address Data on Personal Particular
    Then User See No Error Message on Address Section
    And User See No Error Message on Email Section

PLUS_2610_003B-User fills up other info manually i.e. address, email address with invalid values
    Given User Make new Appeal Without Singpas Login       ${NOPO3}
    When Input Email Address with   AAAAAA
    Then Verify Error Message Display           Invalid email address. Please enter again. 

#? Still Flacky
PLUS_2610_004A-User wants to paste in email address into the form, using a computer
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    When User Try to Paste Email
    Then User Unable tp Paste Email Address

#Mobile Device
#PLUS_2610_004B-User wants to paste in email address into the form, using a mobile device

PLUS_2611_001A-User fills in all required fields
    Given User Fills all required Fields    
    When User Proceed to Appeal Reason
    Then User Direct to Appeal Reason Page

PLUS_2611_001B-User commits one or more required fields
    Given User Make new Appeal Without Singpas Login       ${NOPO}
    When User Let Email Field Empty
    Then Verify Error Message Display           Please enter email address.

PLUS_2612_001-User able to enter appeal reason in appeal form
    Given User Input All Required Fields and Proceed Data
    When User Input Text on Appeal Reason
    Then User Can See Appeal Reason Text Area Inputted

PLUS_2612_002-User can see hint text for acceptable appeal reasons
    Given User Input All Required Fields and Proceed Data
    When User Input Text on Appeal Reason
    Then User Can See Hint Text Displayed

#2612_001 & 002 already covered by 2613_001 it could be delete later

PLUS_2613_001-User enters an appeal reason within maximum data length
    Given User Input All Required Fields and Proceed Data
    When Input Text With Maximum Data Length
    Then User See Hint Text Displayed with 0 Characters Left  

#No Error When Exceed Maximum Data
#Similar 26.13_001
PLUS_2613_002-User enters an appeal reason exceeding maximum data length
    Given User Input All Required Fields and Proceed Data
    When Input Text With Maximum Data Length
    Then User See Hint Text Displayed with 0 Characters Left 
    And Verify Error Message Display    Your word count are reached the limit of 6000.

PLUS_2614_001-User indicates that he is the driver in the appeal
    Given User Input All Required Fields and Proceed Data
    And User Input Text on Appeal Reason
    When User Is The Driver
    Then Click on Button    Proceed to Appeal Confirmation
    And User Direct to Confirmation Page

PLUS_2614_002-User indicates that he is not the driver in the appeal
    Given User Input All Required Fields and Proceed Data
    And User Input Text on Appeal Reason
    When User Is not The Driver
    Then Click on Button    Proceed to Appeal Confirmation
    And User Direct to Confirmation Page

PLUS_2614_003-User did not indicate that he is/is not the driver in the appeal
    Given User Input All Required Fields and Proceed Data
    And User Input Text on Appeal Reason
    When Click on Button    Proceed to Appeal Confirmation
    Then Verify Error Message Display     Please indicate if people are driver.
   
PLUS_2615_001-User inspects the data filled in the form before submission
    Given User Input All Required Fields and Proceed Data
    And User Input Data As Driver
    When Click on Button    Proceed to Appeal Confirmation
    Then User See Review Data Same as Inputted Data

PLUS_2615_002-User wants to make amendments to appeal details
    Given User Input All Required Fields and Proceed Data
    And User Input Data As Driver
    When Click on Button  Back to Personal Particulars
    Then User Landing to Appeal Reason Step

PLUS_2615_003-User clicks on “Submit” button to submit the appeal application
    Given User Input All Required Fields and Proceed Data
    And User Input Text on Appeal Reason
    When User Is The Driver
    Then User Fill Valid Captcha
    And User Direct to Acknowledgement Page

PLUS_2616_001-User attach documents before moving to next step of the appeal creation form
    Given User Create New Appeal and Agree with Term Condition
    When User Upload Multiple Document
    Then User See Document Uploaded on List
    And User Proceed to Personal Particular
   
PLUS_2616_002A-User did not attach documents before moving to next step of the appeal creation form, and wants to proceed with the submission
    [Tags]   #Duplicate 2609_002
    Given User Create New Appeal and Agree with Term Condition
    When User Sumbit Data without Using Singpass
    Then User Able to Fill Personal Particular Data Manually

PLUS_2616_002B-User forgot to attach documents before moving to next step ofs the appeal creation form, and wants to be able to attach them
    Given User Create New Appeal and Agree with Term Condition
    When User Proceed Appeal Without Attach File
    And User Click Cancel on Pop Up no Document Alert
    Then User Still Allow to Upload

PLUS_2616_003A-User enters a correct captcha code before proceeding with appeal submission
    Given User Input All Required Fields and Proceed Data
    And User Input Text on Appeal Reason
    When User Is The Driver
    Then User Fill Valid Captcha
    And User Direct to Acknowledgement Page

PLUS_2616_003B-User does not enter a captcha code before proceeding with appeal submission
    Given User Input All Required Fields and Proceed Data
    And User Input Data As Driver
    When User Want to Proceed Data without Enter Captcha
    Then User can not Submit Appeal

PLUS_2616_003C-User enters an incorrect captcha code before proceeding with appeal submission
    Given User Input All Required Fields and Proceed Data
    And User Input Data As Driver
    When User Want to Proceed Data with Invalid Captcha
    Then User can not Submit Appeal

#PLUS_2617_001-PLUS PLM views NOPOs linked to NEW appeals submitted from eService
#PLUS_2617_002-PLUS PLM is notified when certain NOPOs linked to the new appeal cases cannot be automatically TS-ed

#PLUS_2618_001-PLUS Allocating Officer views NEW appeals submitted from eService in Common Inbox
#PLUS_2618_002-PLUS Admin user is notified after new appeal cases submitted from eService cannot enter PLUS intranet


PLUS_26-Smoke Testing
    [Tags]   Smoke
    Given User Already Fill All Field with Valid Data
    When Click on Button    Submit
    Then User Direct to Acknowledgement Page
    And Verify on Step Five