*** Settings ***
Library    OperatingSystem

*** Keywords ***
Get URL based on Environment Variable
    [Arguments]    ${prod}    ${stage}    ${test}
    ${env}    Get Environment Variable    ENVIRONMENT    production
    Run Keyword Unless    '${env}' in ['production', 'staging', 'test']    Fail    Invalid environment: ${env}
    ${url}    Run Keyword If    '${env}' == 'production'    Set Variable    ${prod}
    ...    ELSE IF    '${env}' == 'staging'    Set Variable    ${stage}
    ...    ELSE IF    '${env}' == 'test'    Set Variable    ${test}
    RETURN   ${url}