*** Settings ***
Documentation       Lifecycle Management - Teardown, Failure Capture & Screenshot Management
Resource            ../resources.robot

*** Keywords ***
Capture Failed And Close All Browsers
    [Documentation]    Captures state diagnostics on failure and terminates all active browser sessions.
    Capture Page If Test Failed
    Close All Browsers

Capture Page If Test Failed
    [Documentation]    Dynamically captures timestamped screenshot to output directory if test status is FAIL.
    Set Screenshot Directory              ${OUTPUT_DIR}
    Run Keyword If Test Failed            Capture Page Screenshot    filename=failure-{index}.png

Delete Cookies And Close Browser
    [Documentation]    Flushes session storage and terminates browser instances.
    Delete All Cookies
    Close All Browsers

Capture Page If Test Failed Then Delete Cookies
    [Documentation]    Safely logs failure screenshot before wiping session state.
    Capture Page If Test Failed
    Delete All Cookies
