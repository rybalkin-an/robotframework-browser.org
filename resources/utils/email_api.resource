*** Settings ***
Library   Collections
Library   REST    https://www.1secmail.com/api/v1
Variables    resources${/}configs${/}config.yaml

*** Variables ***
${create_password_url_regex}    https:\/\/mein\.tagesspiegel\.de\/verify-token\/[a-f0-9]{40}

*** Keywords ***
_Get messages request
    [Arguments]    ${email}
    ${empty_list}    Create List
    ${login}    Set Variable    ${email.split('@')[0]}
    ${domain}    Set Variable    ${email.split('@')[1]}
    ${response}    REST.GET    /?action=getMessages&login=${login}&domain=${domain}
    Should Not Be Equal    ${response['body']}   ${empty_list}
    RETURN    ${response}

_Wait and get messages
    [Arguments]    ${email}
    ${response}    Wait Until Keyword Succeeds    ${RETRY_VALUE}    ${RETRY_INTERVAL_VALUE}    _Get messages request    ${email}
    RETURN    ${response['body']}

_Read message
    [Arguments]    ${email}    ${get_messages_response}
    ${login}    Set Variable    ${email.split('@')[0]}
    ${domain}    Set Variable    ${email.split('@')[1]}
    ${id}    Set Variable    ${get_messages_response[0]['id']}
    ${read_message_response}    REST.GET    /?action=readMessage&login=${login}&domain=${domain}&id=${id}
    RETURN    ${read_message_response['body']['htmlBody']}

_Extract URL from Email Content
    [Arguments]    ${read_message_response_body}
    ${url_from_email}    Get Regexp Matches    ${read_message_response_body}    ${create_password_url_regex}
    Length Should Be    ${url_from_email}    2
    RETURN    ${url_from_email}[0]

Get registration link from email
    [Arguments]    ${email}
    ${get_messages_response}    _Wait and get messages    ${email}
    ${read_messages_response_body}    _Read message    ${email}    ${get_messages_response}
    ${url_from_mail}    _Extract URL from Email Content    ${read_messages_response_body}
    Should Match Regexp    ${url_from_mail}    ${create_password_url_regex}
    RETURN    ${url_from_mail}

Create random email
    ${empty_list}    Create List
    ${response}    REST.GET    /?action=genRandomMailbox
    Should Not Be Equal    ${response['body']}   ${empty_list}
    RETURN    ${response['body'][0]}