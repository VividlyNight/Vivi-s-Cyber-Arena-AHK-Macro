#Requires AutoHotkey v2.0
#SingleInstance

TraySetIcon("Resources\CyberArenaMacroIcon.png")

#Include GUI\MainGUI.ahk
#Include Resources\Globals.ahk
#Include Detections\PixelDetections.ahk
#Include MacroResources\LobbyMovements.ahk
#Include MacroResources\InRoundMovements.ahk
#IncludeAgain GUI\StatusOverlay.ahk

;------------------ file saves -------------------------



; ---------- LOAD SETTINGS ----------

if FileExist(DiscordWebhookUserLinkSettingsPath)
    global DiscordWebhookLinkText
{
    DiscordWebhookLinkText.Value := FileRead(DiscordWebhookUserLinkSettingsPath)
}

if FileExist(PrivateServerUserLinkSettingsPath)
    global PrivateServerUserLinkSettingsPath
{
    PrivateServerTextBox.Value := FileRead(PrivateServerUserLinkSettingsPath)
}


if FileExist(CloseAllRobloxInstancesSettingsPath)
    global CloseAllRobloxInstancesSettingsPath
    global CloseAllRobloxInstancesButton
{
    CloseAllRobloxInstancesButton.Value := FileRead(CloseAllRobloxInstancesSettingsPath)
}


;------------------ opens the main gui -------------------------

mainGui.Show("x50 y480 w500 h250")


;------------------bullshit ---------------------------


Loop
{
    global StageStatusValue
    global CloseAllRobloxInstancesButton
    switch StageStatusValue
    {
        case "KickMessage":
            SetTimer(SetStageStatusValueToFailSafe,0) ;----------------------------- FAILSAFE TIMER --------------
            
            if (CloseAllRobloxInstancesButton.Value = 1)
            {
                Loop 15
                {
                    CloseRoblox()
                }
            }
            else
            {
                CloseRoblox()
            }
            Sleep(100)
            StageStatusValue := "Rejoining"

        case "Rejoining":
            JoinPrivateServer(PrivateServerTextBox.Value)
            StartFailSafeTimer(40000) ;----------------------------- FAILSAFE TIMER --------------
            StageStatusValue := "WaitingForLobbyLoad"     

        case "WaitingForLobbyLoad": 
            if (LobbyDetection())
            {
                SetTimer(SetStageStatusValueToFailSafe,0)
                StartFailSafeTimer(50000) ;----------------------------- FAILSAFE TIMER --------------
                StageStatusValue := "Lobby"
            }

        case "Lobby":
            WalkToTeleporter()
            if (StageStatusValue = "Lobby")
                    {
                    StageStatusValue := "WaitingToLoadInRound"
                    }

        case "WaitingToLoadInRound":
            if (HealthBarAliveDetectionNonLoop())
            {
                SetTimer(SetStageStatusValueToFailSafe,0) ;----------------------------- FAILSAFE TIMER --------------
                StageStatusValue := "StartGame"
            }

        case "StartGame":
            StartGame()
            WalkToTopLeftArenaBeginning()
            StageStatusValue := "Dodging"

        case "Dodging":
            SetTimer(lastInputValueLoop, 100)
            SetTimer(ShopWaveDetectionNonLoop, 100)
            if (ViperPatronClassCheckBox.Value = 1)
            {
                DodgeAroundViperClass()
            }
            else
            {
                DodgeAroundNegativeClass()
            }
            SetTimer(ShopWaveDetectionNonLoop, 0)

        case "AdjustingForShop":
            WalkToBottomRightArena()

        case "Shopping":
            WalkToShopReady()

        case "DodgingAfterShop":
            SetTimer(lastInputValueLoop, 100)
            SetTimer(ShopWaveDetectionNonLoopAfterShop, 100)
            if (ViperPatronClassCheckBox.Value = 1)
            {
                DodgeAroundViperClassAfterShop()
            }
            else
            {
                DodgeAroundAfterShop()
            }
            SetTimer(ShopWaveDetectionNonLoopAfterShop, 0)


        case "ResettingCharacter":
            ResetCharacter()
            Sleep(30)

        case "Dead":
            Sleep(600)
            DeathRetrySequence()

        case "FailSafe":
            SetTimer(SetStageStatusValueToFailSafe,0) ;----------------------------- FAILSAFE TIMER -------------- 

            if (CloseAllRobloxInstancesButton.Value = 1)
            {
                Loop 15
                {
                    CloseRoblox()
                }
            }
            else
            {
                CloseRoblox()
            }

            Sleep(100)
            StageStatusValue := "Rejoining"
    }

    Sleep(10)
}



