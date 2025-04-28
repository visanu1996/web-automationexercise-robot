*** Settings ***
Resource    ../../import.robot
*** Keywords ***
open website
    
    Open Browser    ${web_variables.WEB_BROWSER}    ${web_variables.WEB_DRIVER}
    Maximize Browser Window
    Sleep    3

page_verification
    [Documentation]    to verify that a web page contains the specific text you're looking for
    [Arguments]    ${verify}            
    Page Should Contain    ${verify}

homepage
    [Documentation]    go to home page
    Wait_until_element_visible_and_click    ${nav_bar['home_btn']}

sign_login_page
    [Documentation]    go to signin / login page
    Wait_until_element_visible_and_click    ${nav_bar['sign_login_btn']}

contact_us
    [Documentation]    go to contact us
    Wait_until_element_visible_and_click    ${nav_bar['contact_btn']}

cart_page
    [Documentation]    go to cart page
    Wait_until_element_visible_and_click    ${nav_bar['cart_btn']}
login
    [Documentation]    to use this keyword you can pass two parameter the first one is an *email* the second is a *password*
    [Arguments]    ${login_email}    ${login_password}
    Input Text    ${login_page_locator['email']}    ${login_email}    
    Input Password    ${login_page_locator['password']}    ${login_password}
    screen_capture    test_module=login
    Click Element    ${login_page_locator['confirm_login']}

screen_capture
    [Documentation]    Captures a screenshot and saves it with a timestamp.
    ...                Provide a test module name such as(e.g., login, register, shop).
    [Arguments]    ${test_module}
    ${date}    Get Current Date    result_format=%d%m%Y%H%M%S%f
    ${base_path}    Normalize Path    ${CURDIR}/../../results/snapshots/
    ${path}    Set Variable    ${base_path}/${test_module}/
    ${is_exist}    Run Keyword And Return Status    Directory Should Exist    ${path}
    Run Keyword If    not ${is_exist}    Create Directory    ${path}
    Sleep    1
    Screenshot.Set Screenshot Directory    ${path}
    Run Keyword And Ignore Error    Screenshot.Take Screenshot    ${date}    100%

go_to_text
    [Documentation]    Scroll to a text element on the current page.
    ...                *Best to use* if there is a single word you are trying to find.
    [Arguments]    ${goto}
    ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    //*[contains(text(), '${goto}')]    ${web_variables.global_wait}
    Run Keyword If    ${is_error}    Scroll Element Into View     //*[contains(text(), '${goto}')]    #for web it will be visible even when you can't see with you own eyes, if using with mobile add not at the front of ${is_error}
    Run Keyword If     not ${is_error}    Log    Text not found, can't go to it.
go_to_element
    [Documentation]    Scroll to an element on the current page.
    [Arguments]    ${element}
    ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    ${element}    ${web_variables.global_wait}
    Run Keyword If    ${is_error}    Scroll Element Into View     ${element}
    Run Keyword If     not ${is_error}    Log    Element not found, can't go to it.
sign_out
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${nav_bar['logout_btn']}    ${web_variables.global_wait}
    IF    ${status}
        Click Element    ${nav_bar['logout_btn']}
    ELSE
        Log    Can't sign out, Not login or can't find element.
    END
    
    
inform_contact
    [Documentation]    use this keyword to inform detail from contact page
    [Arguments]    ${first_name}    ${email}
    Input Text    name=${contact_locator['name']}    ${first_name}
    Input Text    name=${contact_locator['email']}    ${email}    
    Input Text    name=${contact_locator['subject']}    Testing Robotframework
    Input Text    name=${contact_locator['body']}    put your message here
#    Choose File    name=${contact_locator['file_upload']}    file_path
submit_contact_us
    Click Element    name=${contact_locator['submit_btn']}
    
test_cases_page
    [Documentation]    go to test cases page
    Wait_until_element_visible_and_click     ${nav_bar['test_cases_btn']}


Wait_until_element_visible_and_click
    [Documentation]    wait until element is Visible with for loop
    [Arguments]    ${element}
    ${is_visible}    Run Keyword And Return Status     Wait Until Element Is Visible    ${element}    ${web_variables.global_wait}
    FOR    ${counter}    IN RANGE    1    ${web_variables.global_count}
        IF    ${is_visible}      
            Click Element    ${element}    
            Exit For Loop
        END
    END
    Run Keyword If    not ${is_visible}    Log    Element not found.

Wait_until_element_visible_and_insert
    [Documentation]    wait until element is Visible with for loop
    [Arguments]    ${element}    ${text}
    ${is_visible}    Run Keyword And Return Status     Wait Until Element Is Visible    ${element}    ${web_variables.global_wait}
    FOR    ${counter}    IN RANGE    1    ${web_variables.global_count}
        IF    ${is_visible}    
            Input Text    ${element}    ${text}   
            Exit For Loop
        END
    END
    Run Keyword If    not ${is_visible}    Log    Element not found.

Home_subscribe
    [Documentation]    to subscribe at home page
    [Arguments]    ${email}=test@testtest.com    #change when you need to test with real email.
    go_to_element    ${footer['footer']}
    Sleep    2
    Wait_until_element_visible_and_insert    ${footer['subscribe_input']}     ${email}
    Wait_until_element_visible_and_click    ${footer['submit_btn']}