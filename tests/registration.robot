*** Settings ***
Library    Browser
Library    String
Resource    resources${/}pages${/}main_page.resource
Resource    resources${/}pages${/}registration_form.resource
Resource    resources${/}pages${/}set_password_page.resource
Resource    resources${/}pages${/}login_page.resource
Resource    resources${/}pages${/}profile_page.resource
Resource    resources${/}utils${/}email_api.resource

*** Variables ***
${password}    Secret123!
${firstname}    vorhname
${lastname}     nachname

*** Test Cases ***
Register new user
    ${email}    email_api.Create random email

    main_page.Open main page
    main_page.Accept Cookies
    main_page.Click Anmelden Button

    registration_form.Click Registrieren button
    registration_form.Fill registration form    ${email}    ${firstname}    ${lastname}
    registration_form.Click Jetzt Registrieren button
    
    ${verify-url}    email_api.Get registration link from email     ${email}

    set_password_page.Open Set Password Page    ${verify-url}
    set_password_page.Set New Password    ${password}

    login_page.Open Login page
    login_page.Login    ${email}    ${password}

    profile_page.Verify user is logged in    ${email}    ${firstname}    ${lastname}

