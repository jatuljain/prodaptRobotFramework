*** Settings ***
Library        Collections
Library        JSONLibrary
Library        String


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

*** Keywords ***
print the arguments
    [Arguments]    ${second}=${EMPTY}  ${third}=3   ${first}=1
    Log To Console   first is : ${first} , second is ${second}, third is ${third}

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
#     Run Keyword If  ('${response_json}'=='dslam ip address must be unique') or ('${response_json}'=='dslam node name must be unique') or ('${response_json}'=='eas service id must be unique')    
#     ...    Log   Expected error message received    
#     ...  ELSE   Fail   

playing with List
    ${list1}=   Create List    1  2  3  4
    ${sub_list1}=   Create List    2   1  3  4
    # ${expected_desc_service_ids} =    Set Variable    ${actual_asc_service_ids}
    Log  ${list1}
    List Should Contain Sub List    ${list1}    ${sub_list1}    	ignore_order=True
    # Lists Should Be Equal    ${list1}    ${sub_list1}


*** Test Cases ***
# Play with String
#     playng with String

Play with List
    playing with list

# Get Check IP address
#     ${ipvalidation}=  Convert To String    ${ipvalidation}
#     Should Not Contain    ${ipvalidation}    Invalid
#     List Should Contain Value    ${ivs_ipv4}    ${ip}


# Get Data from JSON file
#     # ${file}   Load Json From File    response.json

#     # ${cidr}   Get Value From Json    ${file}    $..cidr
#     # Log To Console    ${cidr}
#     # print the arguments   first=500
#     # ${Data}=   Evaluate   ${to_div} / 2
#     # Log To Console    ${ivs_ipv4}
#     # ${new_list}=  Remove Duplicates  ${ivs_ipv4}
     
#     # Log To Console    is withouth duplicate ${new_list}
#     # Log To Console    ${Data}
#     # Fail    msg=This Test is failed
#     ${2ndunusedvar}
#     Log To Console    \n ${tokenheader}

