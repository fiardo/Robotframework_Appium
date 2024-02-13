*** Settings ***
Library    AppiumLibrary

*** Variables ***
${default_wait_time}    10s
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

*** Keywords ***
Custom Wait For Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${default_wait_time}

*** Test Cases ***
Login Case With Country(Uk) and City(London)
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName='emulator-5554'  appPackage=com.universityliving     appActivity=com.universityliving.MainActivity   automationName=UiAutomator2

    # Your test steps using the custom wait keyword
    Custom Wait For Element    ${Notificaton_permission_allow_button}
    Click Element    ${Notificaton_permission_allow_button}

    Custom Wait For Element    ${Walkthroughscreen1_Next_Button}
    Click Element    ${Walkthroughscreen1_Next_Button}

    Custom Wait For Element    ${Walkthroughscreen2_Next_Button}
    Click Element    ${Walkthroughscreen2_Next_Button}

    Custom Wait For Element    ${Walkthroughscreen3_Next_Button}
    Click Element    ${Walkthroughscreen3_Next_Button}

    Custom Wait For Element    ${Walkthroughscreen_login/signup}
    Click Element    ${Walkthroughscreen_login/signup}

    Custom Wait For Element    ${Login_email}
    Input Text    ${Login_email}    pravin.garg@universityliving.com

    Custom Wait For Element    ${Login_BUTTON}
    Click Element    ${Login_BUTTON}

    Custom Wait For Element    ${OTP_1}
    Input Text    ${OTP_1}    1

    Custom Wait For Element    ${OTP_2}
    Input Text    ${OTP_2}    2

    Custom Wait For Element    ${OTP_3}
    Input Text    ${OTP_3}    3

    Custom Wait For Element    ${OTP_4}
    Input Text    ${OTP_4}    4

    Custom Wait For Element    ${OTP_5}
    Input Text    ${OTP_5}    5

    Custom Wait For Element    ${USP_SCREEN}
    Click Element    ${USP_SCREEN}

    Custom Wait For Element    ${Countrypage_UK}
    Click Element    ${Countrypage_UK}

    Custom Wait For Element    ${Citypage_London}
    Click Element    ${Citypage_London}

    Custom Wait For Element    ${London_Homepage}
    Wait Until Page Contains Element    ${London_Homepage}
