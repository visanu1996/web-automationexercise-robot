*** Settings ***
Resource    ../import.robot
Suite Setup    common_keywords.open website
Suite Teardown    Close All Browsers    
# 

*** Test Cases ***
Home Page Verify
    [Tags]    home_verify
    common_keywords.page_verification    Home    #if home is the current page it will reloading the page

Register
    [Tags]    regis
    common_keywords.sign_login_page
    register_keywords.register    testName23    robottesting1021@gmail.com
    common_keywords.go_to_text    Enter Account
    register_keywords.add_account_info    FakePassword!    dob=1994/1/1
    register_keywords.add_address_info    FirstName    LastName    india    0555555555
    screen_capture    test_module=register
    register_keywords.confirm_register
    register_keywords.confirm_account_create
    common_keywords.sign_out
    
Login
    [Tags]    login
    common_keywords.sign_login_page
    common_keywords.page_verification    ${login_page_locator['verify_text']}  
    common_keywords.screen_capture    test_module=login
    common_keywords.login    login_email=robottesting101@gmail.com    login_password=FakePassword!
    common_keywords.sign_out

Login Fault Account
    common_keywords.sign_login_page
    common_keywords.page_verification    ${login_page_locator['verify_text']}  
    common_keywords.screen_capture    test_module=login
    common_keywords.login    login_email=robottes10234@gmail.com    login_password=Fasword!
    common_keywords.page_verification    incorrect!
    common_keywords.screen_capture    test_module=login_failed

Signin Existing
    common_keywords.sign_login_page
    register_keywords.register    testName    robottesting10234@gmail.com 
    common_keywords.page_verification    exist!
    common_keywords.screen_capture    test_module=register_existing

Contact Us
    [Tags]    contact
    common_keywords.contact_us
    common_keywords.page_verification    contact
    common_keywords.inform_contact    first_name=    email=
    common_keywords.screen_capture    test_module=contact_us
    common_keywords.submit_contact_us

Products
    [Tags]    products
    product_keywords.product_page
    common_keywords.screen_capture    test_module=products
    product_keywords.view_product    product_id=1
    &{product}    product_keywords.get_product_view_text
    Log    ${product}
Verify Testcases Page
    [Tags]    testcases_page
    common_keywords.test_cases_page
    common_keywords.screen_capture    test_module=test_cases

Search Products
    [Tags]    search_product
    product_keywords.product_page
    product_keywords.search_product    product_name=Blue Top
    common_keywords.screen_capture    test_module=search product

Verify Home Page Subcription
    [Tags]    home_sub
    common_keywords.page_verification    Home
    common_keywords.Home_subscribe
    common_keywords.screen_capture    test_module=subscribe

Add Products in Cart
    [Tags]    shopping

    product_keywords.product_page
    common_keywords.page_verification    Category
    product_keywords.add_products    Blue Top    Fancy Green Top    Soft Stretch Jeans
    common_keywords.screen_capture    test_module=add_products
Verify Product quantity in Cart
    [Tags]    qty_cart
    
    product_keywords.product_page
    product_keywords.view_product    product_id=1
    product_keywords.set_product_quantity    4
    &{product}    product_keywords.get_product_view_text
    Log    product_view: &{product}
    common_keywords.cart_page
    cart_keywords.verify_cart_item    ${product['name']}    &{product} 
    common_keywords.screen_capture    test_module=cart_qty

Remove Products From Cart
    [Tags]    item_del
    
    product_keywords.product_page
    common_keywords.page_verification    Category
    product_keywords.add_products    Blue Top    Fancy Green Top    Soft Stretch Jeans
    cart_keywords.delete_cart_item_by_name    Blue Top    Fancy Green Top
    common_keywords.screen_capture    test_module=item_del

Create Account Via API
    [Tags]    regis_api
    ${result}    api_fetch   https://automationexercise.com/api/createAccount    post
    Log To Console    ${result}
    

Delete Account Via API
    [Tags]    delete_api        
    ${data}    Create Dictionary    email=${user['email']}    password=${user['password']}
    ${result}    api_fetch    https://automationexercise.com/api/deleteAccount    delete    ${data}
    Log To Console    ${result}


     