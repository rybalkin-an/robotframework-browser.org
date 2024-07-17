*** Settings ***
Library    Browser
Resource    base_page.resource
Variables    resources${/}constants${/}urls.yaml
Variables    resources${/}locators${/}main_page.yaml
Variables    resources${/}locators${/}registration_form.yaml

*** Variables ***
${MAIN_PAGE_TITLE_VALUE}   Aktuelle News: Nachrichten aus Berlin und der Welt

*** Keywords ***
Open main page
    ${url}    base_page.Get URL based on Environment Variable    ${URL_PRODUCTION}     ${URL_STAGING}    ${URL_TEST}
    Browser.New Browser    ${BROWSER}    headless=${HEADLESS_VALUE}
    Browser.New Page    ${url}
    Browser.Get Title    ==    ${MAIN_PAGE_TITLE_VALUE}

Accept Cookies
    Browser.Click     ${alle akzeptieren button}
    Browser.Wait For Elements State    ${alle akzeptieren button}    hidden

Click Anmelden Button
    Browser.Click    ${anmelden button}
    Browser.Wait For Elements State    ${registrieren button}    visible