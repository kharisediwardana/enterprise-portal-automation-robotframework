*** Settings ***
Documentation       Global Helper Utilities and Reusable Keywords for Portal Automation
Library             Selenium2Library
Library             FakerLibrary
Library             BuiltIn
Library             String
Library             DateTime
Library             OperatingSystem

*** Keywords ***
# ==============================================================================
# Viewport & Scrolling Utilities
# ==============================================================================

Scroll To Top Page
    [Documentation]    Smooth scrolls browser viewport to the top of the page.
    Execute Javascript      window.scrollTo(0, 0);
    Sleep   0.5s

Scroll To Bottom Page
    [Documentation]    Scrolls browser viewport to the very bottom of the document.
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight);
    Sleep   0.5s

Scroll Table Horizontally
    [Arguments]    ${table_selector}=table-responsive    ${offset}=250
    [Documentation]    Horizontally scrolls responsive data tables.
    Execute JavaScript   window.document.getElementsByClassName('${table_selector}')[0].scrollLeft += ${offset}

Scroll To Middle Of Page
    [Documentation]    Scrolls to middle coordinates.
    Execute Javascript      window.scrollTo(100, 400);
    Sleep   0.5s

Scroll To Section
    [Arguments]   ${section_text}
    [Documentation]    Locates and scrolls an element into view by visible text.
    Run Keyword And Ignore Error   Scroll Element Into View    xpath=//*[text()="${section_text}"]
    Sleep   0.5s

Scroll To Text
    [Arguments]   ${text}
    [Documentation]    Waits for summary data to load then scrolls target text into viewport.
    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//*[contains(text(),"${text}")]    timeout=5s
    Scroll Element Into View        xpath=//*[contains(text(),"${text}")]
    Sleep   0.5s

# ==============================================================================
# Dynamic Data Generation (FakerLibrary)
# ==============================================================================

Generate Random Email
    [Documentation]    Generates unique test email address for form inputs.
    ${email}=   FakerLibrary.Email
    RETURN      ${email}

Generate Random Name
    [Documentation]    Generates mock user full name.
    ${name}=    FakerLibrary.Name
    RETURN      ${name}

Generate Random Text Maximum Characters
    [Documentation]    Generates long mock text (up to 8,000 characters) for boundary testing.
    ${text}=    FakerLibrary.Text    max_nb_chars=8000    ext_word_list=None
    RETURN      ${text}

Generate Random Text 2000 Characters
    [Documentation]    Generates 2,500 characters of mock text for description inputs.
    ${text}=    FakerLibrary.Text    max_nb_chars=2500    ext_word_list=None
    RETURN      ${text}

Generate Random Short Text
    [Arguments]    ${chars}=10
    [Documentation]    Generates short random string.
    ${text}=    FakerLibrary.Text    max_nb_chars=${chars}    ext_word_list=None
    RETURN      ${text}

Generate Random Number
    [Arguments]     ${count}
    [Documentation]    Generates a random sample index between 1 and ${count}.
    ${index}=       Evaluate    random.sample(range(1, ${count}+1),1)[0]    random
    RETURN          ${index}

# ==============================================================================
# Resilient Interaction Helpers
# ==============================================================================

Wait And Click Element
    [Arguments]    ${locator}    ${timeout}=5s
    [Documentation]    Waits until an element is visible and enabled before clicking.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Click Element                    ${locator}

Wait And Input Text
    [Arguments]    ${locator}    ${text}    ${timeout}=5s
    [Documentation]    Waits until input field is ready, clears it, and types new text.
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Clear Element Text               ${locator}
    Input Text                       ${locator}    ${text}
