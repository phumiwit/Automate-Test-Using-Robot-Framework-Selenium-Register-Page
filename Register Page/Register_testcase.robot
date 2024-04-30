*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Register_keyword.robot
Suite Setup    Set Selenium Speed    0.1
Test Setup    Open Register Page
Test Teardown    Close Browser
*** Test Cases ***
TC-001 Check Input All Text Field and Sign up Success Case
    [Tags]    Success
    [Setup]
    Vertifly Input Required Text Field Register Page    phum    prom    phum@gmil.com    123456    0888888888    0    0    0    ${EMPTY}    ${EMPTY}            
    [Teardown]
    
TC-002 Check One Input Missing Text Field and Sign up Failed Case
    [Documentation]    ตรวจสอบการ Click Sign Up Button เมื่อไม่มีการกรอกข้อมูลหรือกรอกข้อมูลผิดใน Text Field นั้นๆ
    [Tags]    Failed
    [Setup]
    [Template]    Vertifly Input Required Text Field Register Page          
    ${EMPTY}    prom        phum@gmil.com    123456      0888888888    0           0    0    ${locator_err_msg_firstname}    This field is required   
    phum        ${EMPTY}    phum@gmil.com    123456      0888888888    0           0    0    ${locator_err_msg_lastname}    This field is required   
    phum        prom        ${EMPTY}         123456      0888888888    0           0    0    ${locator_err_msd_email1}    This field is required   
    phum        prom        phumgmil.com     123456      0888888888    0           0    0    ${locator_err_msd_email1}    Invalid email address 
    phum        prom        phum@gmil.com    ${EMPTY}    0888888888    0           0    0    ${locator_err_msg_password}    This field is required   
    phum        prom        phum@gmil.com    123456      ${EMPTY}      0           0    0    ${locator_err_msg_mobilephone}    This field is required   
    phum        prom        phum@gmil.com    123456      0888888888    ${EMPTY}    0    0    ${locator_err_msd_gender}    This field is required   
    phum        prom        phum@gmil.com    123456      0888888888    0           0    1    ${locator_err_msd_select_role}    This field is required   
    phum        prom        phum@gmil.com    123456      0888888888    0           0    2    ${locator_err_msd_select_plan}    This field is required   
    phum        prom        phum@gmil.com    123456      0888888888    0           0    3    ${locator_err_msd_nationality}    This field is required 
    [Teardown]


TC-003 Check Reset HyperLink Success Case
    [Tags]    Success
    [Documentation]    ตรวจสอบการ Click Reset HyperLink เมื่อมีการกรอกข้อมูลครบถ้วน
    Input Required ALl Required Field 
    Scroll Element Into View    ${locator_reset_hyperlink}       
    Click Element    ${locator_reset_hyperlink}           
    Click Element    ${locator_signup_page}
    Wait Until Element Is Not Visible    ${locator_modal_success}

   