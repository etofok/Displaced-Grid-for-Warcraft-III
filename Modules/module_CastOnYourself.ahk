;-----------------------------------------
; ----- Cast on Yourself
;-----------------------------------------
; 
; 1) "Alt + Ability X" casts the ability onto the caster (doesn't work with items).
;
; Most contemporary games already have some sort of 'Cast On Yourself' functionality to help players with in-battle control.
; With this module it's now possible in Warcraft 3.
; This is a very blatant macro that targets the Unit Portrait and returns the mouse cursor to its initial position.
;
; 2) ALT + D + D no longer exits the game! 
; In Displaced Grid we use ALT a lot, so it's much easier to accidentally press this combination.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience.
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_CastOnYourself				:= "[ALT] Ability to Cast on Yourself"
Menu, Tray, Add, %menu_Toggle_CastOnYourself%, Toggle_CastOnYourself

;--------------------------------
; On program start...

if (b_CastOnYourself == 1) {
	Control_CastOnYourself(1)
} else {
	Control_CastOnYourself(0)
	Menu, Tray, Disable, 	%menu_Toggle_CastOnYourself%
}

;--------------------------------

;--------------------------------
; Module
;--------------------------------

CastOnYourself(objCommand) {
	
	; Store in memory where the mouse cursor currently is...
	MouseGetPos, StartX, StartY			

	; if Shift is pressed down...
	if (GetKeyState("Shift", "P")) {

		if (b_EventLog)
			UpdateEventLog("Shift + Cast on Yourself! (" objCommand.logicalKey ")")	

		; Move the cursor onto Portrait, activate the ability
		MouseMove, PortraitUI.x, PortraitUI.y	; I feel like moving THEN clicking the portrait is more consistent
		Send % "{Shift Down}"objCommand.logicalKey
		Click % PortraitUI.x " " PortraitUI.y

		; PortraitUI.x, PortraitUI.y are the X,Y coordinates to click Unit Portait on your screen (1920x1080 resolution)
		; if you play on a screen different resolution:
		; PrintScreeen -> Paste your in-game screenshot into Paint.exe and find the X,Y coordinates of the Portrait UI element
		; (adjust in UserSettings.ahk (open in Notepad))

		; if RapidFire is ON, we need to issue the Escape command to not break the Shift-Queue
		if (b_RapidFire == 1) {
			RapidFire_queue()

			if (b_EventLog)
				UpdateEventLog("Deselect")			
		}

	; if Shift is not pressed down...
	} else {

		if (b_EventLog)
			UpdateEventLog("Cast on Yourself! (" objCommand.logicalKey ")")	 

		; We must issue a 'Stop' command to cancel the current order.
		; Otherwise the caster will turn.
		; The stop command is needed I promise.
		Send % GRID_10.logicalKey

		; Move the cursor onto Portrait, activate the ability
		MouseMove, PortraitUI.x, PortraitUI.y	
		Send % objCommand.logicalKey
		Click % PortraitUI.x " " PortraitUI.y

		; PortraitUI.x, PortraitUI.y are the X,Y coordinates to click Unit Portait on your screen (1920x1080 resolution)
		; if you play on a different screen resolution:
		; PrintScreeen -> Paste your in-game screenshot into Paint.exe and find the X,Y coordinates of the Portrait UI element
		; (adjust in UserSettings.ahk (open in Notepad))
	}

	if (b_EventLog)
		UpdateEventLog("Clicked Portait")	

	; Return the mouse cursor to its initial position
	MouseMove, StartX, StartY

	if (b_EventLog)
		UpdateEventLog("Returning Mouse Cursor to " StartX ", " StartY)
}


;-----------------------------------------
; CastOnYourself Control
;-----------------------------------------

Toggle_CastOnYourself() {

	if (b_CastOnYourself == 1) {
		Control_CastOnYourself(0)
	} else {
		Control_CastOnYourself(1)
	}
} 


Control_CastOnYourself(switchTo) {

	b_CastOnYourself := switchTo
	
	ToggleCheckmark(menu_Toggle_CastOnYourself, switchTo)

	if (b_EventLog) {
		UpdateEventLog("Cast on Yourself - " . switchTo)
	}
}