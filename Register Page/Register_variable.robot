*** Variables ***
# Web Browser
${url}                                  https://automate-test.stpb-digital.com/register/
${browser}                              chrome
#Input Field
${locator_firstname}                  id=firstname
${locator_lastname}                   id=lastname
${locator_email}                      id=email
${locator_password}                   id=password
${locator_mobilephone}                id=mobile-phone
${group_name_gender}                  validation-basic-radio
${locator_signup_page}                id=btn-sign-up
${locator_modal_success}              css=body > div.MuiModal-root.MuiDialog-root.css-126xj0f > div.MuiDialog-container.MuiDialog-scrollPaper.css-16u656j > div > div:nth-child(2) > p   
${locator_reset_hyperlink}            id=reset
${locator_modal_success}                      xpath=/html/body/div[2]/div[3]/div/div[1]    
${locator_button_ok}                          id=btn-ok
# Drop Down List
${locator_dropdownlist_nationality}           id=nationality
${locator_dropdownlist_select-role}           id=select-role
${locator_dropdownlist_select-plan}           id=select-plan
${default_option_dropdownlist}                xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_sighup_button}                      id=btn-sign-up
${locator_hyperlink_sighin}                   xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a
# Check Box
${locator_check_box_SQL}                      name=courses.SQL
${locator_check_box_Test_Manual}              name=courses.Test Manual
${locator_check_box_Automate_Test}            name=courses.Automate Test
${locator_check_box_Automate_Test1}           name=courses.Automate Test2
# Error message
${locator_err_msg_firstname}                 css=#error-firstname
${locator_err_msg_lastname}                  id=error-lastname
${locator_err_msg_email}                     id=error-email
${locator_err_msd_email1}                    id=error-email
${locator_err_msg_password}                  id=error-password
${locator_err_msg_mobilephone}               id=error-mobile-phone
${locator_err_msd_gender}                    id=validation-basic-gender
${locator_err_msd_checkbox}                  id=validation-basic-courses
${locator_err_msd_nationality}               id=validation-basic-nationality
${locator_err_msd_select_role}               id=validation-role
${locator_err_msd_select_plan}               id=validation-plan