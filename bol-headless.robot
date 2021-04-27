*** Settings ***
Library			SeleniumLibrary

Suite Teardown    Close All Browsers

Test Setup  Open Chrome


*** Variables ***
${BROWSER}		chrome
${HOME_PAGE}     https://www.bol.com
${LOGIN_LINK}        /html/body/div/header/div/div[3]/a[1]/span
#${LOGIN_LINK}        h-block--inline  vatop
${LOGIN_EMAIL}        //*[@id="login_email"]
${LOGIN_PASSWORD}     //*[@id="login_password"]
${LOGIN_BUTTON}     //*[@id="existinguser"]/fieldset/div[3]/font/font/input

${SEARCH_CONTAINS}    Samsung S6 lite
${ACCPET_COOKIE}    //*[@id="modalWindow"]/div[2]/div[2]/wsp-consent-modal/div[2]/div/div[1]/button
${SEARCH_FOR}       //*[@id="searchfor"]
${SEARCH_BUTTON}     //*[@id="siteSearch"]/div/button
${ADD_TO_CART}  //*[@id="9300000000132991"]



*** Keywords ***

Open Chrome
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}




*** Test Cases ***
Visit Bol
	Go To			${HOME_PAGE}
	Click Element       ${ACCPET_COOKIE}

#Login to bol.com
#    wait until page contains  Inloggen
#    Click Link       href=${LOGIN_LINK}
##    click link  ${LOGIN_LINK}
#    press keys    ${LOGIN_EMAIL}
#    press keys    ${LOGIN_PASSWORD}
#    click element  ${LOGIN_BUTTON}

Search for ${SEARCH_CONTAINS}
    press keys      ${SEARCH_FOR}     ${SEARCH_CONTAINS}
    click element  ${SEARCH_BUTTON}

Add to cart
    click element   ${ADD_TO_CART}
    Wait Until Page Contains  Het artikel is toegevoegd aan je winkelwagen
#    click element   /html/body/div[3]/div[2]/div[3]/div[1]/div/div[2]/div/a
#    click element    xpath=(//h2[contains(text(),'Verder naar bestellen')])

#	Capture Page Screenshot

Close All Browsers
#    close browser