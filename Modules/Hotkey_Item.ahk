;--------------------------------
; Item Hotkeys are different from the Command Card Hotkeys
;
; a) Item Hotkeys do not respond to QuickCast=1 in War3Preferences.txt
; b) Item Hotkeys do not respond to SHIFT Use Item 
; i.e. to Shift Queue an item the player MUST let go of Shift, then press the Item Hotkey (unshifted) and THEN hold down the Shift key again and mouse left click the target.
; ... which is an outdated / flawed design, and this module improves / fixes this behavior
; ... to allow the player just hold the Shift key and use items/abilities/commands in a consistent manner.
;
;--------------------------------

Hotkey_Item(objCommand) {

	UpdateEventLog("--- Hotkey_Item ----")

	appendModifiers := GetModifiersState()

	if (b_EventLog) {
		mods := ReplaceModifiers(appendModifiers)
		UpdateEventLog("Physical Key Pressed:`t" mods A_ThisHotkey "`nCorresponding GRID:`t" objCommand.logicalKey)	
	}

	; Shift-keyed Item Key Usage
	if (GetKeyState("Shift", "P")) {

		; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.
		; We must let go of the Shift key, activate the Item Hotkey, THEN hold down Shift and only then select the target.
		; The ShiftQueueItems module improves this so we do not have to let go of the Shift key to activate the Item key.

		if (b_ShiftQueueItems == 1) {

			Send % "{Shift Down}"objCommand.logicalKey

			if (b_EventLog)
				UpdateEventLog("Shift Queueing item...")

			if (b_QuickCastItems == 1) {
				QuickCast(objCommand)

				if (b_RapidFire == 1) {
					RapidFire_queue()
				}
			}
		} 

		if (b_ShiftQueueItems == 1) {

			; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.

			if (b_EventLog)
				UpdateEventLog("Attempt to activate " objCommand.logicalKey "`n(Default behavior - no action)")
		}

	; No "Shift" Item Usage

	} else { ; if (GetKeyState("Shift", "P")) {

		; QuickCastItems is a module that fires a pseudo quick cast
		; read more in module_QuickCastItems.ahk

		Send % objCommand.logicalKey ; fire layout key to active item

		if (b_QuickCastItems == 1) {
			
			if (b_EventLog)
				UpdateEventLog("QuickCast Item: " objCommand.logicalKey)

			QuickCast(objCommand)

			if (b_RapidFire == 1) {
				RapidFire()
			}	
		}

		if (b_QuickCastItems == 0) {
			if (b_EventLog)
				UpdateEventLog("Cast Item: " objCommand.logicalKey)
		}
	}
}