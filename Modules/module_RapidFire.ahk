;-----------------------------------------
; ----- RapidFire Casting
;-----------------------------------------
;
; This module enables the user to hold down a hotkey to repeatedly activate it.
;
; Example: we used an Ability, but got an yellow error message ('Unit is immune to magic' / 'Spell is not ready' / 'Must target organic units' / 'Unable to target self' / etc)
;
; "b_RapidFire == 1" will deselect the crosshair-like 'Select Target' mouse cursor state by sending {Espace} key
; ...which allows the user instantly issue the same command.
;
; LIMITATION: it'll deselect your in-game chat panel as you type, because it sends {Escape}, and it closes the chat panel.
; SOLUTION: I tied this module to Displaced Grid layout.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_RapidFire				:= "RapidFire Casting"
Global initialState_RapidFire				:= False

Menu, Tray, Add, %menu_Toggle_RapidFire%,	Toggle_RapidFire

;-----------------------------------------
; On program start...

if (b_RapidFire == 1) {
	Control_RapidFire(1)
	initialState_RapidFire = True
} else {
	Control_RapidFire(0)
	initialState_RapidFire = False ; yea yeah don't care
	Menu, Tray, Disable, 	%menu_Toggle_RapidFire%
}

;-----------------------------------------
; Module Control

RapidFire() {
	Send, {Escape}

	if (b_EventLog)
		UpdateEventLog("Deselect")	
}

RapidFire_queue() {
	Send, {Shift Down}{Escape}

	if (b_EventLog)
		UpdateEventLog("Deselect")
}

;-----------------------------------------
; RapidFire Control
;-----------------------------------------

Toggle_RapidFire() {

	if (b_RapidFire == 1)
		Control_RapidFire(0)
	else
		Control_RapidFire(1)
} 

Control_RapidFire(switchTo) {

	b_RapidFire := switchTo
	
	ToggleCheckmark(menu_Toggle_RapidFire, switchTo)

	if (b_EventLog) {
		UpdateEventLog("Hold RapidFire - " . switchTo)	
		FlashSplash("Hold RapidFire - " . switchTo, FlashSplashTime)
	}
}