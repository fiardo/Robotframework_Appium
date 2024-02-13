*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary
Library    Telnet

*** Variables ***
${Notificaton_permission_allow_button}      com.android.permissioncontroller:id/permission_allow_button
${Walkthroughscreen1_Next_Button}           //android.widget.TextView[@text="Next"]
${Walkthroughscreen2_Next_Button}           //android.widget.TextView[@text="Next"]
${Walkthroughscreen3_Next_Button}           //android.widget.TextView[@text="Next"]
${Walkthroughscreen_login/signup}           //android.widget.TextView[@text="Login/Sign Up"]



####### Login #############

${Login_email}     //android.widget.EditText
${Login_BUTTON}   //android.view.ViewGroup[@content-desc="Login"]
#(//android.widget.TextView[@text="Login"])[2]




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
    #Click Element    ${Login_email}
    Sleep    5s
    Input Text       ${Login_email}    pravin.garg@universityliving.com
    Click Element    ${Login_BUTTON}
    Sleep    5s




