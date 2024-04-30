*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Register_variable.robot


*** Keywords ***
Open Register Page
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Kru P' Beam

Click DropDownList
    [Documentation]    ใส่ locator และ ตัวเลือก ของ DropDownList เพื่อเลือกตัวเลือกนั้นๆ
    [Arguments]    ${locator}    ${option}
    Click Element    ${locator}
    Wait Until Element Is Visible    ${option}
    Click Element    ${option}
    
Vertifly Error Messge Text Field
    [Documentation]    ตรวจสอบ error text ที่แสดงเมื่อไม่ได้กรอกข้อมูล
    [Arguments]    ${locator_error_msg}    ${error_msg}
    Wait Until Element Is Visible    ${locator_error_msg}
    ${txt}=    Get Text    ${locator_error_msg}
    Log To Console    ${txt}
    Should Be Equal As Strings    ${txt}    ${error_msg}     

Vertifly Register Success 
    Wait Until Element Is Visible    ${locator_modal_success}
    Click Element    ${locator_button_ok}
    Wait Until Page Contains    Kru P' Beam

Vertifly Input Required Text Field Register Page
    [Documentation]    กรอกข้อมูลบางส่วนหรือทั้งหมดในหน้า add page
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile_phone}    
    ...    ${gender}    ${check_box}    ${DropDownList}    ${locator-error-msg}    ${error_msg}
    Open Register Page
    Input Text    ${locator_firstname}    ${firstname}
    Input Text    ${locator_lastname}    ${lastname}
    Input Text    ${locator_email}    ${email}
    Input Text    ${locator_password}     ${password}
    Input Text    ${locator_mobilephone}    ${mobile_phone}

    IF  '${gender}' != '${EMPTY}'
        IF  ${gender} == 0
            Select Radio Button    ${group_name_gender}    male
        ELSE
            Select Radio Button    ${group_name_gender}    female
        END
    END

    IF    '${check_box}' != '${EMPTY}'
        IF  ${check_box} == 1
            Select Checkbox    ${locator_check_box_Test_Manual}
            Select Checkbox    ${locator_check_box_Automate_Test}
            Select Checkbox    ${locator_check_box_Automate_Test1}
        ELSE IF    ${check_box} == 2
            Select Checkbox    ${locator_check_box_SQL}
            Select Checkbox    ${locator_check_box_Automate_Test}
            Select Checkbox    ${locator_check_box_Automate_Test1}
        ELSE IF    ${check_box} == 3
            Select Checkbox    ${locator_check_box_SQL}
            Select Checkbox    ${locator_check_box_Test_Manual}
            Select Checkbox    ${locator_check_box_Automate_Test1}
        ELSE IF    ${check_box} == 4
            Select Checkbox    ${locator_check_box_SQL}
            Select Checkbox    ${locator_check_box_Test_Manual}
            Select Checkbox    ${locator_check_box_Automate_Test}
        ELSE 
            Select Checkbox    ${locator_check_box_SQL}
            Select Checkbox    ${locator_check_box_Test_Manual}
            Select Checkbox    ${locator_check_box_Automate_Test}
            Select Checkbox    ${locator_check_box_Automate_Test1}
        END
    END

    IF    ${DropDownList} == 1
        Click DropDownList    ${locator_dropdownlist_select-plan}      ${default_option_dropdownlist}
        Click DropDownList    ${locator_dropdownlist_nationality}      ${default_option_dropdownlist}
    ELSE IF    ${DropDownList} == 2
        Click DropDownList    ${locator_dropdownlist_select-role}      ${default_option_dropdownlist}
        Click DropDownList    ${locator_dropdownlist_nationality}      ${default_option_dropdownlist}
    ELSE IF    ${DropDownList} == 3
        Click DropDownList    ${locator_dropdownlist_select-plan}      ${default_option_dropdownlist} 
        Click DropDownList    ${locator_dropdownlist_select-role}      ${default_option_dropdownlist}
    ELSE 
        Click DropDownList    ${locator_dropdownlist_select-role}      ${default_option_dropdownlist}
        Click DropDownList    ${locator_dropdownlist_select-plan}      ${default_option_dropdownlist} 
        Click DropDownList    ${locator_dropdownlist_nationality}      ${default_option_dropdownlist}
    END
    
    Click Element    ${locator_signup_page}   

    IF  '${locator-error-msg}' != '${EMPTY}' and '${error_msg}' != '${EMPTY}'
        Vertifly Error Messge Text Field    ${locator-error-msg}    ${error_msg} 
        Close Browser  
    ELSE
        Vertifly Register Success
        Close Browser
    END
    
Input Required ALl Required Field 
    [Documentation]    กรอกข้อมูลทั้งหมดในหน้า add page
    Wait Until Element Is Visible    ${locator_firstname}
    Input Text    ${locator_firstname_}    phmuภูมิ
    Input Text    ${locator_lastname}    promพรม
    Input Text    ${locator_email}    phum01@gmail.com  
    Input Text    ${locator_password}    123456
    Input Text    ${locator_mobilephone}    0888888888
    Select Radio Button    ${group_name_gender}    female
    Select Radio Button    ${group_name_gender}    male
    Select Checkbox    ${locator_check_box_SQL}
    Select Checkbox    ${locator_check_box_Test_Manual}
    Select Checkbox    ${locator_check_box_Automate_Test}
    Select Checkbox    ${locator_check_box_Automate_Test1}
    Click DropDownList    ${locator_dropdownlist_nationality}    ${default_option_dropdownlist}
    Click DropDownList    ${locator_dropdownlist_select-role}    ${default_option_dropdownlist}
    Click DropDownList    ${locator_dropdownlist_select-plan}    ${default_option_dropdownlist}
    