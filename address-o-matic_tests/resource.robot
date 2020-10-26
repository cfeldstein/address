*** Settings ***
Documentation       A resource file with reusable keywords and variables.
...
...                 This is a global resource file for both API and WEB tests
Library             String

*** Variables ***
${SERVER}           http://address-o-matic.herokuapp.com
${VALID USER}       test@you.com
${VALID PASSWORD}   123456
${EMPTY}

*** Keywords ***
Make Unique Number
    ${unique_num}       Generate Random String  6   0123456789
    [Return]            ${unique_num}

