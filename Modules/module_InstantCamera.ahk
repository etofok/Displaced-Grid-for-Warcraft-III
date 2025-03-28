;-----------------------------------------
; ----- Instant Camera
;-----------------------------------------
;
; This is a tiny module that allows the user to instantly move (pan) the camera to a control group. 

; The defaults in Displaced Grid are the control groups 7,8,9 and 0 (which are bound to f1 f2 f3 f4).
; These are VALID control groups - not separate cameras!
;
; This module double-taps the group when you single tap it. That's how the camera instantly pans.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that may or not provide an advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_InstantCamera			:= "Instant Camera"
Menu, Tray, Add, %menu_Toggle_InstantCamera%, Toggle_InstantCamera

;-----------------------------------------
; On program start...

if (b_InstantCamera == 1) {
	Control_InstantCamera(1)
} else {
	Control_InstantCamera(0)
	Menu, Tray, Disable, 	%menu_Toggle_InstantCamera%
}

;-----------------------------------------
; Module

InstantCamera(objCommand) {

	if (objCommand.instantCamera == 1) {
		Send % objCommand.logicalKey, 1
	}	
}

;-----------------------------------------
; InstantCamera Control
;-----------------------------------------

Toggle_InstantCamera() {

	if (b_InstantCamera == 1)
		Control_InstantCamera(0)
	else
		Control_InstantCamera(1)
} 

Control_InstantCamera(switchTo) {

	b_InstantCamera := switchTo
	
	ToggleCheckmark(menu_Toggle_InstantCamera, switchTo)

	if (b_EventLog) {
		UpdateEventLog("Instant Camera - " . switchTo)	
	}
}