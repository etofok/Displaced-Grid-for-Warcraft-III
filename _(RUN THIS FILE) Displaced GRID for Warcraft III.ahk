;-----------------------------------------
; 	Displaced GRID+ for Warcraft III by etofok

;	Development: 
;	Dec 10th, 2023 - May 15th, 2024
;-----------------------------------------

#SingleInstance force
#NoEnv
#Persistent

if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"

SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 3

Global currentVersion				:= "v1.1.1"

; miscellaneous
Global FlashSplashTime 				:= 50
Global PortraitUI 					:= []

;-----------------------------------------
; Warcraft III window name
; (See in WindowSpy of AutoHotkey)
;-----------------------------------------

Global winTitle 					:= "ahk_class OsWindow"
Global winName 						:= "Warcraft III"

#Include *i %A_ScriptDir%\Modules\layout_Start.ahk
#Include *i %A_ScriptDir%\_UserSettings.ahk
#Include *i %A_ScriptDir%\Modules\module_Overlay.ahk

#include *i %A_ScriptDir%\Modules\layout_BlizzardGrid.ahk
#include *i %A_ScriptDir%\Modules\layout_DisplacedGrid.ahk

#Include *i %A_ScriptDir%\Modules\Hotkey_CommandCard.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_ControlGroup.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_Item.ahk

Hotkey, %Hotkey_Toggle_DisplacedGrid%, 					Toggle_DisplacedGrid,		UseErrorLevel
Hotkey, %Hotkey_ScriptReload%, 							ScriptReload,				UseErrorLevel
Hotkey, %Hotkey_ScriptFolder%, 							ScriptFolder,				UseErrorLevel


Hotkey, IfWinActive, ahk_class OsWindow

;-----------------------------------------
; Tray Menu
;-----------------------------------------

Tooltip_Hotkey_Toggle_DisplacedGrid 		:= ReplaceModifiers(Hotkey_Toggle_DisplacedGrid)
Tooltip_Hotkey_ScriptReload 				:= ReplaceModifiers(Hotkey_ScriptReload)
Tooltip_Hotkey_ScriptFolder 				:= ReplaceModifiers(Hotkey_ScriptFolder)

Global menu_Toggle_DisplacedGrid 			:= "Displaced GRID <" 	. Tooltip_Hotkey_Toggle_DisplacedGrid 	. ">"
Global menu_ScriptReload 					:= "Restart App <" 		. Tooltip_Hotkey_ScriptReload 			. ">"
Global menu_ScriptFolder					:= "Open Folder <" 		. Tooltip_Hotkey_ScriptFolder 			. ">"

; The order is reflected in Tray menu!
Menu, Tray, NoStandard
Menu, Tray, Tip, Displaced Grid+ %currentVersion% by etofok

Menu, Tray, Add, 		Displaced GRID+ %currentversion% by etofok, handler_blank
Menu, Tray, Disable, 	Displaced GRID+ %currentversion% by etofok
Menu, Tray, Add, 		etofok Link Tree >>,						LinkTree
Menu, Tray, Default, 	etofok Link Tree >>

Menu, Tray, Add, 	,		
Menu, Tray, Add, 		Hotkey Layout, 								handler_blank
Menu, Tray, Disable, 	Hotkey Layout
Menu, Tray, Add, 		%menu_Toggle_DisplacedGrid%,				Toggle_DisplacedGrid



if (b_EventLog == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_EventLog.ahk
}

Menu, Tray, Add, 	,

Menu, Tray, Add, 		Modules, handler_blank
Menu, Tray, Disable, 	Modules



/*
ADDING MODULES ONE BY ONE..
*/

if (b_QuickCastItems == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_QuickCastItems.ahk
	Global enable_QuickCastItems = True
}

if (b_HoldRecast == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_HoldRecast.ahk
	Global enable_HoldRecast = True
}

if (b_ShiftQueueItems == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_ShiftQueueItems.ahk
	Global enable_ShiftQueueItems = True
}

if (b_AltKeyImprovements == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_AltKeyImprovements.ahk
	Global enable_AltKeyImprovements = True
}

if (b_CommandMultipleGroups == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_CommandMultipleGroups.ahk
	Global enable_CommandMultipleGroups = True
}

if (b_CameraHotkeys == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_CameraHotkeys.ahk
	Global enable_CameraHotkeys = True
}

if (b_QuickDropItems == True) {
	#Include 				*i %A_ScriptDir%\Modules\module_QuickDropItems.ahk
	Global enable_QuickDropItems = True
}

Menu, Tray, Add, 		,
Menu, Tray, Add, 		%menu_ScriptReload%,										ScriptReload
Menu, Tray, Add, 		%menu_ScriptFolder%, 										ScriptFolder
Menu, Tray, Add, 		Exit, 														ScriptExit

;-----------------------------------------
; ----- L A U N C H -----
;-----------------------------------------

if (false) {

}

if (b_DisplacedGrid == 1) {
	Control_DisplacedGrid(1)

	displaySplash := "Displaced Grid+ by etofok`n`nTOGGLE HOTKEY: `n" . Tooltip_Hotkey_Toggle_DisplacedGrid
	SplashTextOn, 300, 120, , %displaySplash%
	Sleep, 500
	SplashTextOff
}

;--------------------
; --- E N D  O F  A U T O L A U N C H ---
;-----------------------------------------
;-----------------------------------------

return ; this return is the most important line of code
; all modules get added in the autorun section above

SetHotkeys(activeOrNot) {

	if (activeOrNot == 1)
		activeOrNot := "On"
	else
		activeOrNot := "Off"

	; ----------------------------------------------------
	; Select Unique.
	; Defaults are 1 2 3 for Heroes, 4 for Idle Worker
	; ----------------------------------------------------

	set_IdleWorker									:= Func("Hotkey_CommandCard").bind(IdleWorker)
	set_SelectHero1									:= Func("Hotkey_CommandCard").bind(SelectHero1)
	set_SelectHero2									:= Func("Hotkey_CommandCard").bind(SelectHero2)
	set_SelectHero3									:= Func("Hotkey_CommandCard").bind(SelectHero3)

	Hotkey % "*"IdleWorker.physicalKey,				% set_IdleWorker,	%activeOrNot%
	Hotkey % "*"SelectHero1.physicalKey,			% set_SelectHero1, 	%activeOrNot%
	Hotkey % "*"SelectHero2.physicalKey,			% set_SelectHero2, 	%activeOrNot%
	Hotkey % "*"SelectHero3.physicalKey,			% set_SelectHero3, 	%activeOrNot%

	; ----------------------------------------------------
	; Control Groups. 
	; Defaults are f1 f2 f3 f4 qw as zx
	; -------------

	set_ControlGroup1								:= Func("Hotkey_ControlGroup").bind(ControlGroup1)
	set_ControlGroup2								:= Func("Hotkey_ControlGroup").bind(ControlGroup2)
	set_ControlGroup3								:= Func("Hotkey_ControlGroup").bind(ControlGroup3)
	set_ControlGroup4								:= Func("Hotkey_ControlGroup").bind(ControlGroup4)
	set_ControlGroup5								:= Func("Hotkey_ControlGroup").bind(ControlGroup5)
	set_ControlGroup6								:= Func("Hotkey_ControlGroup").bind(ControlGroup6)
	set_ControlGroup7								:= Func("Hotkey_ControlGroup").bind(ControlGroup7)
	set_ControlGroup8								:= Func("Hotkey_ControlGroup").bind(ControlGroup8)
	set_ControlGroup9								:= Func("Hotkey_ControlGroup").bind(ControlGroup9)
	set_ControlGroup0								:= Func("Hotkey_ControlGroup").bind(ControlGroup0)

	Hotkey % "*"ControlGroup1.physicalKey,			% set_ControlGroup1, %activeOrNot%
	Hotkey % "*"ControlGroup2.physicalKey,			% set_ControlGroup2, %activeOrNot%
	Hotkey % "*"ControlGroup3.physicalKey,			% set_ControlGroup3, %activeOrNot%
	Hotkey % "*"ControlGroup4.physicalKey,			% set_ControlGroup4, %activeOrNot%
	Hotkey % "*"ControlGroup5.physicalKey,			% set_ControlGroup5, %activeOrNot%
	Hotkey % "*"ControlGroup6.physicalKey,			% set_ControlGroup6, %activeOrNot%
	Hotkey % "*"ControlGroup7.physicalKey,			% set_ControlGroup7, %activeOrNot%
	Hotkey % "*"ControlGroup8.physicalKey,			% set_ControlGroup8, %activeOrNot%
	Hotkey % "*"ControlGroup9.physicalKey,			% set_ControlGroup9, %activeOrNot%
	Hotkey % "*"ControlGroup0.physicalKey,			% set_ControlGroup0, %activeOrNot%

	; ----------------------------------------------------
	; Command Card.
	;
	; 1rd Row: Move Stop Hold Attack / Build T1 / Train units
	; Defaults are D F G Space
	
	; 2rd Row: T2 / Miscellaneous
	; Default are C V B N

	; 3rd Row: Use Abilities / Build T3, Shop / Research Upgrades
	; Default are E R T Y
   	
   	set_GRID_00 									:= Func("Hotkey_CommandCard").bind(GRID_00)
   	set_GRID_01 									:= Func("Hotkey_CommandCard").bind(GRID_01)
   	set_GRID_02 									:= Func("Hotkey_CommandCard").bind(GRID_02)
    set_GRID_03 									:= Func("Hotkey_CommandCard").bind(GRID_03)

    set_GRID_10 									:= Func("Hotkey_CommandCard").bind(GRID_10)
    set_GRID_11 									:= Func("Hotkey_CommandCard").bind(GRID_11)
    set_GRID_12 									:= Func("Hotkey_CommandCard").bind(GRID_12)
    set_GRID_13 									:= Func("Hotkey_CommandCard").bind(GRID_13)

    set_GRID_20 									:= Func("Hotkey_CommandCard").bind(GRID_20)
    set_GRID_21 									:= Func("Hotkey_CommandCard").bind(GRID_21)
    set_GRID_22 									:= Func("Hotkey_CommandCard").bind(GRID_22)
    set_GRID_23 									:= Func("Hotkey_CommandCard").bind(GRID_23)

    Hotkey % "*"GRID_00.physicalKey, 				% set_GRID_00, %activeOrNot%
    Hotkey % "*"GRID_01.physicalKey, 				% set_GRID_01, %activeOrNot%
    Hotkey % "*"GRID_02.physicalKey, 				% set_GRID_02, %activeOrNot%
    Hotkey % "*"GRID_03.physicalKey, 				% set_GRID_03, %activeOrNot%

    Hotkey % "*"GRID_10.physicalKey, 				% set_GRID_10, %activeOrNot%
    Hotkey % "*"GRID_11.physicalKey, 				% set_GRID_11, %activeOrNot%
    Hotkey % "*"GRID_12.physicalKey, 				% set_GRID_12, %activeOrNot%
    Hotkey % "*"GRID_13.physicalKey, 				% set_GRID_13, %activeOrNot%

    Hotkey % "*"GRID_20.physicalKey, 				% set_GRID_20, %activeOrNot%
    Hotkey % "*"GRID_21.physicalKey, 				% set_GRID_21, %activeOrNot%
    Hotkey % "*"GRID_22.physicalKey, 				% set_GRID_22, %activeOrNot%
    Hotkey % "*"GRID_23.physicalKey, 				% set_GRID_23, %activeOrNot%

	; ----------------------------------------------------
	; Items. 
	; Defaults are Alt + q w a s z x (+ Shift)
	; -------------

    set_Item1 								:= Func("Hotkey_Item").bind(Item1)
    set_Item2 								:= Func("Hotkey_Item").bind(Item2)
    set_Item3 								:= Func("Hotkey_Item").bind(Item3)
    set_Item4 								:= Func("Hotkey_Item").bind(Item4)
    set_Item5 								:= Func("Hotkey_Item").bind(Item5)
    set_Item6 								:= Func("Hotkey_Item").bind(Item6)

	Hotkey % "*"Item1.physicalKey,			% set_Item1, %activeOrNot%
	Hotkey % "*"Item2.physicalKey,			% set_Item2, %activeOrNot%
	Hotkey % "*"Item3.physicalKey,			% set_Item3, %activeOrNot%
	Hotkey % "*"Item4.physicalKey,			% set_Item4, %activeOrNot%
	Hotkey % "*"Item5.physicalKey,			% set_Item5, %activeOrNot%
	Hotkey % "*"Item6.physicalKey,			% set_Item6, %activeOrNot%

    ; ----------------------------------------------------
    ; Quick Drop Module
    ; ----------------------------------------------------

    set_QuickDrop_Item1 			:= Func("QuickDrop").bind(Item1)
    set_QuickDrop_Item2 			:= Func("QuickDrop").bind(Item2)
    set_QuickDrop_Item3 			:= Func("QuickDrop").bind(Item3)
    set_QuickDrop_Item4 			:= Func("QuickDrop").bind(Item4)
    set_QuickDrop_Item5 			:= Func("QuickDrop").bind(Item5)
    set_QuickDrop_Item6 			:= Func("QuickDrop").bind(Item6)

    Hotkey % "^!"Item1.physicalKey, % set_QuickDrop_Item1, %activeOrNot%
    Hotkey % "^!"Item2.physicalKey, % set_QuickDrop_Item2, %activeOrNot%
    Hotkey % "^!"Item3.physicalKey, % set_QuickDrop_Item3, %activeOrNot%
    Hotkey % "^!"Item4.physicalKey, % set_QuickDrop_Item4, %activeOrNot%
    Hotkey % "^!"Item5.physicalKey, % set_QuickDrop_Item5, %activeOrNot%
    Hotkey % "^!"Item6.physicalKey, % set_QuickDrop_Item6, %activeOrNot%

    ; Shift-Queue
    Hotkey % "^!+"Item1.physicalKey, % set_QuickDrop_Item1, %activeOrNot%
    Hotkey % "^!+"Item2.physicalKey, % set_QuickDrop_Item2, %activeOrNot%
    Hotkey % "^!+"Item3.physicalKey, % set_QuickDrop_Item3, %activeOrNot%
    Hotkey % "^!+"Item4.physicalKey, % set_QuickDrop_Item4, %activeOrNot%
    Hotkey % "^!+"Item5.physicalKey, % set_QuickDrop_Item5, %activeOrNot%
    Hotkey % "^!+"Item6.physicalKey, % set_QuickDrop_Item6, %activeOrNot%
}

#IfWinActive

;--------------------------------
; DisplacedGrid Control
;--------------------------------

Toggle_DisplacedGrid() {

	if (b_DisplacedGrid == 1) {
		Control_DisplacedGrid(0)
		Control_Overlay(0)
	}	else {
		Control_DisplacedGrid(1)
		Control_Overlay(1)
	}


	; Crutch to link Displaced Grid On/Off with Hold Cast. 
	; Otherwise you can't type because closes the chat :)

	if (enable_HoldRecast == True) {
		Toggle_HoldRecast()
	}
}


Control_DisplacedGrid(switchTo) {
	
	b_DisplacedGrid := switchTo

	ReloadHotkeys()

	ToggleCheckmark(menu_Toggle_DisplacedGrid, switchTo)
	Menu, Tray, Icon, %A_ScriptDir%\Modules\icons\icon_Hotkeys%switchTo%.ico
	FlashSplash("Displaced GRID Keys - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("Displaced GRID Keys - " . switchTo)	
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
; Auxiliary
;----------------------------------------------------------------

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