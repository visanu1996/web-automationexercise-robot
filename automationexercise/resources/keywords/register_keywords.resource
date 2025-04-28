*** Settings ***
Resource    ../../import.robot
*** Keywords ***
register
    [Documentation]    to use this keyword you can pass two parameter the first one is an *email* the second is a *password*
    [Arguments]    ${register_name}    ${register_email}
    Input Text    ${register_page_locator['input_name']}    ${register_name}    
    Input Password    ${register_page_locator['input_email']}    ${register_email}
    Click Element    ${register_page_locator['confirm_create']}
    
add_account_info
    [Documentation]    for date of birth use this format only YYYY/M/D *ex. 1999/1/15*
    [Arguments]    ${password}    ${gender}=m    ${dob}=1999/1/31
    # gender section
    IF    '${gender}' == 'm'
        Click Element    ${account_info['title_male']}
    ELSE
        Click Element    ${account_info['title_female']}
    END

    
    Input Password     name=${account_info['intput_password']}   ${password} 

    # date of birth section    
    ${dob_parts}    Split String    ${dob}    /
    Select From List By Value    ${account_info['dob_day']}    ${dob_parts[2]}
    Select From List By Value    ${account_info['dob_month']}    ${dob_parts[1]}
    Select From List By Value    ${account_info['dob_year']}    ${dob_parts[0]}

add_address_info
    [Documentation]    to add more address info but most of it is mocking right now 
    ...    
    ...    and no need to waste your time to add it by yourself
    [Arguments]    ${fname}    ${lname}    ${country}    ${mob_no}
    common_keywords.go_to_text   ${address_info['verify_text']}
    Input Text    ${address_info['fname']}    ${fname}
    Input Text    ${address_info['lname']}    ${lname}
    Input Text    ${address_info['address']}    Test Address
    Input Text    ${address_info['state']}    Test State
    Input Text    id=${address_info['city_id']}    Test City
    Input Text    id=${address_info['zipcode_id']}    234234
    Input Text    id=${address_info['mobile_id']}    ${mob_no}
    
    #Select Country
    ${select_country}   Convert To Title Case    ${country}   
    Select From List By Value    ${address_info['country']}    ${select_country}
confirm_register
    [Documentation]    confirm create user on add address info page
    Click Element   ${create_account}


confirm_account_create
    common_keywords.page_verification    Account Created!
    Click Element    ${confirm_account}
    