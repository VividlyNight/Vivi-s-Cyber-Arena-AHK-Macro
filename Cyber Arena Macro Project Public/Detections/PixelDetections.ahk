#Requires AutoHotkey v2.0
#Include ..\Resources\Globals.ahk

CoinDetection(){ ;deprecated cuz this was a test
    found := PixelSearch( 
        &xf,
        &yf,
        999,27,
        1050,75,
        0xC29F16
    )

    if found
    {
        MsgBox("Found coin at " xf ", " yf)
    }
    else
    {
        MsgBox("Not found.")
    }
}

HealthBarAliveDetection()
{
    global StageStatusValue, StageStatusValue := "Starting"    
    SetTimer(lastInputValueLoop, 100)
    Loop 50
    {
        found := PixelSearch(
            &xf,
            &yf,
            1173,38,
            1337,65,
            0x2AD32A
        )

        if found
        {
            SetTimer(lastInputValueLoop, 0)
            return true
        }
        else
        {

        }
       Sleep(100)
    }
    SetTimer(lastInputValueLoop, 0)
    return false
}

HealthBarAliveDetectionNonLoop()
{
    global StageStatusValue  

    found := PixelSearch(
        &xf,
        &yf,
        1173,38,
        1337,65,
        0x2AD32A
    )

    if found
    {
        SetTimer(lastInputValueLoop, 0)
        return true
    }
    else
    {

    }
    return false
}

ShopWaveDetection()
{
    global StageStatusValue
    SetTimer(lastInputValueLoop, 100)
    Loop 50
    {
        found := PixelSearch(
            &xf,
            &yf,
            579,27,
            785,77,
            0x87BE16
        )

        if found
        {
            SetTimer(lastInputValueLoop, 0)
            return true
        }
        else
        {

        }
       Sleep(100)
    }
    SetTimer(lastInputValueLoop, 0)
    return false
}

ShopWaveDetectionNonLoop()
{
    global StageStatusValue
    found := PixelSearch(
        &xf,
        &yf,
        579,27,
        785,77,
        0x87BE16
    )
    if found
    {
        SetTimer(lastInputValueLoop, 0)
        StageStatusValue := "AdjustingForShop"
        return true
    }
    else
    {

    }
    return
}

ShopWaveDetectionNonLoopAfterShop()
{
    global StageStatusValue
    found := PixelSearch(
        &xf,
        &yf,
        579,27,
        785,77,
        0x87BE16
    )
    if found
    {
        SetTimer(lastInputValueLoop, 0)
        StageStatusValue := "ResettingCharacter"
        return true
    }
    else
    {

    }
    return
}

DeathDetection()
{
    global StageStatusValue
    found := PixelSearch(
        &xf,
        &yf,
        350, 660,
        633, 732,
        0x370C12
    )

    if found
    {
        SetTimer(lastInputValueLoop, 0)
        StageStatusValue := "Dead"
        return true
    }
    else
    {

    }
    return
}

LobbyDetection() ;by augment icon and grass TODO LIST: do grass detection also 
{
    global StageStatusValue
    found := PixelSearch(
        &xf,
        &yf,
        11, 189,
        84, 261,
        0x52EA01
    )

    found2 := PixelSearch(
        &xf,
        &yf,
        405, 27,
        886, 300,
        0x0A4E1B
    )   

    if (found AND found2)
    {
        SetTimer(lastInputValueLoop, 0)
        return true
    }
    else
    {

    }
    return 
}

RobloxKickMessageDetection()
{
    global StageStatusValue
    foundgrey := PixelSearch(
        &xf,
        &yf,
        530, 411,
        554, 426,
        0x393B3D
    )

    foundwhite := PixelSearch(
        &xf,
        &yf,
        688, 465,
        738, 501,
        0xFFFFFF
    )

    if (foundgrey and foundwhite)
    {
        SetTimer(lastInputValueLoop, 0)
        StageStatusValue := "KickMessage"
        return true
    }
    else
    {

    }
    SetTimer(lastInputValueLoop, 0)
    return 
}
