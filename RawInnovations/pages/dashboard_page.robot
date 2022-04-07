*** Settings ***
Documentation   This File Contains all the Page Objects and Keywords for Evernote Dashboard Page
Library       SeleniumLibrary
Resource      ../CommonLibrary/StringManipulation.robot

*** Variables ***
# All Dashboard Page Object Elements
${CreateNote_Link}              //div[@id='qa-HOME_NOTE_WIDGET_CREATE_NOTE']
${Notes_SideArea}               //article[contains(@id,'NOTES_SIDEBAR_NOTE')]
${NotesArea_Iframe}             //iframe[@id='qa-COMMON_EDITOR_IFRAME']
${Title_TextArea}               //en-noteheader/div[1]/div[2]/textarea[1]
${LogoutUser_Link}              //div[contains(text(),'{}')]
${Signout_Link}                 //span[contains(text(),'Sign out')]
${SignedOut_Text}               //h1[contains(text(),'logged out')]
${CreatedNote_Link}             //div[contains(@id,'NOTES_SIDEBAR_NOTE_TITLE')]/span[contains(text(),'{}')]
${OpenedNote_Text}             //div[text()='{}']

*** Keywords ***
Click Note Link
    [Documentation]     Waits for New Note Link and click Note Link
    Wait Until Element Is Visible    ${CreateNote_Link}
    Click Element   ${CreateNote_Link}

New Note Created
    [Documentation]     Waits for New Note and Checks for new note to be visible
    wait until element is visible  ${Notes_SideArea}
    element should be visible   ${Notes_SideArea}

Switch to Notes Text Area
    [Documentation]  Waits for New Note text Area Iframe and selects it
    wait until element is visible  ${NotesArea_Iframe}
    select frame    ${NotesArea_Iframe}

Enter Notes Title
    [Documentation]     Enters Note title on text Area
    [Arguments]  ${TitleText_Value}
    #   ${TitleText_Value}  - Enter Note title - String/Integer
    input text      ${Title_TextArea}   ${TitleText_Value}
    Press Keys  ${Title_TextArea}  RETURN
    sleep  2s

Switch Back from Notes Text Area
    [Documentation]     Switches back to Dashboard page from Text Area Iframe
    unselect frame

Click Account Section
    [Documentation]     Clicks on Account username and click signout link
    [Arguments]  ${Valid_Email}
    #  ${Valid_Email} - User mail id used for Login
    ${LogoutUser_Link}=  Format Locator Property  ${LogoutUser_Link}  ${Valid_Email}
    Wait Until Element Is Enabled     ${LogoutUser_Link}
    click element       ${LogoutUser_Link}

Signout User
    [Documentation]     Wait for the Sign out Link and clicks Signout Link
    wait until element is visible   ${Signout_Link}
    click element   ${Signout_Link}

Open Created Note
    [Documentation]     Opens the Newly Created Note
    [Arguments]  ${TitleText_Value}
    # ${TitleText_Value}  - Title text used in New Note at the time of creation
    # Format the Locator value with dynmaic value of Title Text
    ${CreateNote_NewLink}=  Format Locator Property  ${CreatedNote_Link}  ${TitleText_Value}
    wait until element is visible  ${CreateNote_NewLink}
    click element  ${CreateNote_NewLink}

Created Note is Opened
    [Documentation]  Switches to Text area and confirms the newly Created note is opened.
    Switch to Notes Text Area
    Switch Back from Notes Text Area
    #Click on user Name and Sign out
    Click Account Section  ${Valid_Email}
    Signout User






