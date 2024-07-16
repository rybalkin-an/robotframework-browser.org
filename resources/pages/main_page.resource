*** Settings ***
Library    Browser
Resource    base_page.resource
Variables    resources${/}locators${/}main_page.yaml
Variables    resources${/}locators${/}registration_form.yaml

*** Variables ***
${Main Page Title Value}    Aktuelle News: Nachrichten aus Berlin und der Welt

*** Keywords ***
Open main page
    ${url}    base_page.Get URL based on Environment Variable
    Browser.New Browser    chromium    headless=No
    Browser.New Page    ${url}
    Browser.Get Title    ==    ${Main Page Title Value}

Accept Cookies
    Browser.Click     ${alle akzeptieren button}
    Browser.Wait For Elements State    ${alle akzeptieren button}    hidden

Click Anmelden Button
    Browser.Click    ${anmelden button}
    Browser.Wait For Elements State    ${registrieren button}    visible