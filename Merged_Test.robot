*** Settings ***
Documentation   This Suite is to order product from Bol.com
Library			SeleniumLibrary
Library     RequestsLibrary


# Test Setup  Open Website
Suite Teardown    Close All Browsers





*** Variables ***
${BROWSER}		chrome
${TEST_SITE}     bol
${HOME_PAGE}     https://www.bol.com
${Base_URL}  https://api.bol.com/
${LOGIN_LINK}         //a[contains(@class,'u-show-block')]

${LOGIN_EMAIL}        //*[@id="login_email"]
${LOGIN_PASSWORD}     //*[@id="login_password"]
${USER_LOGIN}       jatuljain@gmail.com    
${USER_PASSWORD}    Bangalore123#

${LOGIN_BUTTON}     //*[@id="existinguser"]/fieldset/div[3]/input
${SEARCH_CONTAINS}  Samsung S6 lite
${SEARCH_RESULT}    Samsung Galaxy Tab S6 Lite
${ACCPET_COOKIE}    //*[@id="modalWindow"]/div[2]/div[2]/wsp-consent-modal/div[2]/div/div[1]/button
${SEARCH_FOR}       //*[@id="searchfor"]
${SEARCH_BUTTON}     //*[@id="siteSearch"]/div/button
${ADD_TO_CART}  //*[@id="9300000000132991"]
${CONTINUE_TO_ORDER}  //a[starts-with(., "Verder naar bestellen")]
${CONTINUE_ORDERING_TOP}     //*[@id="continue_ordering_top"]

*** Test Cases ***
Order ${SEARCH_CONTAINS} 
    Open Website
    Search for ${SEARCH_CONTAINS}
    Add to cart

Get the order status
    [Tags]    DEBUG
    Create Session   Get_Order_Detail  ${Base_URL}    verify=True
    ${response} =  get on session   Get_Order_Detail   retailer/orders
    log to console   ${response.status_code}
    log to console   ${response.content}



*** Keywords ***
Open Website
    Visit ${TEST_SITE} 
    Login to ${HOME_PAGE} 

Visit ${TEST_SITE} 
	Open Browser			${HOME_PAGE} 	${BROWSER}
	Click Element       ${ACCPET_COOKIE}
    Maximize Browser Window

Login to ${HOME_PAGE} 
   wait until page contains  Inloggen
   click element  ${LOGIN_LINK}
   wait until page contains  Inloggen
   press keys    ${LOGIN_EMAIL}     ${USER_LOGIN} 
   press keys    ${LOGIN_PASSWORD}  ${USER_PASSWORD}
   click element  ${LOGIN_BUTTON}

Search for ${SEARCH_CONTAINS}
    wait until page contains  Hallo Atul
    press keys      ${SEARCH_FOR}  ${SEARCH_CONTAINS}
    Wait Until Page Contains  ${SEARCH_RESULT} 
    click element  ${SEARCH_BUTTON}

Add to cart
    click element   ${ADD_TO_CART}
    Wait Until Page Contains  ${SEARCH_CONTAINS}  
    click element    ${CONTINUE_TO_ORDER}
    Wait Until Page Contains  ${SEARCH_RESULT} 
    click element       ${CONTINUE_ORDERING_TOP}
	Capture Page Screenshot


Close All Browsers
    close browser