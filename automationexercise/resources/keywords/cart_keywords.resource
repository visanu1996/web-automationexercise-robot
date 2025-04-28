*** Settings ***
Library    SeleniumLibrary
Resource    ../../import.robot
*** Keywords ***
verify_cart_item
    [Documentation]    to verify item qty by name
    [Arguments]    ${item_name}    &{product_view}
    ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    //a[.='${item_name}']/ancestor::tr
    IF    ${is_error}
        ${item_qty}    Get Text    //a[.='${item_name}']/ancestor::tr//button    
            IF    '${item_qty}' == '${product_view['qty']}'
                Log    verify that the qty value is match
            ELSE
                log    qty is not match
            END
    ELSE
        Log    No item was found with this name
    END

delete_cart_item_by_name
    [Documentation]    to delete cart item by name
    [Arguments]   @{item_list}
    
        FOR  ${item}  IN  @{item_list}
            ${is_error}    Run Keyword And Return Status    Wait Until Element Is Visible    //a[.='${item}']/ancestor::tr

            IF    ${is_error}
                common_keywords.Wait_until_element_visible_and_click    //a[.='${item}']/ancestor::tr//a[@class = "cart_quantity_delete"]
            ELSE
                log    ${item} not found in cart, can't delete it.
            END

        END
        

    # //a[.='Blue Top']/ancestor::tr//a[@class="cart_quantity_delete"]