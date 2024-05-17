;-----------------------------------------
; ----- HoldRecast
;-----------------------------------------

; This module allows us to hold down a hotkey to repeatedly activate it.
;
; Example: we used an Ability, but got an yellow error message such as 
; 'Unit is immune to magic' / 'Spell is not ready' / 'Must target organic units' / 'Unable to target self' / etc
;
; "b_HoldRecast == 1" will deselect the 'Select Target' mouse cursor state by sending {Espace} key
; ...and this allows us to use the Ability button again... just by holding the Ability button!
;
; I've also baked this into Item casts as well, so it works same with Items.
;
; CURRENT LIMITATION: it'll be deselecting your in-game chat message as you type, because {Escape} cancels it
; It's possible to pixel hunt the in-game message UI element, but I didn't bother
	

;-----------------------------------------
; Yes I use Globals
Global menu_Toggle_HoldRecast				:= "Hold Cast"
Menu, Tray, Add, %menu_Toggle_HoldRecast%,	Toggle_HoldRecast

;-----------------------------------------
; On program start...

if (b_HoldRecast == 1) {
	Control_HoldRecast(1)
}

;-----------------------------------------
; Module Control

HoldRecast() {

	Send, {Escape}
}

;-----------------------------------------
; HoldRecast Control
;-----------------------------------------

Toggle_HoldRecast() {

	if (b_HoldRecast == 1)
		Control_HoldRecast(0)
	else
		Control_HoldRecast(1)
} 

Control_HoldRecast(switchTo) {

	b_HoldRecast := switchTo
	
	ToggleCheckmark(menu_Toggle_HoldRecast, switchTo)
	FlashSplash("Hold Recast - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("Hold Recast - " . switchTo)	
	}
}