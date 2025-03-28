Hotkey_CommandCard(objCommand) {

	appendModifiers := GetModifiersState()

	if (b_EventLog) {
		mods := ReplaceModifiers(appendModifiers)
		UpdateEventLog("Physical Key:`t" mods objCommand.physicalKey "`nCorresponding Action:  " mods objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
	}

	; If ALT is pressed down, redirect to the CastOnYourself module
	if (b_CastOnYourself == 1 and (GetKeyState("Alt", "P")) ) {

		CastOnYourself(objCommand)
		return
	}

	; If CTRL is pressed down, redirect to the SetSkillPoint module
	if (b_SetSkillPoint == 1 and (GetKeyState("CTRL", "P")) ) {

		SetSkillPoint(objCommand)
		return
	}

	; If CapsLock is pressed down, we issue THE command to the CommandTheseGroups (default A S Z X)
	if (b_CommandMultipleGroups == 1) {

		if (GetKeyState("CapsLock", "P")) {
			
			CommandMultipleGroups(appendModifiers, objCommand)
			return
		}
	}

	; If we're holding down a command the RapidFire module will attempt to fire it repeatedly
	if (b_RapidFire == 1 and A_ThisHotkey == A_PriorHotkey) {	; * Breakdown below
		RapidFire()		
	}

	Send % appendModifiers objCommand.logicalKey
}

; This last part with b_RapidFire allows us to hold down a hotkey to repeatedly activate it.
;
; Example: we used an Ability, but got an error such as 
; 'unit is immune to magic' / 'Spell is not ready' / 'must target organic units' / 'unable to target self' / etc
;
; This code will deselect the 'Select Target' mouse cursor state
; ...and this allows us to use the Ability button again... just by holding the Ability button!



