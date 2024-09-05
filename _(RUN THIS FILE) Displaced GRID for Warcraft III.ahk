;-----------------------------------------
; 	Displaced Grid for Warcraft III:Reforged by etofok
;	Website Overview: https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/index
;	Download Latest: https://github.com/etofok/Displaced-Grid-for-Warcraft-III

;	Development: 
;	Dec 10th, 2023 - Sept 5th, 2024
;-----------------------------------------

#SingleInstance force
#NoEnv
#Persistent

if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"

Global currentVersion				:= "v1.3.2"
Global winTitle 					:= "ahk_class OsWindow" ; Warcraft III class name, as seen in WindowSpy of AutoHotkey
Global winName 						:= "Warcraft III"		; Warcraft III window name, as seen in WindowSpy of AutoHotkey

SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 3

; miscellaneous
Global FlashSplashTime 				:= 150
Global PortraitUI 					:= []
Global error_warcraftNotFound 		:= "App is active but Warcraft III is NOT FOUND`n`nTo use Displaced Grid hotkeys`nplease launch Warcraft III and try again!"

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
Hotkey, %Hotkey_ScriptFolder%, 							ScriptFolder,				UseErrorLevel


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

Menu, Tray, Add, 		Modules, handler_blank
Menu, Tray, Disable, 	Modules

; ADDING MODULES ONE BY ONE...

if (b_RapidFire == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_RapidFire.ahk
	Global enable_RapidFire = True
}

if (b_CameraHotkeys == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_CameraHotkeys.ahk
	Global enable_CameraHotkeys = True
}

if (b_CommandMultipleGroups == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_CommandMultipleGroups.ahk
	Global enable_CommandMultipleGroups = True
}

if (b_AltKeyImprovements == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_AltKeyImprovements.ahk
	Global enable_AltKeyImprovements = True
}

if (b_QuickCastItems == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_QuickCastItems.ahk
	Global enable_QuickCastItems = True
}

if (b_ShiftQueueItems == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_ShiftQueueItems.ahk
	Global enable_ShiftQueueItems = True
}

if (b_QuickDropItems == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_QuickDropItems.ahk
	Global enable_QuickDropItems = True
}

Menu, Tray, Add, 		,
Menu, Tray, Add, 		Tutorials, handler_blank
Menu, Tray, Disable, 	Tutorials
Menu, Tray, Add, 		How to enable QuickCast for Abilities, Tutorial_AbilityQuickCast
Menu, Tray, Add, 		How to align the overlay, Tutorial_Overlay
Menu, Tray, Add, 		Go to Website, Tutorial_Website
Menu, Tray, Add, 		,

Menu, Tray, Add, 		%menu_ScriptReload%,										ScriptReload
Menu, Tray, Add, 		%menu_ScriptSettings%, 										ScriptSettings
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
		; Toggle On on start ONLY if the Warcraft III window exists
		Control_DisplacedGrid(1)
	} else {
		; Force Toggle Off if the Warcraft III window does not exist
		Control_DisplacedGrid(0)
	}
; if the user has specified b_DisplacedGrid = False in the UserSettings, then don't enable the hotkeys on launch
} else {
	Control_DisplacedGrid(0)
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

	if (b_DisplacedGrid == 1) {
		;turn off the DGRID Layout
		Control_DisplacedGrid(0)

		; Crutch to link Displaced Grid On/Off with Hold Cast. 
		; Otherwise you can't type because RapidFire sends a left click which closes chat :)
		Control_RapidFire(0)

		;turn off Image_Overlay.png
		Control_Overlay(0)

	}	else {
		if WinExist(winTitle) {
			;turn on the DGRID Layout
			Control_DisplacedGrid(1)

			; Crutch to link Displaced Grid On/Off with Hold Cast. 
			; Otherwise you can't type because RapidFire sends a left click which closes chat :)
			Control_RapidFire(1)

			;turn on Image_Overlay.png
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
	Run, %a_scriptdir%\Image_Overlay\How to align the overlay to your resolution.txt
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
; Blank 
;-----------------------------------------

handler_blank() {
}


#IfWinActive