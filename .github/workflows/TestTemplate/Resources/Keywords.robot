*** Settings ***
Library         SeleniumLibrary
Library         String
Variables       ../Variables/Variables.py


*** Keywords ***
Launch Browser and Navigate to Url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Verify Login Page
    Title Should Be    ${title}

Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${username_loc}
    Input Text    ${username_loc}    ${username}

Input Passwords
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${password_loc}
    Input Text    ${password_loc}    ${password}

Submit Credentials
    Wait Until Element Is Visible    ${loginBtn_Loc}
    Click Button    ${loginBtn_Loc}

Verify Error Message
    [Arguments]    ${error_msg}
    wait until element is visible    ${errorMsg_Loc}
    element should contain    ${errorMsg_Loc}    ${error_msg}

clear error message
    Click Element    ${closeIcon_Loc}

Verify Product Page
    Wait Until Element Is Visible    ${product_lable_Loc}
    element should contain    ${product_lable_Loc}    Products

Browser Close
    Close Browser

add product to cart
    [Arguments]    ${firstIndex}    ${lastIndex}

    FOR    ${i}    IN RANGE    ${firstIndex}    ${lastIndex}+1
        click element    //div[@class='inventory_list']/div[${i}]//button
    END
    # click element    //div[@class='inventory_list']/div[1]//button
    # click element    //div[@class='inventory_list']/div[6]//button

verify product icon
    [Arguments]    ${no_prod}
    ${text}    get text    ${shopping_cart_badge_Loc}
    Element Text Should Be    ${shopping_cart_badge_Loc}    ${No_prod}

Click Icon and remove product from cart
    [Arguments]    ${index}
    click element    ${shopping_cart_icon_Loc}    # click shopping-cart icon
    click element    //div[@class='cart_item'][${index}]//button    # remove start from 1

Click shopping cart icon
    click element    ${shopping_cart_icon_Loc}

Verify shopping cart Item
    [Arguments]    ${remain}
    Wait Until Element Is Visible    ${cart_list_Loc}
    ${no_of_item}    get element count    ${cart_item_Loc}
    Should Be Equal As Strings    ${no_of_item}    ${remain}

click checkout button
    click link    ${checkoutBtn_Loc }

add customer information
    [Arguments]    ${firstName}    ${lastName}    ${postCode}
    wait until element is visible    ${checkout_info_Loc}
    input text    css:#first-name    ${firstName}
    input text    css:#last-name    ${lastName}
    input text    css:#postal-code    ${postCode}

click continue and Verify summary
    [Arguments]    ${total}
    click element    ${continueBtn_Loc}
    Wait Until Element Is Visible    ${summary_info_Loc}
    ${value}    get Text    ${summary_info_Loc}
    ${value}    Get Regexp Matches    ${value}    \\d{2,}\\.\\d+
    Run Keyword And Continue On Failure
    ...    Should Be Equal as Strings    ${value}[0]    ${total}

click finish & verify message
    [Arguments]    ${message}
    click element    ${finishBtn_Loc}
    Wait Until Element Is Visible    //h2
    Element text Should Be    //h2    ${message}

Click logout
    click element    ${burgerBtn_Loc}
    wait until element is visible    ${logoutBtn_Loc}
    click element    ${logoutBtn_Loc}
    Wait Until Element Is Visible    ${login_logo_Loc}
