#Requires AutoHotkey v2.0
#SingleInstance Force
#Include ..\Resources\Globals.ahk
#Include ..\GUI\StatusOverlay.ahk


WalkToTeleporter(){
    global StageStatusValue
    global TestingMacroStatus
    FocusRoblox()
    FocusRoblox()
    MouseMove(FreeClick[1]+100,FreeClick[2])
    Clicking(FreeClick[1],FreeClick[2],15,1)
    Sleep(1000)
    DualHoldKey(["a", "s"], 2500)

    Sleep(10)   

    HoldKey("w", 3250)

    Sleep(10)

    HoldKey("a", 2500)
    Sleep(1000)

    Clicking(JoinQueue[1],JoinQueue[2],48,1)

    Sleep(667) ; join queue depends on ping DO NOT COMPLAIN ITS TOO LONG

    Clicking(BrutalModeQueue[1],BrutalModeQueue[2],48,1)

    Sleep(667)

    Clicking(StartGameQueue[1],StartGameQueue[2],48,1)
}

