*** Settings ***
Library           Collections
Library    JSONLibrary


*** Variables ***
${ipvalidation}    1.1.1.1 is valid IP
@{ivs_ipv4}    85.25.23.0/24   85.26.23.0/24    20.2.2.128/25   20.2.2.128/25    85.26.23.0/24
${ip}   85.25.23.0/24
${to_div}   1000

*** Keywords ***
print the arguments
    [Arguments]    ${second}=${EMPTY}  ${third}=3   ${first}=1
    Log To Console   first is : ${first} , second is ${second}, third is ${third}



*** Test Cases ***
# Get Check IP address
#     ${ipvalidation}=  Convert To String    ${ipvalidation}
#     Should Not Contain    ${ipvalidation}    Invalid
#     List Should Contain Value    ${ivs_ipv4}    ${ip}


Get Data from JSON file
    # ${file}   Load Json From File    response.json

    # ${cidr}   Get Value From Json    ${file}    $..cidr
    # Log To Console    ${cidr}
    print the arguments   first=500
    ${Data}=   Evaluate   ${to_div} / 2
    Log To Console    ${ivs_ipv4}
    ${new_list}=  Remove Duplicates  ${ivs_ipv4}
     
    Log To Console    is withouth duplicate ${new_list}
    Log To Console    ${Data}
    Fail    msg=This Test is failed
