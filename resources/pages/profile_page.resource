*** Settings ***
Library    Browser
Variables    resources/locators/profile_page.yaml

*** Keywords ***
Validate User
    [Arguments]    ${email}    ${firstname}    ${lastname}
    Browser.Get Text    ${title}    contains    ${firstname}    ${lastname}
    Browser.Get Text    ${vorname value}    ==    ${firstname}
    Browser.Get Text    ${nachname value}    ==    ${lastname}
    Browser.Get Text    ${email value}    ==    ${email}
