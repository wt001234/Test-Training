*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/Keywords.robot
Resource        ../Resources/Keywords_Template.robot
Variables       ../Variables/Variables.py
# Test Setup    Launch Browser and Navigate to Url
# Test Teardown    Browser Close


*** Test Cases ***
Verify Invalid Login
    [Template]    Verify Invalid Login Template
    # Username    Password    Error Message
    standard    secret_sauce    Epic sadface: Username and password do not match any user in this service
    standard_user    secret    Epic sadface: Username and password do not match any user in this service
    locked_out_user    secret_sauce    Epic sadface: Sorry, this user has been locked out.
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required

Verify Product
    [Template]    Verify Shopping Cart Template
    # ${username}    ${password}    ${f} ${last} ${no} ${re} ${fN}    ${lN}    ${post}    ${total}    ${message}
    standard_user    secret_sauce    1    1    1    1    Tom    Jerry    12345    32.39    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    1    3    3    3    Jim    Justin    23456    60.45    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    1    5    5    5    Super    Man    66666    123.07    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    2    4    3    3    Tim    Burton    4567    82.05    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    3    6    4    4    Bat    Man    77777    97.16    THANK YOU FOR YOUR ORDER

Verify Product With Remove
    [Template]    Verify Shopping Cart Template With Remove
    # # ${username}    ${password}    ${f} ${last} ${no} ${i} ${re} ${fN}    ${lN}    ${post}    ${total}    ${message}
    standard_user    secret_sauce    1    2    2    1    1    Tom    Jerry    12345    10.79    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    1    3    3    2    2    Rick    Jame    23456    49.66    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    3    6    4    3    3    Bat    Man    4567    88.53    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    1    5    5    4    4    Jamy    Justin    4567    69.08    THANK YOU FOR YOUR ORDER
    standard_user    secret_sauce    1    6    6    5    5    Super    Man    4567    131.71    THANK YOU FOR YOUR ORDER
