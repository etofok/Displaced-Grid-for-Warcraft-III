;-----------------------------------------
; ----- Camera Hotkeys
;-----------------------------------------
;
; This is a tiny module that allows the user to instantly pan the camera to a control group. 
; This acts as a pseudo camera hotkey.

; The defaults in Displaced Grid are the control groups 7,8,9 and 0 (which are bound to f1 f2 f3 f4).
; These are VALID control groups.
; The module double-taps the group when you tap it, that's why the camera instantly pans.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_CameraHotkeys			:= "Camera Hotkeys | Instant Camera Pan"
Menu, Tray, Add, %menu_Toggle_CameraHotkeys%, Toggle_CameraHotkeys

;-----------------------------------------
; On program start...

if (b_CameraHotkeys == 1) {
	Control_CameraHotkeys(1)
} else {
	Control_CameraHotkeys(0)
	Menu, Tray, Disable, 	%menu_Toggle_CameraHotkeys%
}

;-----------------------------------------
; Module

InstantCameraPan(objCommand) {

	if (objCommand.instantCameraPan == 1) {
		Send % objCommand.logicalKey, 1
	}	
}

;-----------------------------------------
; CameraHotkeys Control
;-----------------------------------------

Toggle_CameraHotkeys() {

	if (b_CameraHotkeys == 1)
		Control_CameraHotkeys(0)
	else
		Control_CameraHotkeys(1)
} 

Control_CameraHotkeys(switchTo) {

	b_CameraHotkeys := switchTo
	
	ToggleCheckmark(menu_Toggle_CameraHotkeys, switchTo)

	if (b_EventLog) {
		UpdateEventLog("Camera Hotkeys - " . switchTo)	
		FlashSplash("Camera Hotkeys - " . switchTo, FlashSplashTime)
	}
}