*** Settings ***
Documentation    This Suite is to check about Order
Library     RequestsLibrary


*** Variables ***
${Base_URL}  https://api.bol.com/

*** Test Cases ***
Get the order status
    [Tags]    DEBUG
    Create Session   Get_Order_Detail  ${Base_URL}    verify=True
    ${response} =  get on session   Get_Order_Detail   retailer/orders
    log to console   ${response.status_code}
    log to console   ${response.content}

#    Provided precondition
#    When action
#    Then check expectations

*** Keywords ***
Provided precondition
#    Setup system under test