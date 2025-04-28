*** Settings ***
Library    SeleniumLibrary

*** Variables ***
@{list}    test1    test2    test3    test4
&{dict}    d1=test1    d2=test2    d3=test3

*** Keywords ***
for_loop
    [Arguments]    @{item}
    FOR    ${element}    IN    @{item}
        Log To Console    ${element}
    END
for_loop2
    [Arguments]    &{item}
    FOR    ${key}    ${value}    IN    &{item}
        Log To Console    Key: ${key}, Value: ${value}
    END
