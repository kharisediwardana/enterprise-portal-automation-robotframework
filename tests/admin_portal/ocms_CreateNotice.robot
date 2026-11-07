*** Settings ***
Documentation           Scripts for Create Notices
Resource                ../../resources.robot
Suite Setup             Open Browser and Go to Page OCMS 5
Suite Teardown          Close All Browsers
Test Setup              Go to OCMS 5 Page with Clear Cookies     
Test Teardown           Capture Page If Test Failed
Force Tags              OCMS5

***Test Cases***
OCMS_5.1_001-Create notice display following field
    Given User Landing on Notice Page
    When Click on Side Bar Menu  Create Notice
    Then Create Notice Page Contains Following Field

OCMS_5.1_002A-Success to create notice using manual step
    Given Landing on Create Notice Tab
    When User Input All Mandatory Field Create Notice
    And Submit Created Notice
    Then Modal Window Text is  Your notice has been successfully submitted.

OCMS_5.1_002B-Failed create notice using manual step
    Given Landing on Create Notice Tab
    When User Create Notice with empty mandatory field
    Then Failed to Create Notice

OCMS_5.1_003-User want to input all mandatory field
    Given Landing on Create Notice Tab
    When User Input All Mandatory Field Create Notice
    Then Error Message Empty Mandatory Field not Display

OCMS_5.1_004-User clear all form using button
    Given Already fill Vehicle Data
    When User clear the form
    Then All Field on Section is Cleared
    
OCMS_5.1_005-User see Character Counting inputted data on remarks field
    Given Landing on Create Notice Tab
    When Input Notice Remark
    Then Remarks Character Count Display        30 character left
    
OCMS_5.2_001-User want select data drop-down list
    Given Landing on Create Notice Tab
    When Select Registration Type    V - VIP
    Then Able to Input Data by Select drop-down list

OCMS_5.2_002-Value auto-add after selected ID Number
    Given Landing on Create Notice Tab
    When Select Data dropdown-list with value
    Then Value auto added

OCMS_5.2_003-Composition amount dropdown according to vehicle category
    Given Already select vehicle category and rule infernged
    When Click on Composition Amount Field
    Then Composition Amount According to Vehicle Category

OCMS_5.3_001A-User input valid singaporean plate number
    Given Landing on Create Notice Tab
    When Input Vehicle Data                     ${VehicleNum}
    Then Error Invalid Data not Display         Invalid vehicle number.

OCMS_5.3_001B-User input invalid singaporean plate number
    Given Landing on Create Notice Tab
    When Input Vehicle Data                     ${invalidNumber}
    Then Error Invalid Data Display             Invalid vehicle number.

OCMS_5.3_002-User input vehicle special vehicle type
    Given User Select Special Registration type
    When Notices_logic.Input Vehicle Number     ${VehicleNum}
    Then Error Invalid Data not Display         Invalid vehicle number.

OCMS_5.3_003A-User input IU number with designated format
    Given Landing on Create Notice Tab
    When Input IU number with                   1234567890
    Then Error Invalid Data not Display         Invalid IU No.
 
OCMS_5.3_003B-User input IU number with non designated format
    Given Landing on Create Notice Tab
    When Input IU number with                   123456
    Then Error Invalid Data Display             Invalid IU No.

OCMS_5.3_004A-User upload supporting document according to accepted file format
    Given Landing on Create Notice Tab
    When Upload Notice Attachment with          ${supportFile1}
    Then Attached file dispay on List

OCMS_5.3_004B-User upload supporting document according to not from accepted file format
    Given Landing on Create Notice Tab
    When Upload Notice Attachment with          ${unsupportFile}
    Then Modal Window Text is                   File format is not acceptable.

OCMS_5.3_004C-User upload supporting document exceeding accepted file size
    Given Landing on Create Notice Tab
    When Upload Notice Attachment with          ${bigFile}
    Then Modal Window Text is                   Total files size has exceed 10 MB.

OCMS_5.3_005-Empty mandatory field display error
    Given Landing on Create Notice Tab
    When User Create Notice with empty mandatory field
    Then Prompt Message Mandatory Field Empty is Display

OCMS_5.4_001-User see Download Template CSV Display
    Given Landing on Create Notice Tab
    When User Want to go CSV page
    Then Instruction step creating notice by CSV file is displayed
    
OCMS_5.4_002-Page Display instruction CSV file
    Given Landing on Create Notice Tab
    When User wants to download CSV Template
    Then Able to Download CSV file Template
    
OCMS_5.4_003-User wants to see summary notice review uploaded CSV
    Given Already attach CSV File with  ${MultipleCSV}      createNotice.csv
    When User Upload Attached CSV File 
    Then Summary notice review Display

OCMS_5.4_004-User see single data uploaded
    Given Already attach CSV File with  ${SingleCSV}        singleNotice.csv   
    When User Upload Attached CSV File
    Then Description single notice uploaded display

OCMS_5.4_005-User see multiple data uploaded
    Given Already attach CSV File with  ${MultipleCSV}      createNotice.csv
    When User Upload Attached CSV File
    Then Description Multiple notice uploaded display

#Confirming
#OCMS_5.4_006-User confirm the content of CSV file template that has the same field as manual notice creation

OCMS_5.5_001A-User see list record after upload CSV
    Given Already attach CSV File with  ${MultipleCSV}      createNotice.csv
    When User Upload Attached CSV File
    Then Description Multiple notice uploaded display

OCMS_5.5_001B-User see list record of failed upload CSV
    Given Already attach CSV File with  ${invalidCSV}       invalidNotice.csv
    When User Upload Attached CSV File
    Then Failed upload record display    

OCMS_5.5_002-User want to edit record of the Uploaded CSV
    Given Already attach CSV File with  ${MultipleCSV}      createNotice.csv
    When User Upload Attached CSV File
    Then Able to edit Record

OCMS_5.5_003-User using wrong format data to upload csv
    Given Already Landing on Upload CSV page
    When Upload Notice Attachment with  ${supportFile1}
    Then Modal Window Text is    File format is not acceptable.

OCMS_5.5_004-User upload non CSV file xls/xlsx that has notices data
    Given Already Landing on Upload CSV page
    When Upload Notice Attachment with  ${xlsx}
    Then Modal Window Text is    File format is not acceptable.

OCMS_5.5_005-User upload CSV file Using blank data template
    Given Already attach CSV File with  ${EmptyCSV}     Empty.csv
    When User Upload Attached CSV File
    Then Summary not showed any notice data

OCMS_5.5_006-User upload csv file but missing one of the mandatory field
    Given Already attach CSV File with  ${invalidCSV}       invalidNotice.csv
    When User Upload Attached CSV File
    Then Failed upload record display 

OCMS_5.6_001A-User see prompt message success create notice
    Given Already fill all mandatory field
    When Submit Created Notice
    Then Modal Window Text is  Your notice has been successfully submitted.
    
OCMS_5.6_001B-User see mandatory field empty prompt message
    Given Landing on Create Notice Tab
    When User Create Notice with empty mandatory field
    Then Failed to Create Notice

OCMS_5.6_002-User see Summary Notice
    Given Already fill all mandatory field
    When Submit Created Notice
    Then Summary Notice Display

OCMS_5.6_003-User wants Offence Notice Number auto-generated
    [Tags]   Smoke
    Given Already fill all mandatory field
    When Submit Created Notice
    Then Offence Notice Number auto-generated
    
OCMS_5.6_004-Created notice able to view on View Notice tab
    Given Already Create Notice
    When User Search for created Notice
    Then Created notice able to view on View Notice
  
#Apply Temporary Suspend on single notice
    #[Tags]  Smoke
    #Given User Already Submit Notice to Apply Suspension     ${createdNotice}
    #When Proceed to Temporary Suspend Selected Notice
    #Then Able to Temprorary Suspend Notice

#Revive Temporary Suspend on notice 
    #[Tags]  Smoke
    #Given User Already Search Notice to Revive               ${createdNotice}
    #And User Select Notice to Revive                         ${createdNotice}
    #When User Proceed to Revival Temporary Suspension
    #Then Notice status will no longer under suspension status

#Apply Permanent Suspend on single notice
    #[Tags]  Smoke
    #Given User Already Submit Notice to Apply Suspension     ${createdNotice} 
    #When User Proceed to PS Selected Notice                  ${createdNotice}
    #Then Able to Permanent Suspend Notice                    ${createdNotice}

