;-----------------------------------------
; 	Displaced Grid for Warcraft III:Reforged by etofok
;	Website Overview: https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/index
;	Download Latest: https://github.com/etofok/Displaced-Grid-for-Warcraft-III

;	Development: 
;	Dec 10th, 2023 - March 24th, 2025
;-----------------------------------------

#SingleInstance force
#NoEnv
#Persistent

if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"

Global currentVersion				:= "v1.3.6"
Global winTitle 					:= "ahk_class OsWindow" ; Warcraft III class name, as seen in WindowSpy of AutoHotkey
Global winName 						:= "Warcraft III"		; Warcraft III window name, as seen in WindowSpy of AutoHotkey

SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 3

; miscellaneous
Global FlashSplashTime 				:= 150
Global PortraitUI 					:= []
Global error_warcraftNotFound 		:= "Application has loaded correctly, but `n Warcraft III is NOT FOUND!`n`nPlease launch Warcraft III and restart the app!"

#Include *i %A_ScriptDir%\Modules\layout_Start.ahk
#Include *i %A_ScriptDir%\_UserSettings.ahk

#include *i %A_ScriptDir%\Modules\layout_BlizzardGrid.ahk
#include *i %A_ScriptDir%\Modules\layout_DisplacedGrid.ahk
#include *i %A_ScriptDir%\Modules\layout_SetHotkeys.ahk

#Include *i %A_ScriptDir%\Modules\Hotkey_CommandCard.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_ControlGroup.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_Item.ahk


Hotkey, %Hotkey_Toggle_DisplacedGrid%, 					Toggle_DisplacedGrid,		UseErrorLevel
Hotkey, %Hotkey_ScriptReload%, 							ScriptReload,				UseErrorLevel

Hotkey, %Hotkey_Send_glhf%,								Send_glhf,					UseErrorLevel
Hotkey, %Hotkey_Send_gg%, 								Send_gg,					UseErrorLevel

Hotkey, IfWinActive, ahk_class OsWindow

;-----------------------------------------
; App control hotkeys
;-----------------------------------------
Tooltip_Hotkey_Toggle_DisplacedGrid 		:= ReplaceModifiers(Hotkey_Toggle_DisplacedGrid)
Tooltip_Hotkey_ScriptReload 				:= ReplaceModifiers(Hotkey_ScriptReload)

Global menu_Toggle_DisplacedGrid 			:= "Displaced Grid <" 				. Tooltip_Hotkey_Toggle_DisplacedGrid 	. ">"
Global menu_ScriptReload 					:= "Restart Application <" 			. Tooltip_Hotkey_ScriptReload 			. ">"
Global menu_ScriptSettings					:= "Open Settings"
Global menu_ScriptFolder					:= "Open Folder"

;-----------------------------------------
; Tray Menu
;-----------------------------------------

Menu, Tray, NoStandard
Menu, Tray, Tip, Displaced Grid+ %currentVersion% by etofok

Menu, Tray, Add, 		Displaced GRID+ %currentversion% by etofok, handler_blank
Menu, Tray, Disable, 	Displaced GRID+ %currentversion% by etofok
Menu, Tray, Add, 		etofok Link Tree >>,						LinkTree

Menu, Tray, Add, 	,		
Menu, Tray, Add, 		Toggle Hotkey Layout, 						handler_blank
Menu, Tray, Disable, 	Toggle Hotkey Layout
Menu, Tray, Add, 		%menu_Toggle_DisplacedGrid%,				Toggle_DisplacedGrid
Menu, Tray, Default, 	%menu_Toggle_DisplacedGrid%,

if (b_EventLog == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_EventLog.ahk
}

Menu, Tray, Add, 	,

Menu, Tray, Add, 		MODULES, handler_blank
Menu, Tray, Disable, 	MODULES

; ADDING MODULES ONE BY ONE...
#Include 				*i %A_ScriptDir%\Modules\module_RapidFire.ahk
#Include 				*i %A_ScriptDir%\Modules\module_CameraHotkeys.ahk
#Include 				*i %A_ScriptDir%\Modules\module_CommandMultipleGroups.ahk
#Include 				*i %A_ScriptDir%\Modules\module_ShiftQueueItems.ahk
#Include 				*i %A_ScriptDir%\Modules\module_QuickCastItems.ahk
#Include 				*i %A_ScriptDir%\Modules\module_QuickDropItems.ahk
#Include 				*i %A_ScriptDir%\Modules\module_AltKeyImprovements.ahk

Menu, Tray, Add, 		,
Menu, Tray, Add, 		SET UP, handler_blank
Menu, Tray, Disable, 	SET UP
Menu, Tray, Add, 		%menu_ScriptSettings%, 										ScriptSettings
Menu, Tray, Add, 		How to enable QuickCast for Abilities, Tutorial_AbilityQuickCast
Menu, Tray, Add, 		How to align the overlay, Tutorial_Overlay
Menu, Tray, Add, 		Go to Website, Tutorial_Website
Menu, Tray, Add, 		,

Menu, Tray, Add, 		%menu_ScriptReload%,										ScriptReload
Menu, Tray, Add, 		%menu_ScriptFolder%, 										ScriptFolder
Menu, Tray, Add, 		Exit, 														ScriptExit

;-----------------------------------------
; ----- L A U N C H -----
;-----------------------------------------

if (false) {
} ; this is actually an important line of code

; Greetings and Satulations
displaySplash := "Displaced Grid for Warcraft III: Reforged`nby etofok`n`nTOGGLE HOTKEY: `n" . Tooltip_Hotkey_Toggle_DisplacedGrid
SplashTextOn, 300, 120, , %displaySplash%
Sleep, 1500
SplashTextOff

; load Image_Overlay at the very end
#Include *i %A_ScriptDir%\Modules\module_Overlay.ahk

; ?Should we activate Displaced Grid hotkeys on app start?
if (b_DisplacedGrid == 1) {

	if WinExist(winTitle) {
		Control_DisplacedGrid(1)	; Toggle On on start ONLY if the Warcraft III window exists
	} else {
		Control_DisplacedGrid(0) 	; Force Toggle Off if the Warcraft III window does not exist
	}
} else {
	Control_DisplacedGrid(0) ; otherwise don't enable the hotkeys on launch
}

;--------------------
; --- E N D  O F  A U T O L A U N C H ---
;-----------------------------------------
;-----------------------------------------

return ; this return is the most important line of code
; all modules get added in the autorun section above



#IfWinActive

;--------------------------------
; DisplacedGrid Control
;--------------------------------

Toggle_DisplacedGrid() {

	;if DisplacedGrid is ON -> switch DisplacedGrid OFF
	if (b_DisplacedGrid == 1) {

		;This is a crutch to link "DisplacedGrid Off" to the RapidFire module.
		;Otherwise you can't type! 
		;RapidFire sends an ESCAPE command as you press buttons (i.e. when you type) which closes the chat :)

		if (initialState_RapidFire) {
			Control_RapidFire(0)
		}

		;Switch Displaced Grid OFF
		Control_DisplacedGrid(0)

		;Switch Image_Overlay.png OFF
		Control_Overlay(0)		

	}

	;if DisplacedGrid is OFF -> switch DisplacedGrid ON
	else {
		if WinExist(winTitle) {

			;This is a crutch to link "DisplacedGrid On" to the RapidFire module.
			;Otherwise you can't type!
			;RapidFire sends an ESCAPE command as you press buttons (i.e. when you type) which closes the chat :)

			if (initialState_RapidFire) {
				Control_RapidFire(1)
			}

			;Switch Displaced Grid ON 
			Control_DisplacedGrid(1)

			;Switch Image_Overlay.png ON
			Control_Overlay(1)

		} else {
			MsgBox, %error_warcraftNotFound%
		}
	}
}

Control_DisplacedGrid(switchTo) {
	
	b_DisplacedGrid := switchTo

	ReloadHotkeys()

	ToggleCheckmark(menu_Toggle_DisplacedGrid, switchTo)
	Menu, Tray, Icon, %A_ScriptDir%\Modules\icons\icon_Hotkeys%switchTo%.ico

	if (b_EventLog) {
		UpdateEventLog("Displaced GRID Keys - " . switchTo)
		FlashSplash("Displaced GRID Keys - " . switchTo, FlashSplashTime)
	}
} 


ReloadHotkeys() {

	SetHotkeys(0) 						; turn off the current set of active hotkeys

	if (b_DisplacedGrid == 0) {
		load_BlizzardGrid()
	} else {
		load_DisplacedGrid()
	}

	SetHotkeys(1)						; re-assign the hotkeys
}




;----------------------------------------------------------------
; Auxiliary functions
;----------------------------------------------------------------

Send_glhf() {
    Send, {Enter}
    Sleep, 50
    SendRaw, gl hf
    Sleep, 50
    Send, {Enter}
}


Send_gg() {
    Send, {Enter}
    Sleep, 50
    SendRaw, gg
    Sleep, 50
    Send, {Enter}
}

;--------------------------------
; Tutorial_AbilityQuickCast
;--------------------------------

Tutorial_AbilityQuickCast:
	Suspend, Permit
	Run, %a_scriptdir%\Modules\How to enable QuickCasts for Abilities.txt
return

;--------------------------------
; Tutorial_Overlay
;--------------------------------

Tutorial_Overlay:
	Suspend, Permit
	Run, %a_scriptdir%\Image_Overlay\How to adjust the overlay to your resolution.txt
return

;--------------------------------
; Tutorial_Website
;--------------------------------

Tutorial_Website:
	Suspend, Permit
	Run, https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/index.html
return

;--------------------------------
; Reload This Script
;--------------------------------

ScriptReload:
	Suspend, Permit
	Reload
return

;--------------------------------
; Locate This Script
;--------------------------------

ScriptFolder:
	Suspend, Permit
	Run, %a_scriptdir%
return

;--------------------------------
; Locate UserSettings
;--------------------------------

ScriptSettings:
	Suspend, Permit
	filePath := A_ScriptDir "\_UserSettings.ahk"
	Run, notepad.exe %filePath%
return

;--------------------------------
; Exit This Script
;--------------------------------

ScriptExit:
	Suspend, Permit
	ExitApp
return

;----------------------------------------------------------------
;----------------------------------------------------------------
;----------------------------------------------------------------

;--------------------------------
; Get info whether the Shift and/or Ctrl keys are pressed down
;--------------------------------

GetModifiersState() {

	if (GetKeyState("Shift", "P")) {
		appendModifiers .= "+"
	}

	if (GetKeyState("Ctrl", "P")) {
		appendModifiers .= "^"
	}

	if (GetKeyState("Alt", "P")) {
		appendModifiers .= "!"
	}

	return appendModifiers
}

;--------------------------------
; Translate Tooltip Hotkeys to Human Language
;--------------------------------

ReplaceModifiers(str) {
    ; Replace symbols with corresponding names
    str := StrReplace(str, "+", "SHIFT + ")		; start with the "+"!
    str := StrReplace(str, "!", "ALT + ")
    str := StrReplace(str, "^", "CTRL + ")
    str := StrReplace(str, "#", "WIN + ")
    return str
}

;--------------------------------
; Flash a splash on script launch
;--------------------------------

FlashSplash(displayText, time) {

	displayText := StrReplace(displayText, "1", "Activating...")
	displayText := StrReplace(displayText, "0", "Deactivating...")

	SplashTextOn, 300, 55, , %displayText%
	Sleep, %time%
	SplashTextOff
}

;--------------------------------
; Toggle Checkmark Func
;--------------------------------

ToggleCheckmark(trayitem, onoff) {

	if (onoff == 1) {
		Menu, Tray, Check, %trayitem%
	} else if (onoff == 0) {
		Menu, Tray, Uncheck, %trayitem%	
	}
}

;--------------------------------
; linktr
;--------------------------------

LinkTree:
	Run, https://linktr.ee/etofok
return

;-----------------------------------------
; Random 
;-----------------------------------------

Rand(min, max) {
    Random, output, min, max
    return output
}

;-----------------------------------------
; Blank 
;-----------------------------------------

handler_blank() {
}

#IfWinActive


