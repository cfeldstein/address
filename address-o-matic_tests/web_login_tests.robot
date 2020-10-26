*** Settings ***
Documentation       Web Login Tests for address-o-matic
...                 Tests to verify that a user login can succeed and
...                 fail correctly depending on the provided credentials.
...
...                 A user account must exist with the ${VALID USER} and ${VALID PASSWORD}
...                 credentials as defined in the the resource.robot file.
Resource            resource.robot
Resource            web_resource.robot
Library             SeleniumLibrary
Suite Setup         Open Browser to Login Page
Suite Teardown      Close Browser
Test Teardown       Go To Login Page

*** Test Cases ***
Validate Successful Login
    [Tags]  Web     Login       User
    Given The Browser is on the Login Page
    When Valid User Logs in With Password
    Then The User is Logged In


*** Keywords ***
The Browser is on the Login Page
    Page Should Contain             Sign In
    Page Should Contain Element     id:user_email
    Page Should Contain Element     id:user_password
    Page Should Contain Element     name:commit

Valid User Logs in With Password
    User Logs in with Password      ${VALID_USER}   ${VALID_PASSWORD}

The User is Logged In
    Page Should Contain             Signed in successfully.
    Page Should Contain Link        Sign out