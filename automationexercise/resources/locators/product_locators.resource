*** Variables ***
#--------------------- product view Sections ----------------------------
&{product_details}    add=//button[contains(@class,'cart')]    qty=//input[contains(@name,'quantity')]    name=//div[@class='product-information']//h2    
...    category=//div[@class='product-information']//p[contains(.,'Category')]    
...    price=//div[@class='product-information']/span/span[contains(.,'Rs. ')]    availability=//div[@class='product-information']//b[contains(.,'Availability')]/parent::p    
...    condition=//div[@class='product-information']//b[contains(.,'Condition')]/parent::p    brand=//div[@class='product-information']//b[contains(.,'Brand')]/parent::p


&{carts}    add=//a[.='Add to cart']    success=//h4[.='Added!']    continue_shop=//button[.='Continue Shopping']    view_cart=//a/u[.='View Cart']
${first_product}    //a[@href='/product_details/1']






#--------------------- Category Sections ----------------------------
&{Category}    women=//a[@href='#Women']    men=//a[@href='#Men']    kid=//a[@href='#Kids']

&{Women_sub_category}    dress=//a[.='Dress 'and contains(@href,'category_product')]    tops=//a[.='Tops 'and contains(@href,'category_product')]    
...    saree=//a[.='Saree 'and contains(@href,'category_product')]

&{Men_sub_category}    t_shirt=//a[.='Tshirts 'and contains(@href,'category_product')]    jeans=//a[.='Jeans 'and contains(@href,'category_product')]

&{Kid_sub_category}    dress=//div[@id='Kids']//a[.='Dress 'and contains(@href,'category_product')]    
...    tops_and_shirt=//div[@id='Kids']//a[.='Tops & Shirts 'and contains(@href,'category_product')]

${search_product}    id=search_product
${search_submit}    id=submit_search
