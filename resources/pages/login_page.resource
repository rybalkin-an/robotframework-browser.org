*** Settings ***
Library    Browser
Variables    resources${/}locators${/}login_page.yaml

*** Variables ***
${Login Page Title Value}    Mein Tagesspiegel

*** Keywords ***
Open Login page
    Browser.New Browser    chromium    headless=No
    Browser.New Page    https://mein.tagesspiegel.de/
    Browser.Get Title    ==    ${Login Page Title Value}

Login
    [Arguments]    ${email}    ${password}
    Browser.Wait For Elements State    ${login page email input}    visible
    Browser.Fill Text    ${login page email input}    ${email}
    Browser.Fill Text    ${login page password input}    ${password}
    Browser.Click    ${login page anmelden button}
