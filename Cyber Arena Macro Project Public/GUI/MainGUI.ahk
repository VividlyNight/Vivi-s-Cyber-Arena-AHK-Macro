#Requires AutoHotkey v2.0
#SingleInstance Force
#Include StatusOverlay.ahk
#Include ..\MacroResources\InRoundMovements.ahk
#Include ..\MacroResources\LobbyMovements.ahk

; ---------------------------functions----------------------------------

randomguibox(*){
    MsgBox("it should appear")
}

activatestatus(*){
    global macrostatus
    global statusGui
    global StageStatusValue
    global CloseAllRobloxInstancesButton

    StageStatusValue := "FailSafe"
    macrostatus.Text := "Status: ON"
    statusGuiText.Text := "Status: RUNNING"
    mainGui.Hide()

    if (CloseAllRobloxInstancesButton.Value = 1)
        {
            Loop 10
                {
                    CloseRoblox()
                }
                else
                {
                    MsgBox("done closing all roblox")
                }
        }


    statusGui.Show("x" xtopright "y" 667 "w" statusWidth "h" statusHeight)
    StageStatusValueGui.Show("x" xtopright-50 "y" 700 "w" statusWidth+50 "h" statusHeight)
    elapsedInputGui.Show("x" xtopright-50 "y" 732 "w" statusWidth+50 "h" statusHeight)

    SetTimer(RobloxKickMessageDetection,1000)
    SetTimer(DeathDetection,1000)
    ;SetTimer(RobloxWindowDetection,1000)
    SetTimer(StageStatusValueLoop,200)
}

pausestatus(*){ 
    global macrostatus ;this is discontinued, might bring it back later when im more experienced
    global statusGui
    macrostatus.Text := "Status: PAUSED"
    statusGuiText.Text := "Status: PAUSED"
}

disablestatus(*){
    global macrostatus
    global statusGui
    macrostatus.Text := "Status: OFF"
    statusGuiText.Text := "Status: OFF"
    Reload
}

SaveSettings(*)
{
    global DiscordWebhookLinkText
    global DiscordWebhookUserLinkSettingsPath
    global PrivateServerTextBox
    global PrivateServerUserLinkSettingsPath
    global CloseAllRobloxInstancesButton

    FileDelete(DiscordWebhookUserLinkSettingsPath)
    FileAppend(DiscordWebhookLinkText.Value, DiscordWebhookUserLinkSettingsPath)

    FileDelete(PrivateServerUserLinkSettingsPath)
    FileAppend(PrivateServerTextBox.Value, PrivateServerUserLinkSettingsPath)

    FileDelete(CloseAllRobloxInstancesSettingsPath)
    FileAppend(CloseAllRobloxInstancesButton.Value, CloseAllRobloxInstancesSettingsPath)

    MsgBox("Settings saved!")
}

TestLaunchPrivateServerLink(*){
    JoinPrivateServer(PrivateServerTextBox.Value)
}

OnBoxChanged(ctrl, info){
    global NegativeClassCheckBox
    global ViperPatronClassCheckBox

    if (!NegativeClassCheckBox.Value AND !ViperPatronClassCheckBox.Value) 
        {
            ; If both try to be deactivated, pick one randomly (1 or 2)
            if (Random(1, 2) == 1)
                ViperPatronClassCheckBox.Value := 1
            else
                NegativeClassCheckBox.Value := 1
        } 

    else if (NegativeClassCheckBox AND ViperPatronClassCheckBox) 
        {
            ; If both become active, turn off the opposite of the one just clicked
            if (ctrl == NegativeClassCheckBox)
                ViperPatronClassCheckBox.Value := 0
            else
                NegativeClassCheckBox.Value := 0
        }
}


; --------------------------------main gui----------------------------------


mainGui := Gui()
mainGui.Title := "Cyber Arena Macro"
mainGui.BackColor := "dbdbdb"
mainGui.Opt("+AlwaysOnTop")

mainGui.SetFont("c0x000000 s7 Bold", "Batang")
mainGui.Add("Text","Section x10", "Author: VividlyNight")

mainGui.SetFont("s9.5")
mainGui.Add(
    "Text",
    "xs Section", 
    "Discord Webhook (optional, currently unfinished)"
)

DiscordWebhookLinkText := mainGui.Add(
    "Edit",
    "ys",
    ""
)

mainGui.Add(
    "Text",
    "xs Section", 
    "Private Server Link (REQUIRED)"
)


PrivateServerTextBox := mainGui.Add(
    "Edit",
    "ys",
    ""
)

startbutton := mainGui.Add(
    "Button",
    "xs Section",
    "Start [F1]"
)

stopbutton := mainGui.Add(
    "Button",
    "ys",
    "Stop [F3]"
)

saveButton := mainGui.Add(
    "Button",
    "ys",
    "Save Settings"
)

CloseAllRobloxInstancesButton := mainGui.Add(
    "Checkbox",
    "xs Checked",
    "End All Roblox Instances when Starting/Restarting (recommended)"
)

TestPrivateServerLinkButton := mainGui.Add(
    "Button",
    "xs",
    "Test Private Server Launch"
)

NegativeClassCheckBox := mainGui.Add(
    "Checkbox",
    "xs",
    "Negative Class"
)

ViperPatronClassCheckBox := mainGui.Add(
    "Checkbox",
    "xs Checked",
    "Viper Class (RECOMMENDED)"
)

macrostatus := mainGui.Add(
    "Text",
    "xs w150",
    "Status: OFF"
)

;-------------------------scripts---------------------------------------

startbutton.OnEvent("Click",activatestatus)
saveButton.OnEvent("Click",SaveSettings)
stopbutton.OnEvent("Click",disablestatus)
TestPrivateServerLinkButton.OnEvent("Click",TestLaunchPrivateServerLink)
NegativeClassCheckBox.OnEvent("Click", OnBoxChanged)
ViperPatronClassCheckBox.OnEvent("Click", OnBoxChanged)

F1::{
    global StageStatusValue
    activatestatus ;remove this later pls 
}

F3::{
    disablestatus
}

mainGui.OnEvent("Close", OnClose)

OnClose(guiObj)
{
    ExitApp()
}


;---------------- for testing---------------------
;mainGui.Show("x50 y480 w500 h250") MsgBox("warning you have testing on",,"T0.4167")