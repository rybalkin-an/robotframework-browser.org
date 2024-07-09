*** Settings ***
Library    Browser
Variables    resources/locators/main_page.yaml
Variables    resources/locators/registration_form.yaml

*** Keywords ***
Open main page
    Browser.New Browser    chromium    headless=No
    Browser.New Page    https://www.tagesspiegel.de/
    Browser.Get Title    ==    Aktuelle News: Nachrichten aus Berlin und der Welt

Accept Cookies
    Browser.Click     ${alle akzeptieren button}

Click Anmelden Button
    Browser.Click    ${anmelden button}
    Browser.Wait For Elements State    ${registrieren button}    visible    timeout=5 s