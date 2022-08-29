*** Settings ***
Library   SeleniumLibrary

*** Variables ***


*** Test Cases ***
Registering and Logging user in Demo App
    Create Webdriver    Chrome    executable_path=${CURDIR}/chromedriver.exe
    Go To   http://127.0.0.1:8080/
    Registering details   shahrukh   abcd1234   mohammed   shahrukh   +358123456789
    Login User
    Verify Details are correct
    [Teardown]   Close Browser



*** Keywords ***
Registering details
    [Arguments]   ${username}   ${password}   ${firstname}   ${lastname}   ${phone}
    Click Link   Register
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="username"]    ${username}
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="password"]    ${password}
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="firstname"]   ${firstname}
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="lastname"]   ${lastname}
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="phone"]   ${phone}
    Set Test Variable    ${username}
    Set Test Variable    ${password}
    Set Test Variable    ${firstname}
    Set Test Variable    ${lastname}
    Set Test Variable    ${phone}
    Wait Until Keyword Succeeds  4x  3  Click Element   //input[@type="submit"]

Login User
    Click Link   Log In
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="username"]    ${username}
    Wait Until Keyword Succeeds  4x  3  Input Text    //input[@name="password"]    ${password}
    Wait Until Keyword Succeeds  4x  3  Click Element   //input[@type="submit"]

Verify Details are correct
    ${username_form}   Get Text   //td[@id="username"]
    Should Be Equal As Strings    ${username_form}    ${username}
    ${firstname_form}   Get Text   //td[@id="firstname"]
    Should Be Equal As Strings   ${firstname_form}   ${firstname}
    ${lastname_form}   Get Text   //td[@id="lastname"]
    Should Be Equal As Strings   ${lastname_form}   ${lastname}
    ${phone_form}   Get Text   //td[@id="phone"]
    Should Be Equal As Strings  ${phone_form}  ${phone}





