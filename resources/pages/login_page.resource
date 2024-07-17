*** Settings ***
Library    Browser
Variables    resources${/}locators${/}login_page.yaml
Resource    base_page.resource

*** Variables ***
${LOGIN_PAGE_TITLE_VALUE}    Mein Tagesspiegel
${LOGIN_URL_PRODUCTION}    https://mein.tagesspiegel.de/
${LOGIN_URL_STAGING}       https://mein.staging.tagesspiegel.de/
${LOGIN_URL_TEST}          https://mein.test1.tagesspiegel.de/

*** Keywords ***
Open Login page
    Browser.New Browser    chromium    headless=No
    ${login page url}    base_page.Get URL based on Environment Variable    ${LOGIN_URL_PRODUCTION}     ${LOGIN_URL_STAGING}    ${LOGIN_URL_TEST}
    Browser.New Page     ${login page url}
    Browser.Get Title    ==    ${LOGIN_PAGE_TITLE_VALUE}

Login
    [Arguments]    ${email}    ${password}
    Browser.Wait For Elements State    ${login page email input}    visible
    Browser.Fill Text    ${login page email input}    ${email}
    Browser.Fill Text    ${login page password input}    ${password}
    Browser.Click    ${login page anmelden button}
