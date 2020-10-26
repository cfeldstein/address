*** Settings ***
Documentation       Web Invalid Login Tests for address-o-matic
...                 Tests to verify that the login page enforces required inputs and rejects
...                 login attempts from invalid users.
Resource            resource.robot
Resource            web_resource.robot
Library             SeleniumLibrary
Suite Setup         Open Browser to Login Page
Suite Teardown      Close Browser
Test Setup          Go To Login Page
Test Template       Login With Invalid Credentials Should Fail

*** Test Cases ***          USER NAME           PASSWORD
Invalid Username            invalid             ${VALID_PASSWORD}
Invalid Password            ${VALID_USER}       invalid
Invalid Both                invalid             invalid
Empty Username              ${EMPTY}            ${VALID_PASSWORD}
Empty Password              ${VALID_USER}       ${EMPTY}
Empty Both                  ${EMPTY}            ${EMPTY}


*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]     ${user}     ${password}
    User Logs in with Password      ${user}     ${password}
    Login Should Have Failed

Browser is opened to the sign up page
    Open browser to login page
    Click Link      Sign up

A new user is signed up
    Input Text          user_email          test@you.com
    Input Password      user_password       123456
    Input Password      user_password_confirmation      123456
    Click Button        Sign up

Login Should Have Failed
    Page Should Contain         Invalid Email or password.


