#Requires AutoHotkey v2.0
#SingleInstance Force

RobloxWindowDetection(){
    if ProcessExist("RobloxPlayerBeta.exe")
    {
        return false
    }
    else
    {
        return true
    }

}