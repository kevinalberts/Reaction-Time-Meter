#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $bStarted = 0
Global $iRandomDelay = 0
Global $fTimer, $ElapsedTime

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Reaction Test", 458, 274, 601, 339)
$Button1 = GUICtrlCreateButton("Press to Start!", 8, 8, 441, 257)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
            Switch $bStarted
                Case 0
					Ready()
                    $bStarted = 1
                Case 1
					Start()
                    $bStarted = 0
            EndSwitch
	EndSwitch
WEnd

Func Start()
	$ElapsedTime = TimerDiff($fTimer)
	GUICtrlSetState($Button1, $GUI_DISABLE)
	MsgBox(64,"Elapsed Time","Your reaction time: " & $ElapsedTime & " ms")
	GUICtrlSetState($Button1, $GUI_ENABLE)
	GUICtrlSetStyle($Button1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetData($Button1, "Press to Start!")
EndFunc

Func Ready()
	GUICtrlSetState($Button1, $GUI_DISABLE)
	GUICtrlSetBkColor($Button1, 0xFF0000)
	GUICtrlSetData($Button1, "Wait!")
	$iRandomDelay = Random(2,5,1)
	Sleep($iRandomDelay * 1000)
	GUICtrlSetState($Button1, $GUI_ENABLE)
	GUICtrlSetBkColor($Button1, 0x00FF00)
	GUICtrlSetData($Button1, "GO!!!")
	$fTimer = TimerInit()
EndFunc