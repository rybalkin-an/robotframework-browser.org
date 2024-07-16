*** Settings ***
Library    Browser
Variables    resources${/}locators${/}set_password_page.yaml

*** Variables ***
${Password Page Title Value}    Mein Tagesspiegel

*** Keywords ***
Open Set Password Page
    [Arguments]    ${verify-url}
    Browser.New Browser    chromium    headless=No
    Browser.New Page    ${verify-url}
    Browser.Get Title    ==    ${Password Page Title Value}

Set New Password
    [Arguments]    ${secret}
    Browser.Fill Secret    ${passwort}    $secret
    Browser.Fill Secret    ${passwort wiederholen}    $secret
    Browser.Click    ${speichern button}
