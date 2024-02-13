*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary
Library  selenium

*** Variables ***
${implicit_wait_time}                       10s
${Notificaton_permission_allow_button}      com.android.permissioncontroller:id/permission_allow_button
${Walkthroughscreen1_Next_Button}           //android.widget.TextView[@text="Next"]
${Walkthroughscreen2_Next_Button}           //android.widget.TextView[@text="Next"]
${Walkthroughscreen3_Next_Button}           //android.widget.TextView[@text="Next"]
${Walkthroughscreen_login/signup}           //android.widget.TextView[@text="Login/Sign Up"]



####### Login #############

${Login_email}                                //android.widget.EditText
${Login_BUTTON}         //android.view.ViewGroup[@content-desc="Login"]
${OTP_1}          //android.widget.EditText[@content-desc="otpInput-0"]
${OTP_2}          //android.widget.EditText[@content-desc="otpInput-1"]
${OTP_3}          //android.widget.EditText[@content-desc="otpInput-2"]
${OTP_4}          //android.widget.EditText[@content-desc="otpInput-3"]
${OTP_5}          //android.widget.EditText[@content-desc="otpInput-4"]
${USP_SCREEN}              //android.widget.EditText[@text="Discover city, university, property"]
${Countrypage_UK}             //android.widget.TextView[@text="UK"]
${Citypage_London}           //android.widget.TextView[@text="London"]
${London_Homepage}      //android.widget.TextView[@text="London, UK"]


*** Test Cases ***
Open_Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName='emulator-5554'  appPackage=com.universityliving     appActivity=com.universityliving.MainActivity   automationName=UiAutomator2
    Sleep       10s
    Wait Until Element Is Visible    ${Notificaton_permission_allow_button}
    Click Element    ${Notificaton_permission_allow_button}
    Wait Until Page Contains Element    ${Walkthroughscreen1_Next_Button}
    Click Element    ${Walkthroughscreen1_Next_Button}
    Click Element    ${Walkthroughscreen2_Next_Button}
    Click Element    ${Walkthroughscreen3_Next_Button}
    Click Element    ${Walkthroughscreen_login/signup}
    Sleep    5s
    Input Text       ${Login_email}    pravin.garg@universityliving.com
    Click Element    ${Login_BUTTON}
    Sleep    5s
    Input Text                          ${OTP_1}    1
    Input Text                          ${OTP_2}    2
    Input Text                          ${OTP_3}    3
    Input Text                          ${OTP_4}    4
    Input Text                          ${OTP_5}    5
    Sleep   2s
    Click Element                       ${USP_SCREEN}
    Sleep   2s
    Click Element                       ${Countrypage_UK}
    Sleep   2s
    Click Element                       ${Citypage_London}
    Sleep   2s
    Wait Until Page Contains Element    ${London_Homepage}


