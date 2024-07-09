*** Settings ***
Library    Browser
Library    OperatingSystem
Library    String
Library    Collections
Resource    resources/pages/main_page.resource
Resource    resources/pages/registration_form.resource
Resource    resources/pages/set_password_page.resource
Resource    resources/pages/login_page.resource
Resource    resources/pages/profile_page.resource
Resource    resources/utils/email_api.resource
Resource    Resource.robot

*** Variables ***
${password}    Secret123!
${firstname}    vorhname
${lastname}     nachname

*** Test Cases ***
Registration
    ${email}    email_api.Get random email

    main_page.Open main page
    main_page.Accept Cookies
    main_page.Click Anmelden Button
    registration_form.Click Registrieren button
    registration_form.Fill registration form    ${email}    ${firstname}    ${lastname}
    registration_form.Click Jetzt Registrieren button
    
    ${get_messages_response}    email_api.Get messages    ${email}
    Log    ${get_messages_response}
    ${read_messages_response_body}    email_api.Read message    ${email}    ${get_messages_response}
    ${verify-url}    email_api.Extract URL from Email Content    ${read_messages_response_body}

    set_password_page.Open Set Password Page    ${verify-url}
    set_password_page.Set New Password    ${password}

    login_page.Open Login page
    login_page.Login    ${email}    ${password}

    profile_page.Validate User    ${email}    ${firstname}    ${lastname}

