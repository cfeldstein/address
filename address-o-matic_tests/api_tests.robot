*** Settings ***
Documentation    Suite description
...
...
...             This is the api test

Resource          ./api_resource.robot
Library           RequestsLibrary
Library           Collections


*** Variables ***
${user_id_don}      32

*** Test Cases ***

List All Users
    [Documentation]     Tests GET all users
    [Tags]              GET User
    Get All Users

List User
    [Documentation]     Tests GET a user by ID
    [Tags]              GET User
    Get User            ${user_id_don}

Create a User
    [Documentation]     Tests POST a new user
    [Tags]              POST User
    Post New Dummy User

Edit a User
    [Documentation]     Tests PATCH a user
    [Tags]              PATCH User
    Patch User          ${user_id_don}

Remove a User
    [Documentation]     Tests DELETE a user
    [Tags]              DELETE User
    Delete a User       31

Get All Contacts For User
    [Documentation]     Tests GET all Contacts
    [Tags]              GET Contacts
    Get Contacts for User   ${user_id_don}

*** Keywords ***
Get All Users
    Create Session      address-o-matic     ${SERVER}
    ${get_response}     get request         address-o-matic     /api/v1/users
    status should be    200                 ${get_response}
    dictionary should contain key   ${get_response.json()}     users
    ${users}           get from dictionary  ${get_response.json()}     users
    ${users_list}      convert to list     ${users}
    ${count}            get length  ${users_list}
    should not be equal     ${count}    0

Get User
    [Arguments]  ${user_id}
    Create Session      address-o-matic     ${SERVER}
    ${get_request}      catenate    SEPARATOR=/  /api/v1/users   ${user_id}
    ${get_response}     get request         address-o-matic     ${get_request}
    status should be    200                 ${get_response}
    ${user_response}    get from dictionary  ${get_response.json()}     user
    dictionary should contain item  ${user_response}      first_name  Don

Post New Dummy User
    Create Session      address-o-matic     ${SERVER}
    ${unique_num}       Make Unique Number
    ${email}            catenate    SEPARATOR=  test    ${unique_num}   @you.com
    @{data}    Create Dictionary   email=${email}  password=123456   first_name=Dummy   last_name=User
    @{formData}    create dictionary  user=@{data}
    ${headers}     Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${post_response}     Post Request     address-o-matic    /api/v1/users   data=@{formData}   headers=${headers}
    status should be    200     ${post_response}

Patch User
    [Arguments]  ${user_id}
    Create Session      address-o-matic     ${SERVER}
    ${patch_request}     catenate    SEPARATOR=/  /api/v1/users   ${user_id}
    &{data}    Create Dictionary   last_name=User
    &{formData}    create dictionary  user=${data}
    &{headers}     Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${patch_response}     Patch Request     address-o-matic    ${patch_request}   data=${formData}   headers=${headers}
    status should be    200     ${patch_response}

Delete a User
    [Arguments]  ${user_id}
    Create Session      address-o-matic     ${SERVER}
    ${delete_request}     catenate    SEPARATOR=/  /api/v1/users   ${user_id}
    ${delete_response}     delete request  address-o-matic     ${delete_request}
    status should be    200     ${delete_response}

Get Contacts for User
    [Arguments]  ${user_id}
    Create Session          address-o-matic     ${SERVER}
    ${user_path}            catenate            SEPARATOR=/         /api/v1/users       ${user_id}
    ${contact_request}      catenate            SEPARATOR=/         ${user_path}        contacts
    ${contact_response}     get request         address-o-matic     ${contact_request}
    status should be        200                 ${contact_response}
    ${contact}              get from dictionary     ${contact_response.json()}     contacts
    ${contact_list}         convert to list     ${contact}
    log to console          ${contact_list}

Post New Contact for User
    [Arguments]  ${user_id}
    Create Session          address-o-matic     ${SERVER}
    ${unique_num}           Make Unique Number
    ${first_name}           catenate            SEPARATOR=          name        ${unique_num}
    ${user_path}            catenate            SEPARATOR=/         /api/v1/users       ${user_id}
    ${contact_request}      catenate            SEPARATOR=/         ${user_path}        contacts
    ${contact_response}     post request        address-o-matic     ${contact_request}
    status should be        200                 ${contact_response}
    ${contact}              get from dictionary     ${contact_response.json()}     contacts
    ${contact_list}         convert to list     ${contact}
    log to console          ${contact_list}


