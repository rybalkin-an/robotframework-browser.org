*** Settings ***
Library    Browser
Resource    resources${/}utils${/}browser_management.resource
Variables    resources${/}locators${/}set_password_page.yaml

*** Variables ***
${PASSWORD_PAGE_TITLE_VALUE}    Mein Tagesspiegel

*** Keywords ***
Open Set Password Page
    [Arguments]    ${verify_url}
    browser_management.Open Page    ${verify_url}
    Browser.Get Title    ==    ${PASSWORD_PAGE_TITLE_VALUE}

Set New Password
    [Arguments]    ${secret}
    Browser.Fill Secret    ${passwort}    $secret
    Browser.Fill Secret    ${passwort wiederholen}    $secret
    Browser.Click    ${speichern button}
