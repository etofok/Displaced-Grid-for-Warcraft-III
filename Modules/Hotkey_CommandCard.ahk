Hotkey_CommandCard(objCommand) {

	appendModifiers := GetModifiersState()

	if (b_EventLog) {
		mods := ReplaceModifiers(appendModifiers)
		UpdateEventLog("Physical Key:`t" mods objCommand.physicalKey "`nCorresponding Action:  " mods objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
	}

	; If Alt is pressed down, redirect to the AltKeyImprovements module
	if (b_AltKeyImprovements == 1 and (GetKeyState("Alt", "P")) ) {

		AltKeyImprovements(objCommand)
		return
	}

	; If CapsLock is pressed down, we issue THE command to the CommandTheseGroups (default A S Z X)
	if (b_CommandMultipleGroups == 1) {

		if (GetKeyState("CapsLock", "P")) {
			
			CommandMultipleGroups(appendModifiers, objCommand)
			return
		}
	}


	if (b_RapidFire == 1 and A_ThisHotkey == A_PriorHotkey) {	; * Breakdown below

		Send {Escape}

		if (b_EventLog)
			UpdateEventLog("Deselect")			
	}

	Send % appendModifiers objCommand.logicalKey
}

; This last part with b_RapidFire allows us to hold down a hotkey to repeatedly activate it.
;
; If the key is used again (or being held), we send a 'deselect' (Escape) command right BEFORE it

; This is unintuitive: why BEFORE, not AFTER? 
; There're BIG problems with that sequence.
; 
; First, we can't do proper Alt Double Tap casting
; Second, we gonna cancel worker buiding placement :)
; 
; By putting the deselect BEFORE the cast - we cancel THE SUBSEQUENT casts, not first
; and if we hold down or use the same key again... that's when we start deselecting!


; Example: we used an Ability, but got an error such as 
; 'unit is immune to magic' / 'Spell is not ready' / 'must target organic units' / 'unable to target self' / etc
;
; This code will deselect the 'Select Target' mouse cursor state
; ...and this allows us to use the Ability button again... just by holding the Ability button!

