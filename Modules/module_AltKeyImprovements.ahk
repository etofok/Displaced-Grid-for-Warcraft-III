;-----------------------------------------
; ----- Cast On Yourself
;-----------------------------------------
; 
; 1) Double Tap the ability to target self with it (doesn't work with items).
;
; Most contemporary games do have some sort of 'Cast On Yourself' functionality to help players with in-battle control.
; I've implemented 'Hold Alt + Double Tap Ability Hotkey' functionality to self cast spells.
;
; 2) 'Alt' no longer prevents Ability use.
;
; By default in Warcraft III, if you hold the 'Alt' key it blocks the usage of abilities and items.
;
; This is very relevant, because we intend to use our Items with Alt + QWASZX,
; which means, by default, we wouldn't be able to press something like 'Alt + Q' -> 'Alt + E', because Alt would block everything.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_AltKeyImprovements				:= "Cast On Yourself: Hold Alt -> Double Tap"
Menu, Tray, Add, %menu_Toggle_AltKeyImprovements%, Toggle_AltKeyImprovements

;--------------------------------
; On program start...

if (b_AltKeyImprovements == 1) {
	Control_AltKeyImprovements(1)
}

;--------------------------------

;--------------------------------
; Module
;--------------------------------

AltKeyImprovements(objCommand) {
	
	UpdateEventLog("--- Self-Target Cast ----")

	; ALT KEY Functionality: 
	; 1) ALT Key no longer blocks regular Ability casts. This is useful because our Item Hotkeys are on Alt modifier.
	; 2) Double Tap / Hold Ability key to SELF CAST. This is a macro that will cast the Ability on Unit Portrait and return the mouse cursor to its position.

	; if Double Tapped...
	if (A_ThisHotkey == A_PriorHotkey and A_TimeSincePriorHotkey < 400) {
			
			if (b_EventLog)
				UpdateEventLog("Self-Target Cast!")	

			; We MUST cancelcast the already enabled Blizzard's QuickCast=1 in War3Preferences.txt
			; Otherwise the spell will be cast immediately on mouse cursor, as intended by QuickCast=1 in War3Preferences.txt
			; 
			; With Shift key pressed this is still relevant because...
			; in case there's no queue the cast will immediately fire as there is no queue
			

			; immediately issue 'Stop' command to cancel the current order
			; (!) GRID_01 in 'Build' menu is NOT a 'Stop' command, as any other non-default command card layouts.
			Send % GRID_01.logicalKey

			; Remember where the mouse cursor is
			MouseGetPos, StartX, StartY			

			; if Shift is pressed down...
			if (GetKeyState("Shift", "P")) {

					if (b_EventLog)
						UpdateEventLog("Shift + Self-Target Cast! (" objCommand.logicalKey ")")	

					Send % "{Shift Down}"objCommand.logicalKey


					; Self Cast Portrait (with Shift)
					; PortraitUI.x, PortraitUI.y are the X,Y coordinates to click Unit Portait on your screen (1920x1080 resolution)
					; if you play on a different resolution paste an in-game screenshot into Paint and determine the X,Y coordinates to click
					; (modify X,Y in UserSettings.ahk (open in Notepad))

					MouseMove, PortraitUI.x, PortraitUI.y	; I feel like moving THEN clicking the portrait is more consistent
					Send % "{Shift Down}"objCommand.logicalKey
					Click % PortraitUI.x " " PortraitUI.y

					if (b_RapidFire == 1) {

						Send {Shift Down}{Escape}

						if (b_EventLog)
							UpdateEventLog("Deselect")			
					}

			; if Alt Double Tap, but Shift is not pressed down...
			} else {

					if (b_EventLog)
						UpdateEventLog("Self-Target Cast! (" objCommand.logicalKey ")")	 

					; Self Cast Portrait
					; PortraitUI.x, PortraitUI.y are the X,Y coordinates to click Unit Portait on your screen (1920x1080 resolution)
					; if you play on a different resolution paste an in-game screenshot into Paint and determine the X,Y coordinates to click
					; (see UserSettings.ahk)

					MouseMove, PortraitUI.x, PortraitUI.y	; I feel like moving THEN clicking the portrait is more consistent
					Send % objCommand.logicalKey
					Click % PortraitUI.x " " PortraitUI.y
			}

			if (b_EventLog)
				UpdateEventLog("Clicked Portait")	

			; Return the mouse cursor to its initial position on the screen
			MouseMove, StartX, StartY

			if (b_EventLog)
				UpdateEventLog("Returning Mouse Cursor to " StartX ", " StartY)

		
	} else { 

			; if Alt is pressed down, but it's not a Double Tap...
			UpdateEventLog("Not a double tap...")
			; We want to be able to use our Abilities when the Alt Key is pressed down.
			; Why? Because we hold the Alt key to use our Items Hotkeys...
			; which means we would otherwise had to let go of Alt if we were to use an Ability.
			; This fixes the Alt key effectively blocking the Ability keys.

			if (GetKeyState("Shift", "P")) {	
					
					; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.
					; We must let go of the Shift key, activate the Item Hotkey, THEN hold down Shift and only then select the target.
					; The ShiftQueueItems module improves this so we do not have to let go of the Shift key to activate the Item key.
					
					if (b_EventLog) 
						UpdateEventLog("Shift + Alt + (" KeyToPress ")`nFiring the Ability anyway!")

					Send % "{Shift Down}"objCommand.logicalKey

			} else {					
					
					if (b_EventLog)
						UpdateEventLog("Alt + (" KeyToPress ")`nFiring the Ability anyway!")

					if (b_RapidFire == 1) {
						
						Send, {Escape}
						Send % objCommand.logicalKey
						
						return
					}

					Send % objCommand.logicalKey
			}
	}

}


;-----------------------------------------
; AltKeyImprovements Control
;-----------------------------------------

Toggle_AltKeyImprovements() {

	if (b_AltKeyImprovements == 1) {
		Control_AltKeyImprovements(0)
	} else {
		Control_AltKeyImprovements(1)
	}
} 


Control_AltKeyImprovements(switchTo) {

	b_AltKeyImprovements := switchTo
	
	ToggleCheckmark(menu_Toggle_AltKeyImprovements, switchTo)

	if (b_EventLog) {
		UpdateEventLog("Self-Target Cast - " . switchTo)
		FlashSplash("Self-Target Cast - " . switchTo, FlashSplashTime)
	}
}