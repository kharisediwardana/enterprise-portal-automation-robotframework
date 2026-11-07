*** Settings ***
Documentation       Lifecycle Management - Browser Initialization & Environment Navigation
Resource            ../resources.robot

*** Keywords ***
Open Browser And Go To Public Portal
    [Documentation]    Initializes browser, maximizes viewport, and navigates to Public Portal.
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${HEADLESS}' == 'true'    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    Open Browser    ${PORTAL_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window

Navigate To Public Portal
    [Documentation]    Navigates active browser session to Public Portal.
    Go To    ${PORTAL_URL}

Open Browser And Go To Admin Portal
    [Documentation]    Initializes browser and navigates to Back-Office Admin Portal.
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${HEADLESS}' == 'true'    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    Open Browser    ${ADMIN_PORTAL_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    User Want to Login using selected User    Lead_Officer

Navigate To Admin Portal
    [Documentation]    Navigates active browser session to Admin Portal.
    Go To    ${ADMIN_PORTAL_URL}
    User Want to Login using selected User    Lead_Officer

Navigate With Clean Cookies
    [Documentation]    Navigates to URL and clears session cookies for clean state isolation.
    Go To    ${PORTAL_URL}
    Delete All Cookies
