;-----------------------------------------
; ----- Event Log
;-----------------------------------------
;
; This is an internal module to see what the program reads and does
;
;-----------------------------------------

; Yes I use Globals
Hotkey, %Hotkey_Toggle_EventLog%, Toggle_EventLog,	UseErrorLevel

Global Tooltip_Hotkey_Toggle_EventLog 	:= ReplaceModifiers(Hotkey_Toggle_EventLog)
Global menu_Toggle_EventLog				:= "Event Log   <" . Tooltip_Hotkey_Toggle_EventLog . ">"

Menu, Tray, Add, %menu_Toggle_EventLog%, Toggle_EventLog

Global pAlert1 := ""
Global pAlert2 := ""
Global pAlert3 := ""
Global pAlert4 := ""
Global pAlert5 := ""
Global pAlert6 := ""
Global pAlert7 := ""

	WinGet, windowHandle, ID, %winName%
	WinGetPos, WarcraftIII_posX, WarcraftIII_posY, WarcraftIII_width, WarcraftIII_height, %winName%

	Gui, gui_AlertBox:+LastFound -Caption -Border +ToolWindow +Owner%windowHandle%
	
	Gui, gui_AlertBox:Color, 0xFFFFFF
	Gui, gui_AlertBox:Color, %color%
	Gui, gui_AlertBox:margin, 10, 10

	Gui, gui_AlertBox:Add, Text,, Event Log:
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert1
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert2
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert3
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert4
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert5
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert6
	Gui, gui_AlertBox:Add, Text, w220 h60 vAlert7

	WinSet, TransColor, %color% 222, % gui_AlertBox ; PNG transparency. 0 = fully transparent
	WinSet, ExStyle, +0x20, % gui_AlertBox	; Click-through

;--------------------------------
; On program start...

if (b_EventLog == 1) {

	; only toggle on if the Warcraft III window exists
	if WinExist(winTitle) {
		Control_EventLog(1)
	} else {
		b_EventLog = 0
		MsgBox, Warcraft III is not found:`nCannot display the Event Log panel!	
	}
}

;-----------------------------------------
; EventLog Module
;-----------------------------------------

UpdateEventLog(message) {

	if (pAlert6 != "") {
		pAlert7 := pAlert6
	}

	if (pAlert5 != "") {
		pAlert6 := pAlert5
	}

	if (pAlert4 != "") {
		pAlert5 := pAlert4
	}

	if (pAlert3 != "") {
		pAlert4 := pAlert3
	}

	if (pAlert2 != "") {
		pAlert3 := pAlert2
	}

	if (pAlert1 != "") {
		pAlert2 := pAlert1	
	}

	pAlert1 := message

	GuiControl, gui_AlertBox:, Alert1, % pAlert1
	GuiControl, gui_AlertBox:, Alert2, % pAlert2
	GuiControl, gui_AlertBox:, Alert3, % pAlert3
	GuiControl, gui_AlertBox:, Alert4, % pAlert4
	GuiControl, gui_AlertBox:, Alert5, % pAlert5
	GuiControl, gui_AlertBox:, Alert6, % pAlert6
	GuiControl, gui_AlertBox:, Alert7, % pAlert7
	
}

;-----------------------------------------
; EventLog Control
;-----------------------------------------

Toggle_EventLog() {

	if (b_EventLog == 1) {

		Control_EventLog(0)

	} else {

		; only toggle on if the Warcraft III window exists
		if WinExist(winTitle) {
			Control_EventLog(1)
		} else {
			b_EventLog = 0
			MsgBox, Warcraft III is not found:`nCannot display the Event Log panel!	
		}
	}
} 


Control_EventLog(switchTo) {

	if (switchTo == 1) {
		;SetupEventLog()
		Gui, gui_AlertBox:Show, % "x" (1920-220) " y" (0+60) 
	} else {
		Gui, gui_AlertBox:Hide
	}

	b_EventLog := switchTo
	
	ToggleCheckmark(menu_Toggle_EventLog, switchTo)
	FlashSplash("Event Log - " . switchTo, FlashSplashTime)

	;UpdateEventLog("Event Log - " . switchTo)	
	
}


; We call this once at the very launch, and then everytime an attempt to enable the overlay is made
SetupEventLog() {


}