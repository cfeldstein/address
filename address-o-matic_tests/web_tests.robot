*** Settings ***
Documentation    Suite description

Resource          web_resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Login
    Given browser is opened to the login page
    When user logs in with password
    Then welcome page should be open

Create User
    Given browser is opened to the sign up page
    When a new user is signed up
    Then the user should be able to log in

*** Keywords ***
Browser is opened to the login page
    Open browser to login page

Browser is opened to the sign up page
    Open browser to login page
    Click Link      Sign up

User logs in with password
    Input Text          user_email        ${VALID_USER}
    Input Password      user_password     ${VALID_PASSWORD}
    Click Button        commit

A new user is signed up
    Input Text          user_email          test@you.com
    Input Password      user_password       123456
    Input Password      user_password_confirmation      123456
    Click Button        Sign up


