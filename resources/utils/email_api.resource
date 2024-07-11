*** Settings ***
Library   Collections
Library   DateTime
Library   REST    https://www.1secmail.com/api/v1

*** Variables ***
${create-password-url-regex}    https:\/\/mein\.tagesspiegel\.de\/verify-token\/[a-f0-9]{40}

*** Keywords ***
Get random email
    ${response}    REST.GET    /?action=genRandomMailbox
    ${email}    Set Variable    ${response['body'][0]}
    RETURN    ${email}

Get messages
    [Arguments]    ${email}
    ${login}    Set Variable    ${email.split('@')[0]}
    ${domain}    Set Variable    ${email.split('@')[1]}
    FOR    ${counter}    IN RANGE    1    30
        ${response}    GET    /?action=getMessages&login=${login}&domain=${domain}
        Exit For Loop If    ${response['body']} != []
    END
    ${get_messages_response}    Set Variable    ${response['body']}
    RETURN    ${get_messages_response}

Read message
    [Arguments]    ${email}    ${get_messages_response}
    ${login}    Set Variable    ${email.split('@')[0]}
    ${domain}    Set Variable    ${email.split('@')[1]}
    ${id}    Set Variable    ${get_messages_response[0]['id']}
    ${read_message_response}    REST.GET    /?action=readMessage&login=${login}&domain=${domain}&id=${id}
    ${read_message_response_body}    Set Variable    ${read_message_response['body']}
    RETURN    ${read_message_response_body['htmlBody']}

Extract URL from Email Content
    [Arguments]    ${read_message_response_body}
    ${regex}    Set Variable    https:\/\/mein\.tagesspiegel\.de\/verify-token\/[a-f0-9]{40}
    ${matches}    Get Regexp Matches    ${read_message_response_body}    ${regex}
    ${verify-url}    Set Variable If    ${matches}    ${matches}[0]    []
    Should Not Be Equal    ${verify-url}    []
    RETURN    ${verify-url}