*** Settings ***
Test Setup        Open Browser    https://www.104.com.tw/jobs/main/   chrome
Library           SeleniumLibrary
Library           DateTime
Resource          q4-config.resource


*** Test Cases ***
104 login
    [Documentation]  104 login
    Login
    Page Should Contain Element    xpath://div[@class="h2 mb-3"]    ${MY_NAME}
    Logout

*** Keywords ***
Login
    Maximize Browser Window
    Click Link    登入        
    Wait Until Page Contains    立即登入
    Input text    id=username    ${ACCOUNT} 
    Input text    id=password    ${PASSWORD}
    Click Button    id=submitBtn 
    Sleep    2s
    Click Element    css=#global_bk > ul > li.right > ul > li.personal
    Click Link    My104會員中心
    Sleep    3s
    ${WindowHandle} =  Get Window Handles
    Switch Window        ${WindowHandle}[0]
    Close Window    
    Switch Window        ${WindowHandle}[1]  

Logout
    Click Link   登出
