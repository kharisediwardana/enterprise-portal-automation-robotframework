*** Settings ***
Documentation       Global Resource File - Coordinates Libraries, Imports, Variables & Media Assets
Library             Selenium2Library
Library             RequestsLibrary
Library             FakerLibrary
Library             BuiltIn
Library             String
Library             DateTime
Library             Collections
Library             OperatingSystem

# Configuration (Default to Staging; override via command-line -v ENV_NAME:SIT)
Resource            config/environment_staging.robot

# Framework Keyword Imports
Resource            keywords/logic/__LOGIC_IMPORTS.robot
Resource            keywords/page/__PAGE_IMPORTS.robot
Resource            helper.robot
Resource            tests/TestSetup.robot
Resource            tests/TestTeardown.robot

*** Variables ***
# ==============================================================================
# Tiered Dynamic Timeout Strategy
# ==============================================================================
${TURBO_TIMEOUT}        1s
${SHORT_TIMEOUT}        3s
${MEDIUM_TIMEOUT}       5s
${LONG_TIMEOUT}         10s
${SLEEP_TIMEOUT}        30s

# Default Browser Execution Configuration
${BROWSER}              Chrome
${HEADLESS}             false

# ==============================================================================
# Common Test Data (Sanitized & Anonymized)
# ==============================================================================
${DEFAULT_USER_NAME}    Alex Morgan
${DEFAULT_ID_NUM}       S9876543A
${DEFAULT_EMAIL}        alex.morgan@testdomain.local
${DEFAULT_DESCRIPTION}  Automated Regression Test Case Execution
${DEFAULT_POSTAL_CODE}  560645
${DEFAULT_CONTACT_NUM}  84517544

# ==============================================================================
# Cross-Platform Media Assets for File Upload Matrix Testing
# ==============================================================================
${SUPPORT_FILE_DOCX}    ${CURDIR}${/}Media${/}1.docx
${SUPPORT_FILE_XLSX}    ${CURDIR}${/}Media${/}1.xlsx
${SUPPORT_FILE_PDF}     ${CURDIR}${/}Media${/}1.pdf
${SUPPORT_FILE_PNG}     ${CURDIR}${/}Media${/}1.png
${SUPPORT_FILE_JPG}     ${CURDIR}${/}Media${/}1.jpg
${SUPPORT_FILE_CSV}     ${CURDIR}${/}Media${/}1.csv
${SUPPORT_FILE_ZIP}     ${CURDIR}${/}Media${/}1.zip
${SUPPORT_FILE_INVALID} ${CURDIR}${/}Media${/}1.zippp
${EMPTY_CSV}            ${CURDIR}${/}Media${/}Empty.csv
${INVALID_CSV}          ${CURDIR}${/}Media${/}invalidNotice.csv
