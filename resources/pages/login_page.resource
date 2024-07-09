*** Settings ***
Library    Browser
Variables    resources/locators/login_page.yaml

*** Keywords ***
Open Login page
    Browser.New Browser    chromium    headless=No
    Browser.New Page    https://mein.tagesspiegel.de/
    Browser.Get Title    ==    Mein Tagesspiegel

Login
    [Arguments]    ${email}    ${password}
    Browser.Wait For Elements State    ${login page email input}    visible    5 s
    Browser.Fill Text    ${login page email input}    ${email}
    Browser.Fill Text    ${login page password input}    ${password}
    Browser.Click    ${login page anmelden button}
