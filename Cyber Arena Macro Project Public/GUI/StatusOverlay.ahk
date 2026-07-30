#Requires AutoHotkey v2.0
#SingleInstance Force
#Include ..\Resources\Globals.ahk

screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight

statusWidth := 190
statusHeight := 35

xtopright := 1180
ytopright := 0

;-----------------status gui--------------------

statusGui := Gui()
statusGui.Opt("+AlwaysOnTop -Caption +ToolWindow")
statusGui.BackColor := "2d2d35"

statusGui.SetFont("c0xffffff s13")
statusGuiText := statusGui.Add(
    "Text",
    "w150 Center",
    "Status: Idle"
)

;---------------- time elapsed window -----------

elapsedInputGui := Gui()
elapsedInputGui.Opt("+AlwaysOnTop -Caption +ToolWindow")
elapsedInputGui.BackColor := "2d2d35"

elapsedInputGui.SetFont("c0xffffff s13")
elapsedInputGuiText := elapsedInputGui.Add("Text","w200 Center","Time since last input: " lastinputvalue "")

;--------------- stage status value window ---------

StageStatusValueGui := Gui()
StageStatusValueGui.Opt("+AlwaysOnTop -Caption +ToolWindow")
StageStatusValueGui.BackColor := "2d2d35"

StageStatusValueGui.SetFont("c0xffffff s13")
StageStatusValueGuiText := StageStatusValueGui.Add("Text","w300 Center Left","Current Stage: " StageStatusValue "")


;---------------- for testing---------------------
;statusGui.Show("x" xtopright "y" 667 "w" statusWidth "h" statusHeight)
;StageStatusValueGui.Show("x" xtopright-50 "y" 700 "w" statusWidth+50 "h" statusHeight)
;elapsedInputGui.Show("x" xtopright-50 "y" 732 "w" statusWidth+50 "h" statusHeight)
;MsgBox("warning you have testing on",,"T0.2167")