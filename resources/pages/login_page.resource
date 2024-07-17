*** Settings ***
Library    Browser
Resource    resources${/}utils${/}url_management.resource
Resource    resources${/}utils${/}browser_management.resource
Variables    resources${/}configs${/}config.yaml
Variables    resources${/}locators${/}login_page.yaml
Variables    resources${/}constants${/}urls.yaml

*** Variables ***
${LOGIN_PAGE_TITLE_VALUE}    Mein Tagesspiegel

*** Keywords ***
Open Login page
    ${login page url}    url_management.Get URL based on Environment Variable    ${LOGIN_URL_PRODUCTION}     ${LOGIN_URL_STAGING}    ${LOGIN_URL_TEST}
    browser_management.Open Page    ${login page url}
    Browser.Get Title    ==    ${LOGIN_PAGE_TITLE_VALUE}

Login
    [Arguments]    ${email}    ${password}
    Browser.Wait For Elements State    ${login page email input}    visible
    Browser.Fill Text    ${login page email input}    ${email}
    Browser.Fill Text    ${login page password input}    ${password}
    Browser.Click    ${login page anmelden button}
