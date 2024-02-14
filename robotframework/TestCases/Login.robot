*** Settings ***
Library    AppiumLibrary

*** Variables ***
${default_wait_time}    10s
${implicit_wait_time}   10s
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
${Hamburger}        //android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/com.horcrux.svg.SvgView/com.horcrux.svg.GroupView/com.horcrux.svg.PathView
${LoggedIn_email}        //android.widget.TextView[@text="pravin.garg@universityliving.com"]

*** Keywords ***
Custom Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${default_wait_time}
    Click Element    ${locator}

Custom Wait And Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    timeout=${default_wait_time}
    Input Text    ${locator}    ${text}

*** Test Cases ***
Test Case 1 - Login with OTP
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName='emulator-5554'  appPackage=com.universityliving     appActivity=com.universityliving.MainActivity   automationName=UiAutomator2

    # Your concise test steps using the custom wait and action keywords
    Custom Wait And Click    ${Notificaton_permission_allow_button}
    Custom Wait And Click    ${Walkthroughscreen1_Next_Button}
    Custom Wait And Click    ${Walkthroughscreen2_Next_Button}
    Custom Wait And Click    ${Walkthroughscreen3_Next_Button}
    Custom Wait And Click    ${Walkthroughscreen_login/signup}
    Custom Wait And Input Text    ${Login_email}    pravin.garg@universityliving.com
    Custom Wait And Click    ${Login_BUTTON}
    Custom Wait And Input Text    ${OTP_1}    1
    Custom Wait And Input Text    ${OTP_2}    2
    Custom Wait And Input Text    ${OTP_3}    3
    Custom Wait And Input Text    ${OTP_4}    4
    Custom Wait And Input Text    ${OTP_5}    5
    Custom Wait And Click    ${USP_SCREEN}
    Custom Wait And Click    ${Countrypage_UK}
    Custom Wait And Click    ${Citypage_London}
    Custom Wait And Click    ${Hamburger}
    Wait Until Page Contains Element    ${LoggedIn_email}
