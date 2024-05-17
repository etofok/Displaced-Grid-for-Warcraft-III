;-----------------------------------------
; ----- Camera Hotkeys
;-----------------------------------------
;
; This is a tiny module that allows the player to instantly jump to a control group so it acts as a camera hotkey.
; Defaults for Displaced GRID are: f1, f2, f3, f4
;
; You can still use these Control Groups for units, just keep in mind that 
; your camera will instanly jump to center your screen on the main unit in that group
;
; All this module does is essentially an instant double tap on these specific Control Groups
;
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
; as discussed in my video showcase there:
; Watch On Youtube -
;-----------------------------------------

;-----------------------------------------
; Designated 'Camera Hotkeys' Control Groups
; We use CG7 CG8 CG9 CG0 which are rebound to f1 f2 f3 f4

; Yes I use Globals
Global menu_Toggle_CameraHotkeys			:= "Camera Hotkeys"
Menu, Tray, Add, %menu_Toggle_CameraHotkeys%, Toggle_CameraHotkeys

;-----------------------------------------
; On program start...

if (b_CameraHotkeys == 1) {
	Control_CameraHotkeys(1)
}

;-----------------------------------------
; Module

InstantCameraJump(objCommand) {

	if (objCommand.jumpCameraInstantly == 1) {
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
	FlashSplash("Camera Hotkeys - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("Camera Hotkeys - " . switchTo)	
	}
}