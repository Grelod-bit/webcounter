*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Get Title  ==  Laskuri
    Get Text  body  *=  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click  button >> text=Paina
    Click  button >> text=Paina
    Get Text  body  *=  nappia painettu 2 kertaa

When counter has a nonzero value and it is reset the value becomes zero
    Go To  ${HOME_URL}
    Click  button >> text=Nollaa
    Get Text  body  *=  nappia painettu 0 kertaa

When a value is set the counter shows that value
    Set Counter Value  10
    Get Text  body  *=  nappia painettu 10 kertaa

When a value is set and button is pressed the counter increases from that value
    Set Counter Value  5
    Click  button >> text=Paina
    Get Text  body  *=  nappia painettu 6 kertaa

When a value is set and the counter is reset the value becomes zero
    Set Counter Value  10
    Click  button >> text=Nollaa
    Get Text  body  *=  nappia painettu 0 kertaa

When a new value is set it replaces the previous value
    Set Counter Value  7
    Set Counter Value  3
    Get Text  body  *=  nappia painettu 3 kertaa

When a value is not set and button is pressed nothing changes
    Set Counter Value  0
    Click  button >> text=Aseta
    Get Text  body  *=  nappia painettu 0 kertaa