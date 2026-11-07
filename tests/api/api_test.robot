*** Settings ***
Documentation       REST API Automation Suite - Backend Verification & Test State Provisioning
Resource            ../../resources.robot

*** Keywords ***
Get Notice Details By Number
    [Arguments]     ${notice_id}=${TEST_NOTICE_NUM}
    [Documentation]    Fetches notice details via REST API to verify record existence.
    ${response}=    GET    ${API_BASE_URL}notices/${notice_id}    expected_status=200
    RETURN          ${response.json()}

Update Parking Record Session
    [Arguments]     ${record_id}    ${start_time}    ${end_time}
    [Documentation]    Updates session timestamp metadata via PATCH endpoint.
    ${today}=       Get Current Date    result_format=%Y-%m-%d
    ${payload}=     Create Dictionary
    ...             start_date=${today}T${start_time}:00.000Z
    ...             first_coupon_time=${today}T${end_time}:00.000Z
    ${response}=    PATCH    ${API_BASE_URL}records/${record_id}    json=${payload}    expected_status=200
    RETURN          ${response.json()}

Create Automated Test Session
    [Arguments]     ${carpark_id}    ${label}    ${vehicle_no}    ${session_date}
    [Documentation]    Provisions an automated parking/case session record before running UI assertions.
    ${body}=        Create Dictionary
    ...             session_id=1000010000100001
    ...             carpark_id=${carpark_id}
    ...             carpark_label=${label}
    ...             vehicle_no=${vehicle_no}
    ...             vehicle_type=CAR
    ...             session_start_time=${session_date}T08:00:00Z
    ...             session_end_time=${session_date}T10:00:00Z
    ...             status=PAID
    ${response}=    POST    ${API_BASE_URL}sessions    json=${body}    expected_status=201
    RETURN          ${response.json()}

Sync Portal State Data
    [Documentation]    Triggers backend synchronization job between portal services.
    ${response}=    GET    ${API_BASE_URL}sync-data/pull-case    expected_status=200
    RETURN          ${response.json()}
