#Requires AutoHotkey v2.0
#SingleInstance Force

;--------------camera positions (non-fullscreen)-----------------------

FreeClick := [467, 736]
JoinQueue := [467, 550]
CasualModeQueue := [467, 264] ;haha look at the 67 here 😂😂 67 67 67
NormalModeQueue := [467, 296] ;buttons are serversided so it depends on your ping i guess
BrutalModeQueue := [467, 326]  
LethalModeQueue := [467, 360]  
StartGameQueue := [467, 478]
RoundRetryButton := [480, 684]


;--------------some bullshit (settings)-------------------------

lastinputvalue := 0
TestingMacroStatus := false ;only for testing just turn this to false if its true
MacroStatusValue := "off"
StageStatusValue := "Idle" ;Rejoining Lobby Starting Dodging Shopping Death DeathRestarting
CoordMode("Mouse", "Screen")
CoordMode("Pixel", "Screen")
DiscordWebhookUserLinkSettingsPath := "Settings\DiscordWebhookLinkTextFile.txt"
PrivateServerUserLinkSettingsPath := "Settings\PrivateServerLinkTextFile.txt"
CloseAllRobloxInstancesSettingsPath := "Settings\CloseAllRobloxInstancesTextFile.txt"

;----------------functions------------------------------------


lastInputValueLoop(){
    global lastinputvalue
    lastinputvalue += 1
    elapsedInputGuiText.Text := ("Time since big event: " lastinputvalue "")
}

StageStatusValueLoop(){
    global StageStatusValue
    StageStatusValueGuiText.Text := ("Current stage:  " StageStatusValue "")
}

HoldKey(key,duration){
    global lastinputvalue
    lastinputvalue := 0
    SetTimer(lastInputValueLoop, 100)
    SendEvent("{" key " down}")
    Sleep(duration)
    SendEvent("{" key " up}")
    SetTimer(lastInputValueLoop, 0)
}


DualHoldKey(keys, duration)
{
    global lastinputvalue
    lastinputvalue := 0
    SetTimer(lastInputValueLoop, 100)

    for key in keys
        SendEvent("{" key " down}")

    Sleep(duration)

    for key in keys
        SendEvent("{" key " up}")
    
    SetTimer(lastInputValueLoop, 0)
}

TapKey(key){
    SendEvent("{ " key " down}")
    Sleep(20)
    SendEvent("{ " key " up}")
}

SpamE(){
    global HoldKey
    HoldKey("e", 10)
}

CtrlDash(){
    SendEvent("{ctrl down}")
    Sleep(20)
    SendEvent("{ctrl up}")
}



Clicking(targetX, targetY, steps, delayMs) {
    MouseGetPos(&startX, &startY)
    
    Loop steps {
        t := A_Index / steps
        
        currentX := startX + (targetX - startX) * t
        currentY := startY + (targetY - startY) * t
        
        absX := Integer(currentX * 65535 / A_ScreenWidth)
        absY := Integer(currentY * 65535 / A_ScreenHeight)
        
        DllCall("user32\mouse_event", "UInt", 0x0001 | 0x8000, "Int", absX, "Int", absY, "UInt", 0, "UPtr", 0)
        
        Sleep(delayMs)
    }
    
    DllCall("user32\mouse_event", "UInt", 0x02 | 0x04, "Int", 0, "Int", 0, "UInt", 0, "UPtr", 0)
}

ClickingHold(targetX, targetY, steps, delayMs, holdDuration) {
    MouseGetPos(&startX, &startY)
    
    Loop steps {
        t := A_Index / steps
        
        currentX := startX + (targetX - startX) * t
        currentY := startY + (targetY - startY) * t
        
        absX := Integer(currentX * 65535 / A_ScreenWidth)
        absY := Integer(currentY * 65535 / A_ScreenHeight)
        
        DllCall("user32\mouse_event", "UInt", 0x0001 | 0x8000, "Int", absX, "Int", absY, "UInt", 0, "UPtr", 0)
        
        Sleep(delayMs)
    }
    
    ClickDown()
    Sleep(holdDuration)
    ClickUp()
}

ClickDown(){
    DllCall("user32\mouse_event", "UInt", 0x0002, "Int", 0, "Int", 0, "UInt", 0, "UPtr", 0)
}

ClickUp(){
    DllCall("user32\mouse_event", "UInt", 0x0004, "Int", 0, "Int", 0, "UInt", 0, "UPtr", 0)
}

  ; Flags: Left Down (0x02) | Left Up (0x04)

;------------------------------------- vital movements -------------------

SetStageStatusValueToFailSafe(){
    global StageStatusValue
    StageStatusValue := "FailSafe"
}

StartFailSafeTimer(duration)
{
    SetTimer(SetStageStatusValueToFailSafe, -duration)
}

JoinPrivateServer(link)
{
    Run(link)
}
 

CloseRoblox(){
    if ProcessExist("RobloxPlayerBeta.exe")
    {
        ProcessClose("RobloxPlayerBeta.exe")
    }
}

FocusRoblox(){
    if ProcessExist("RobloxPlayerBeta.exe")
    {
        WinActivate("Roblox")
    }
}

ResetCharacter(){
    Sleep(100)
    TapKey("esc")
    Sleep(200)
    TapKey("r")
    Sleep(200)
    TapKey("enter")
}