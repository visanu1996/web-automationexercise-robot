*** Variables ***

&{nav_bar}    home_btn=//a[.=' Home']    sign_login_btn=//a[@href='/login']    product_btn=//a[@href='/products']   cart_btn=//a[.=' Cart']    test_cases_btn=//i[contains(@class,'fa-list')]/parent::a[.=' Test Cases']    api_test_btn=//a[contains(.,'API Test')]    contact_btn=//a[contains(.,'Contact')]    logout_btn=//a[@href='/logout']
&{login_page_locator}    email=//form[@action="/login"]/input[@name = 'email']    password=password    confirm_login=//button[@data-qa="login-button"]    verify_text=Login to your account
&{contact_locator}    name=name    email=email    subject=subject    body=message    file_upload=upload_file    submit_btn=submit    verify_page=//h2[contains(.,'Feedback')]    #use most by name or id
&{footer}    footer=//p[contains(.,'Copyright ')]    subscribe_input=id=susbscribe_email    header=//h2[.='Subscription']    submit_btn=//button[@id='subscribe']
