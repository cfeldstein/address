*** Settings ***
Documentation       A resource file with reusable keywords and variables.
...
...                 The system specific keywords created here form our own
...                 domain specific language. They utilize keywords provided
...                 by the imported SeleniumLibrary.
Resource            resource.robot
Library             SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${DELAY}            0
${LOGIN URL}        ${SERVER}/
${WELCOME URL}      ${SERVER}/welcome.html
${ERROR URL}        ${SERVER}/error.html

*** Keywords ***

Open Browser to Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed  ${DELAY}
    Login Page Should Be Open

Go To Login Page
    Go To       ${LOGIN URL}

Login Page Should Be Open
    Title Should Be     Address-O-Matic

Welcome Page Should be Open
    Page Should Contain Link       Sign out

Sign up Page Should be Open
    Title Should Be     Sign up

User Logs in with Password
    [Arguments]    ${user_email}   ${user_password}
    Input Text          id:user_email       ${user_email}
    Input Password      id:user_password    ${user_password}
    Click Button        name:commit


New User logs in
    Input Text          user_email        test@you.com
    Input Password      user_password     123456
    Click Button        commit
    Page Should Contain Link       Sign out

the user should be able to log in
    Go to login page
    New User Logs in
    Welcome Page Should be Open