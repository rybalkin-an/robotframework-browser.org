*** Settings ***
Library      Browser    timeout=20s
Variables    resources${/}configs${/}config.yaml


*** Keywords ***
Open Page
    [Arguments]    ${url}
    Browser.New Browser    ${BROWSER}    headless=${HEADLESS_VALUE}    slowMo=0:00:00.5
    ${har_config}=
        ...    BuiltIn.Create Dictionary
        ...    path=${OUTPUT_DIR}${/}har.file
        ...    omitContent=False
    ${vid_config}=
        ...    BuiltIn.Create Dictionary
        ...    dir=${OUTPUT_DIR}
    Browser.New Page    url=${url}