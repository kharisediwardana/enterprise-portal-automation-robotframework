*** Keywords  ***
User Landing on Create Appeal Page
    Verify Logo is Loaded
    Click Create Appeal Tab

Marks on Agreement and Create Appeal
    Check Mark on Appeal Information Check Box
    Verify Create Appeal Button is Enabled
    Click Create Appeal Button 

User Agree with Declaration
    Marks on Agreement and Create Appeal
    Verify Checkbox is Display
    Verify Pop up Alert Window on e-Service     Your Session    I declare   Confirm
    Check Mark on Declaration Window
    Click Appeal Confirm Button
    
User Direct to First Step of Create Appeal
    Verify Field Title is   Offence Details
    User are Currently on Appeal Step One

User Create New Appeal and Agree with Term Condition
    User Landing on Create Appeal Page
    User Agree with Declaration 
    User Direct to First Step of Create Appeal

Choose Parking Apps Paid and Input Number
    [arguments]  ${Number}
    Scroll to Section   Add
    Choose Parking Apps Usage
    Input Number on Offences Details   ${Number}

Choose No Parking Apps Paid and Input Number
    [arguments]  ${Number}
    Scroll to Offences Section
    Click No on Parking Apps 
    Input Number on Offences Details   ${Number}
    User Click OK on Advisory Window
    Add Offence Notice

User Input Multiple Number on Offences Details
    [arguments]  ${Number}  ${Number2}
    Choose Parking Apps Paid and Input Number     ${Number}
    Verify Court Notice Pop Up Window
    Add Offence Notice      SHC3901U
    Choose Parking Apps Paid and Input Number     ${Number2}
    Verify Court Notice Pop Up Window
    Add Offence Notice      SHC4710Y


Click Offences Next Button
    Scroll to Bottom Page
    Click on Button     Proceed to Personal Particulars

User Will Direct to Offence Section and See Error Message
    [Arguments]   ${msg}
    Verify Scrolled to Error Section
    Verify Error Message Display            ${msg}

User Will Direct to Offence Section and See Error Empty Parking
    Verify Section Offences
    Verify Error Empty Parking Apps

Proceed Appeal without choose parking apps
    [arguments]  ${Number}
    Scroll to Section   Add
    Input Number on Offences Details   ${Number}
    #User Click OK on Advisory Window
    Verify Court Notice Pop Up Window
    Click Number Add Button     ${VehicleNum3}

User Input Valid Number and Invalid Session Number
    [arguments]  ${Number}
    Choose Yes Parking Apps Usage
    Input Number on Offences Details   ${Number}
    #User Click OK on Advisory Window
    Verify Court Notice Pop Up Window
    Input Session ID Number         1   1234   1234
    Click Number Add Button         ${VehicleNum3}
    Click Offences Next Button

User Input Valid Number and Not Exist Session Number
    [arguments]  ${Number}  
    Choose Parking Apps Paid and Input Number     ${Number}
    User Click OK on Advisory Window
    Input Session ID Number         o   1234   1234
    Add Offence Notice
    Click Offences Next Button

Click OK on Court Notice Window
    Verify Court Notice Pop Up Window
    Click OK Button on Court Notice Window

User Add Valid Court Number
    [arguments]  ${Number}  
    Choose Parking Apps Paid and Input Number       ${Number}
    Verify Court Notice Pop Up Window
    Click Number Add Button     SHC3901U

Proceed Appeal with Yess Parking apps Without input Nopo
    Choose Parking Apps Usage
    #Verify Parkir Session Apps Window Pop up
    #Click Button Ok On Parking Session Apps Window
    #Scroll to Proceed Personal Particular Button
    #Click Number Add Button    ${VehicleNum3}
    Click Offences Next Button

Input Valid Number and Empty Session Number
    [arguments]  ${Number}
    Choose Parking Apps Paid and Input Number     ${Number}
    User Click OK on Advisory Window
    Add Offence Notice

Add data to Offence List
    [arguments]  ${NOPO}
    Choose Parking Apps Paid and Input Number   ${NOPO}
    User Click OK on Advisory Window
    Input Session ID Number     U   1234   5678

User Proceed Appeal Without Attach File
    Choose Parking Apps Paid and Input Number   ${NOPO}
    Verify Court Notice Pop Up Window
    Add Offence Notice
    Click Offences Next Button

User Can Sumbit Data and Get Offence Notice Pop Up
    Verify Pop up Alert Window on e-Service     No Documentary    not attached  Confirm
    Click on Button    Confirm
    Verify Pop up Alert Window on e-Service     Singpass    e-Service   Close
    Click on Button  Close

User Click OK on Advisory Window
    Verify Advisory Notice Pop Up Window
    Click OK Button on Advisory Window

Proceed Appeal Without Input Nopo
    Scroll to Section   Add
    Choose Parking Apps Usage
    Click Offences Next Button

User Upload Multiple Document
    Choose Parking Apps Paid and Input Number   ${NOPO}
    Verify Court Notice Pop Up Window
    Add Offence Notice
    Upload File   ${supportFile1}  
    Upload File   ${supportFile2}
 
User Sumbit Data without Using Singpass
    User Proceed Appeal Without Attach File
    User Can Sumbit Data and Get Offence Notice Pop Up

User Able to Fill Personal Particular Data Manually
    Scroll to Section   Postal Code
    Input Name
    Select Personal ID type with NIRC
    e-serviceportal_logic.Input ID Number with   ${NRIC}

User Make new Appeal Without Singpas Login
    [arguments]  ${NOPO}
    User Create New Appeal and Agree with Term Condition
    Choose Parking Apps Paid and Input Number   ${NOPO}
    Pop Up Window Base on Notice Type Display
    Click Number Add Button         ${VehicleNum3}
    Upload File   ${supportFile1}
    User See Document Uploaded on List
    Click on Button    Proceed to Personal Particulars
    Verify Pop up Alert Window on e-Service     Singpass    e-Service   Close
    Click on Button  Close

User See Address Data Filled with Auto-Populated
    User See Floor Unit Pop Up Window
    Get Building Name
    Get House Number

Input Valid Email Address Data on Personal Particular
    Scroll To Bottom Page
    e-serviceportal_logic.Input Email Address with   ${validemail}
    Confirmation Email Address  ${validemail}

User Try to Paste Email
    Scroll To Bottom Page
    e-serviceportal_logic.Input Email Address with   ${validemail}
    Paste Email

User Proceed to Personal Particular
    Click Offences Next Button
    Verify Pop up Alert Window on e-Service     Singpass    e-Service   Close

User Upload Unsupported File
    [Arguments]  ${doc1}
    Choose Parking Apps Paid and Input Number   ${NOPO}
    Verify Court Notice Pop Up Window
    Click Number Add Button
    Choose and Upload File   ${doc1}

User Upload Duplicate File
    Choose Parking Apps Paid and Input Number   ${NOPO}
    Verify Court Notice Pop Up Window
    Click Number Add Button     ${VehicleNum3}
    Upload File              ${supportFile1}  
    Choose and Upload File   ${supportFile1}

Input Valid Address Data on Personal Particular
    Scroll to Contact Number Section
    Input Street Name
    Input Building Name
    Input Block Number
    Input Floor Number
    Input Unit Number
    Input Driver Contact Number

User See No Error Message on Personal Particular Section
    Verify Error Message Not Display        Invalid full name. Please enter again.
    Verify Error Message Not Display        Invalid ID number. Please enter again.

User See No Error Message on Email Section
    Scroll To Bottom Page
    Verify Error Message Not Display        Invalid email address. Please enter again. 
    Verify Error Message Not Display        Please ensure that the confirmation email is correct.

User Fills all required Fields
    User Make new Appeal Without Singpas Login      ${NOPO}
    User Input Personal Data Particular Details  
    Get Address Data
    Input Valid Email Address Data on Personal Particular

User Input Personal Data Particular Details  
    Input Personal Particulars Name
    Select Personal Particular ID Type
    Input Personal Particular ID Number
    User Get Address with Input Postal Code    ${PostalCode}
    User See Floor Unit Pop Up Window
    Input Personal Particular Contact Number

User Proceed to Appeal Reason
    Scroll To Bottom Page
    Click on Button   Proceed to Appeal Reason

Get Address Data
    Get Building Name
    Get House Number

User Let Email Field Empty
    User Input Personal Data Particular Details  
    User Get Address with Input Postal Code           ${PostalCode}
    User See Floor Unit Pop Up Window
    User Proceed to Appeal Reason

User Input All Required Fields and Proceed Data
    User Make new Appeal Without Singpas Login     ${NOPO}  
    User Input Personal Data Particular Details  
    Input Valid Email Address Data on Personal Particular
    User Proceed to Appeal Reason

User Input Data As Driver
    User Input Text on Appeal Reason
    When User Is The Driver
    
User Want to Proceed Data without Enter Captcha
    Click on Button    Proceed to Appeal Confirmation
    Scroll To Bottom Page
    Click on Button    Submit

User Want to Proceed Data with Invalid Captcha
    Click on Button    Proceed to Appeal Confirmation
    Scroll To Bottom Page
    e-serviceportal_logic.Input Invalid Captcha
    Verify Error Message Display    Invalid captcha. Please enter again.

User Fill Valid Captcha
    Click on Button    Proceed to Appeal Confirmation
    Input Valid Captcha
    Click on Button    Submit

User Already Fill All Field with Valid Data
    User Input All Required Fields and Proceed Data
    User Input Text on Appeal Reason
    User Is The Driver
    Click on Button    Proceed to Appeal Confirmation
    Input Valid Captcha


#Gonna make it for Search appeal feature
User Landing on Search Appeal Page
    Verify Logo is Loaded
    Verify Check Outcome tab is Loaded

Search Appeal by NIRC Number Using 
    [arguments]  ${num}
    Click Check Outcome Tab
    Verify Check Outcome Page is Loaded
    Scroll To Bottom Page
    Click On Search Type
    Choose Search Type with NIRC
    Input Search Number         ${num}

Search Appeal by Transaction Number Using 
    [Arguments]     ${num}
    Click Check Outcome Tab
    Verify Check Outcome Page is Loaded
    Scroll To Bottom Page
    Choose Search Type with Transaction
    Input Search Number         ${num}

Search Appeal By NOPO Using
    [arguments]  ${NoticeNum}
    Click Check Outcome Tab
    Verify Check Outcome Page is Loaded
    Scroll to Bottom Page
    Choose Search Type with NOPO
    Input Search Number         ${NoticeNum}
    
Search Appeal by Vehicle Number Using
    [arguments]  ${NoticeNum}
    Click Check Outcome Tab
    Verify Check Outcome Page is Loaded
    Scroll to Bottom Page
    Choose Search Type with Vehicle Number
    Input Search Number         ${NoticeNum}

Input Search without Choose Type
    [arguments]  ${NoticeNum}
    Click Check Outcome Tab
    Verify Check Outcome Page is Loaded
    Scroll to Bottom Page
    Input Search Number         ${NoticeNum}
    Input Captcha and Click Search Button

Search without Input Value
    Click Check Outcome Tab
    Verify Check Outcome Page is Loaded
    Scroll to Bottom Page
    Choose Search Type with Vehicle Number
    Input Captcha and Click Search Button
    
Input Captcha and Click Search Button
    Input Captcha
    Scroll to Bottom Page
    Click Search Button

User Get Search Result
    [arguments]  ${searchtype}  ${number} 
    ${type}  Get Search Method
    Should be Equal   ${searchtype}   ${type}
    ${num}=  Get Search Number
    Should be Equal   ${number}   ${num}
    ${totalAppeal}=  Get Total Appeal Result
    Should Not be Equal   0  ${totalAppeal}

User Already Get Result on Search Appeal
    User Landing on Search Appeal Page
    Search Appeal By NOPO Using    ${NOPO}
    Input Captcha and Click Search Button
    User Get Search Result    Summon / Notice  ${NOPO}  

User Click New Search Button
    Scroll to Bottom Page
    Click New Search Button

Can Make Another Search
    User Direct to Search Appeal Page
    Search Appeal by Transaction Number Using    ${Trans_Number}
    Input Captcha and Click Search Button
    User Get Search Result    Transaction   ${Trans_Number}   

User Direct to Search Appeal Page
    ${currentURL}=  Get Location
    Should be equal      ${currentURL}

User Can See Pagination to Show All Result
    User Get Search Result    Summon / Notice  ${NOPO3} 
    Move Page and Verify Result

Move Page and Verify Result
    Scroll To Bottom Page
    Get Result and Verify
    Go to Next Page
    Scroll to Bottom Page
    Go to Previous Page

