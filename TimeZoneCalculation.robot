*** Settings ***
Library    DateTime
Library    Collections
Library    String
Library    timezonetest.py
Library    DaylightSavingTesting.py

*** Test Cases ***
Check for a DST on Future Date
    Get DST For A Date And Timezone    2024-04-16 13:39:33.129    Asia/Kolkata


Get DST Start and End Dates
    ${dst}    is dst
    IF   '${dst}' == '1'
        Log    DST is enabled
        ${add_hours}=  Set Variable   +2

    ELSE
        Log  DST is not Enabled
        ${add_hours}=  Set Variable  +1
    END
    Log  ${add_hours}

*** Keywords ***
Get DST For A Date And Timezone
    [Arguments]    ${cur_date}    ${timezone}=Europe/Amsterdam
    ${date_to_check} =    Add Time To Date    ${cur_date}    4 days
    ${date_to_check} =    Get Substring    ${date_to_check}    0    10
    ${dst_enable}=    Is Daylight Saving   ${date_to_check}    ${timezone}
    IF   '${dst_enable}' == 'True'
        Log    'Yes, date is in DayLight Saving'
    ELSE
        Log  'No, date is not in DayLight Saving'
    END
    [Return]    ${dst_enable}  

Get DST Start Date
    [Documentation]    Get the start date of daylight saving time
    ${utc}    Evaluate    pytz.timezone('UTC').localize(datetime.datetime.utcnow())
    ${la}     Evaluate    pytz.timezone('Europe/Amsterdam')
    ${local_time}    Evaluate    ${utc}.astimezone(${la})
    ${dst_start}    Evaluate    ${local_time}.date()
    [Return]    ${dst_start}

Get DST End Date
    [Documentation]    Get the end date of daylight saving time
    ${dst_end}    Evaluate    Get Sunday After 3rd Sunday in November
    [Return]    ${dst_end}

Get Sunday After 3rd Sunday in November
    ${november}    Set Variable    11
    ${third_sunday}    Evaluate    datetime.datetime(datetime.datetime.now().year, ${november}, 1) + datetime.timedelta(days=(6 - datetime.datetime(datetime.datetime.now().year, ${november}, 1).weekday() + 21))
    ${sunday_after_third}    Evaluate    ${third_sunday} + datetime.timedelta(days=7)
    [Return]    ${sunday_after_third}
