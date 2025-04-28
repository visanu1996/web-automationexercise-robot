*** Variables ***
&{register_page_locator}    input_email=//form[@action="/signup"]/input[@name = 'email']    input_name=//*[@data-qa="signup-name"]     confirm_create=//button[@data-qa="signup-button"]    verify_text=New User Signup!
&{account_info}    verify_text=ENTER ACCOUNT INFORMATION    title_male=//div[@class='radio' and contains(@id,'gender1')]    title_female=//div[@class='radio' and contains(@id,'gender2')]    intput_password=password    dob_day=//*[@data-qa='days']    dob_month=//*[@data-qa='months']    dob_year=//*[@data-qa='years']
&{address_info}    verify_text=Address Information    fname=//input[@data-qa='first_name']    lname=//input[@data-qa='last_name']    address=//input[@data-qa='address']    country=//select[@data-qa='country']    state=//label[@for='state']/following-sibling::*    city_id=city    zipcode_id=zipcode    mobile_id=mobile_number
${create_account}    //*[@data-qa='create-account']
${confirm_account}    //*[@data-qa='continue-button']