*** Settings ***
Library        Collections
Library        JSONLibrary
Library        String
Library        DateTime
Library       timezonetest.py

*** Variables ***
${ipvalidation}    1.1.1.1 is valid IP
@{ivs_ipv4}    85.25.23.0/24   85.26.23.0/24    20.2.2.128/25   20.2.2.128/25    85.26.23.0/24
${ip}   85.25.23.0/24
${to_div}   1000
${token_header}    This is token Variables
${unusedvar}
${type}    "ACTIVATE:EAS:DSLAM:REGION:XPON"
${v_type}
${response_json}    eas service id must be unique

@{EAS_LIST}                             EAS67019229
${RFS_TYPE_EAS}                         eas


*** Keywords ***

list loop testing
    [Arguments]    ${v_rfs_service}      @{v_eas_list}
    Log To Console    the eas value is ${v_rfs_service}\n
    Log To Console    \nthe list value is @{v_eas_list}
    ${len_json_objs}   Get Length    ${v_eas_list}
    FOR    ${i}    IN RANGE    0    ${len_json_objs}
        log to Console   \n\n${v_eas_list}[${i}]

    END

# print the arguments
#     [Arguments]    ${second}=${EMPTY}  ${third}=3   ${first}=1
#     Log To Console   first is : ${first} , second is ${second}, third is ${third}

# playng with String
#     # @{a_type}=  Split String    ${type}  :
#     # ${v_type} =  Get From List	 ${a_type}   -1
#     # Log   ${v_type}
#     # ${type}=   Set Variable    "ACTIVATE:EAS:DSLAM:REGION:XPON"
#     # ${type_contains}=  Evaluate   "XPON" in ${type}
#     # Log    ${type_contains}
#     # IF  '${response_json}' == 'dslam ip address must be unique'
#     #     Log   Expected error message received
#     # ELSE IF  '${response_json}' == 'dslam node name must be unique'
#     #     Log   Expected error message received
#     # ELSE IF  '${response_json}' == 'eas service id must be unique'
#     #     Log   Expected error message received
#     # ELSE
#     #     Log   Did not receive expected error message
#     # END
#     Run Keyword If  ('${response_json}'=='dslam ip address must be unique') or
#  ('${response_json}'=='dslam node name must be unique') or ('${response_json}'=='eas service id must be unique')
#     ...    Log   Expected error message received
#     ...  ELSE   Fail

playing with List
    ${list1}=   Create List    1  2  3  4
    ${sub_list1}=   Create List    2   1  3  4
    # ${expected_desc_service_ids} =    Set Variable    ${actual_asc_service_ids}
    Log  ${list1}
    List Should Contain Sub List    ${list1}    ${sub_list1}    	ignore_order=True
    # Lists Should Be Equal    ${list1}    ${sub_list1}


Get Time Difference Between Utc And Local
    ${cur_utc_date} =    Get Current Date        UTC
    ${get_utc_time} =    Get Substring    ${cur_utc_date}    11    16
    # ${cur_local_date} =    Get Current Date    UTC    increment=2 hours
    # ${cur_local_date} =    Get Amsterdam Time
    ${cur_local_date} =    Get Current Date
    ${cur_local_date} =    Add Time To Date    ${cur_local_date}    +2 hours
    ${get_local_time} =    Get Substring    ${cur_local_date}    11    16
    ${expected_time} =    Subtract Time From Time     ${get_utc_time}    ${get_local_time}
    ${expected_time} =    Evaluate    ${expected_time}/60
    ${expected_time} =    Convert To String    ${expected_time}
    ${expected_time} =    Remove String    ${expected_time}    .0
    [Return]    ${expected_time}


*** Test Cases ***
Play with String
    log   playng with String

Convert Local Time to UTC
    [Tags]    time
    ${local_datetime}    Set Variable    2001-2-3 10:11:12
    ${naive}    Convert Date    ${local_datetime}    result_format=%Y-%m-%d %H:%M:%S
    ${local_tz}    Set Variable    America/Los_Angeles
    ${local_dt}    Convert Time Zone    ${naive}    from_zone=${local_tz}    to_zone=UTC
    ${utc_formatted}    Format Date    ${local_dt}    result_format=%Y-%m-%d %H:%M:%S
    Log    UTC time: ${utc_formatted}

Check utc timediff
    [Tags]    timediff
    ${time_diff_utc_local} =    Get Time Difference Between Utc And Local


Play with List this is Test Case
    [Documentation]    This test case demonstrates list operations.
    list loop testing    ${RFS_TYPE_EAS}    @{EAS_LIST}
    # playing with list

Get Check IP address
    [Documentation]    This test case checks if the IP address is valid and present in the list.
    ${ipvalidation}=  Convert To String    ${ipvalidation}
    Should Not Contain    ${ipvalidation}    Invalid
    List Should Contain Value    ${ivs_ipv4}    ${ip}


Get Data from JSON file
    # ${file}   Load Json From File    response.json

    # ${cidr}   Get Value From Json    ${file}    $..cidr
    # Log To Console    ${cidr}
    # print the arguments   first=500
    # ${Data}=   Evaluate   ${to_div} / 2
    # Log To Console    ${ivs_ipv4}
    # ${new_list}=  Remove Duplicates  ${ivs_ipv4}

    # Log To Console    is withouth duplicate ${new_list}
    # Log To Console    ${Data}
    # Fail    msg=This Test is failed
    ${2ndunusedvar}
    Log To Console    \n ${tokenheader}

