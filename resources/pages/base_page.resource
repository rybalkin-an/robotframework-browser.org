*** Settings ***
Library    OperatingSystem

*** Variables ***
${URL_PRODUCTION}    https://www.tagesspiegel.de/
${URL_STAGING}       https://staging.tagesspiegel.de/
${URL_TEST}          https://test1.tagesspiegel.de/

*** Keywords ***
Get Environment URL
    ${env}    Get Environment Variable    ENVIRONMENT    production
    ${url}=    Set Variable    ${URL_PRODUCTION}
    Run Keyword If    '${env}' == 'staging'    Set Variable    ${URL_STAGING}
    Run Keyword If    '${env}' == 'test'    Set Variable    ${URL_TEST}
    Run Keyword Unless    '${env}' == 'production'    Fail    Invalid environment: ${env}
    RETURN    ${url}