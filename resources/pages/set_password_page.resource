*** Settings ***
Library    Browser
Variables    resources${/}locators${/}set_password_page.yaml

*** Variables ***
${PASSWORD_PAGE_TITLE_VALUE}    Mein Tagesspiegel

*** Keywords ***
Open Set Password Page
    [Arguments]    ${verify-url}
    Browser.New Browser    chromium    headless=No
    Browser.New Page    ${verify-url}
    Browser.Get Title    ==    ${PASSWORD_PAGE_TITLE_VALUE}

Set New Password
    [Arguments]    ${secret}
    Browser.Fill Secret    ${passwort}    $secret
    Browser.Fill Secret    ${passwort wiederholen}    $secret
    Browser.Click    ${speichern button}
