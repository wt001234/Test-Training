*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/Keywords.robot
Variables       ../Variables/Variables.py


*** Keywords ***
Verify Invalid Login Template
    [Arguments]    ${username}    ${password}    ${errMsg}
    Launch Browser and Navigate to Url
    Verify Login Page
    Input Username    ${username}
    Input Passwords    ${password}
    Submit Credentials
    Verify Error Message    ${errMsg}
    clear error message
    Browser Close

Verify Shopping Cart Template
    [Arguments]    ${username}    ${password}    ${firstIndex}    ${lastIndex}    ${no_prod}    ${remain}
    ...    ${firstName}    ${lastName}    ${postCode}    ${total}    ${message}
    Launch Browser and Navigate to Url
    Verify Login Page
    Input Username    ${username}
    Input Passwords    ${password}
    Submit Credentials
    Verify Product Page
    Add product to cart    ${firstIndex}    ${lastIndex}
    Verify product icon    ${no_prod}
    Click shopping cart icon
    Verify shopping cart Item    ${remain}
    Click checkout button
    Add customer information    ${firstName}    ${lastName}    ${postCode}
    click continue and verify summary    ${total}
    click finish & verify message    ${message}
    Click logout
    Browser Close

Verify Shopping Cart Template With Remove
    [Arguments]    ${username}    ${password}    ${firstIndex}    ${lastIndex}    ${no_prod}    ${index}
    ...    ${remain}    ${firstName}    ${lastName}    ${postCode}    ${total}    ${message}
    Launch Browser and Navigate to Url
    Verify Login Page
    Input Username    ${username}
    Input Passwords    ${password}
    Submit Credentials
    Verify Product Page
    Add product to cart    ${firstIndex}    ${lastIndex}
    Verify product icon    ${no_prod}
    Click Icon and remove product from cart    ${index}
    Verify shopping cart Item    ${remain}
    Click checkout button
    Add customer information    ${firstName}    ${lastName}    ${postCode}
    click continue and verify summary    ${total}
    click finish & verify message    ${message}
    Click logout
    Browser Close
