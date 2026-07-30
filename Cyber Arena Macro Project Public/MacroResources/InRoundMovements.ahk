#Requires AutoHotkey v2.0
#SingleInstance Force
#Include ..\Resources\Globals.ahk
#Include ..\GUI\StatusOverlay.ahk
#Include ..\Detections\PixelDetections.ahk
#Include ..\GUI\MainGUI.ahk

;------------- detection bs --------------

StartGame(){
    global StageStatusValue
    global TestingMacroStatus

    TapKey("Lshift")

    Sleep(67)

    SetTimer(CtrlDash,867) ;67 hahaha
    HoldKey("w", 5000)
    SetTimer(CtrlDash,0)

    Sleep(670)

    SetTimer(SpamE, 30) ;genuinely idk how to do this other than make a global function just for spamming e 
    HoldKey("s",1500)
    SetTimer(SpamE, 0)

    Sleep(5000)
    SetTimer(SpamE, 30)
    HoldKey("w",1500)
    SetTimer(SpamE, 0)
}

WalkToTopLeftArenaBeginning(){
    global StageStatusValue
    global TestingMacroStatus

    SetTimer(CtrlDash,1200)
    DualHoldKey(["a","w"],7000) ;goin to da corner
    SetTimer(CtrlDash,0)
}

DodgeAroundViperClass(){
    global StageStatusValue
    global TestingMacroStatus
    
    TapKey("2")
    MouseMove(682,670)
    Clicking(682,411,15,1)
    Sleep(200)
    ClickDown()

    while (StageStatusValue = "Dodging")
        {
        if (StageStatusValue != "Dodging")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("s",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "Dodging")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("d",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "Dodging")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("w",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "Dodging")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("a",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)
        }
}

DodgeAroundNegativeClass(){
    global StageStatusValue
    global TestingMacroStatus

    while (StageStatusValue = "Dodging")
        {
        if (StageStatusValue != "Dodging")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("s",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "Dodging")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("d",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "Dodging")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("w",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "Dodging")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("a",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)
        }
}



WalkToBottomRightArena(){
    global TestingMacroStatus
    global StageStatusValue

    SetTimer(CtrlDash,867)
    HoldKey("s",7500)
    Sleep(30)
    HoldKey("d",7500)
    SetTimer(CtrlDash,0)

    if (TestingMacroStatus = false)
    {    
        Sleep(10)
        StageStatusValue := "Shopping" ; <------------ STARTING STATUS        
    }
}

WalkToShopReady(){
    global TestingMacroStatus
    global StageStatusValue

    HoldKey("a",900)
    Sleep(50)
    SetTimer(SpamE, 20)
    SetTimer(CtrlDash,867)
    Sleep(30)
    DualHoldKey(["a","w"],9500)
    SetTimer(SpamE, 0)
    SetTimer(CtrlDash,0)

    if (TestingMacroStatus = false)
    {    
        Sleep(10)
        StageStatusValue := "DodgingAfterShop" ; <------------ STARTING STATUS        
    }
}

DodgeAroundAfterShop(){
    global StageStatusValue
    global TestingMacroStatus

    while (StageStatusValue = "DodgingAfterShop")
        {
        if (StageStatusValue != "DodgingAfterShop")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("s",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "DodgingAfterShop")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("d",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "DodgingAfterShop")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("w",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "DodgingAfterShop")
            break
        SetTimer(CtrlDash,1450)
        HoldKey("a",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)
        }
}

DodgeAroundViperClassAfterShop(){
    global StageStatusValue
    global TestingMacroStatus

    MouseMove(682,670)
    Clicking(682,411,15,1)
    Sleep(200)
    ClickDown()

    while (StageStatusValue = "DodgingAfterShop")
        {
        Sleep(200)
        ClickDown()
        if (StageStatusValue != "DodgingAfterShop")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("s",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "DodgingAfterShop")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("d",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "DodgingAfterShop")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("w",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)

        if (StageStatusValue != "DodgingAfterShop")
            {
            ClickUp()
            break
            }
        SetTimer(CtrlDash,1450)
        HoldKey("a",6800)
        SetTimer(CtrlDash,0)

        Sleep(67)
        }
}

DeathRetrySequence(){
    global StageStatusValue

    Clicking(RoundRetryButton[1],RoundRetryButton[2],35,1)
    StageStatusValue := "WaitingToLoadInRound"
}