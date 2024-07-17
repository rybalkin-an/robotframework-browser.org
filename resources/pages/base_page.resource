*** Settings ***
Library    OperatingSystem

*** Keywords ***
Get URL based on Environment Variable
    [Arguments]    ${prod}    ${stage}    ${test}
    ${env}    Get Environment Variable    ENVIRONMENT    production
    ${url}=    Set Variable     ${prod}
    Run Keyword If    '${env}' == 'staging'    Set Variable    ${prod}
    Run Keyword If    '${env}' == 'test'    Set Variable   ${test}
    Run Keyword Unless    '${env}' == 'production'    Fail    Invalid environment: ${env}
    RETURN    ${url}