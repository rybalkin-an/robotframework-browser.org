*** Settings ***
Library    Browser
Variables    resources/locators/registration_form.yaml

*** Keywords ***
Click Registrieren button
    Browser.Click    ${registrieren button}
    Browser.Wait For Elements State    ${email input}    visible    timeout=5 s

Fill registration form
    [Arguments]    ${email}    ${vorname}    ${nachname}
    Browser.Fill Text    ${email input}    ${email}
    Browser.Fill Text    ${vorname input}    ${vorname}
    Browser.Fill Text    ${nachname input}    ${nachname}

Click Jetzt Registrieren button
    Browser.Click    ${jetzt registrieren button}