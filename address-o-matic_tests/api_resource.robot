*** Settings ***
Documentation       A resource file with reusable keywords and variables.
...
...                 This is the API Resource File
Resource            resource.robot


*** Variables ***
${endpoint}         https://address-o-matic.herokuapp.com/
${api_root}         /api/v1

${get_all_users}    /users
