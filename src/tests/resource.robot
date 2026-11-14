*** Settings ***
Library  Browser

*** Variables ***
${SERVER}    localhost:5001
${DELAY}     500ms
${HOME_URL}  http://${SERVER}
${BROWSER}   chromium
${HEADLESS}  false
${VALUE_INPUT}  input[name="value"]

*** Keywords ***
Open And Configure Browser
    IF  $HEADLESS == 'true'
        New Browser  browser=${BROWSER}  headless=True
    ELSE
        New Browser  browser=${BROWSER}  headless=False  slowMo=${DELAY}
    END
    New Context
    New Page  about:blank

Reset Counter
    Go To  ${HOME_URL}
    Click  button >> text=Nollaa

Set Counter Value
    [Arguments]  ${value}
    Fill Text  ${VALUE_INPUT}  ${value}
    Click  button >> text=Aseta
