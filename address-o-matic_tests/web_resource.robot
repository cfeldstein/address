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

