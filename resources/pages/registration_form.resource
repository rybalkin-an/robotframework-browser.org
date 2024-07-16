*** Settings ***
Library    Browser
Variables    resources${/}locators${/}registration_form.yaml

*** Variables ***
${message}    In Kürze erhalten Sie eine E-Mail, mit der Sie Ihr Konto aktivieren und sich ein Passwort vergeben können.

*** Keywords ***
Click Registrieren button
    Browser.Click    ${registrieren button}
    Browser.Wait For Elements State    ${vorname input}    visible
    Browser.Wait For Elements State    ${nachname input}    visible

Fill registration form
    [Arguments]    ${email}    ${vorname}    ${nachname}
    Browser.Fill Text    ${email input}    ${email}
    Browser.Fill Text    ${vorname input}    ${vorname}
    Browser.Fill Text    ${nachname input}    ${nachname}

Click Jetzt Registrieren button
    Browser.Click    ${jetzt registrieren button}
    Browser.Get Element    text=${message}