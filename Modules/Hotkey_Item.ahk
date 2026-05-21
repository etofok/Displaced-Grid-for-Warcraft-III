Hotkey_Item(objCommand) {

	static LastKeyPressTime := 0
	local currentTime := A_TickCount ; time in milliseconds

	 
	if (m_EventLog.active) {
		UpdateEventLog("--- Hotkey_Item ----")
		UpdateEventLog("Physical Key:`t" A_ThisHotkey "`nLogical key:`t" objCommand.ingameHotkey)	
	}

	; QuickDrop spaghetti for item hotkeys that do not use ALT as a modifier
	if (m_QuickDropItems.active) {

		; ALT + CTRL pressed down...
		if (keyPressed_LCtrl || keyPressed_RCtrl) {

			if (m_EventLog.active) {
				UpdateEventLog("QuickDrop...")
			}

			if (objCommand.physicalKey == Item1.physicalKey) {
				QuickDrop(Item1)
				return
			}
			if (objCommand.physicalKey == Item2.physicalKey) {
				QuickDrop(Item2)
				return
			}
			if (objCommand.physicalKey == Item3.physicalKey) {
				QuickDrop(Item3)
				return
			}
			if (objCommand.physicalKey == Item4.physicalKey) {
				QuickDrop(Item4)
				return
			}
			if (objCommand.physicalKey == Item5.physicalKey) {
				QuickDrop(Item5)
				return
			}
			if (objCommand.physicalKey == Item6.physicalKey) {
				QuickDrop(Item6)
				return
			}
		}
	} else {

		if (m_EventLog.active) {
			UpdateEventLog("Quick Drop is OFF")	
		}
	}

	; Shift-keyed Item Key Usage
	if (keyPressed_LShift || keyPressed_RShift) {

		; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.
		; We must let go of the Shift key, activate the Item Hotkey, THEN hold down Shift and only then select the target.
		; The ShiftQueueItems module improves this so we do not have to let go of the Shift key to activate the Item key.

		if (m_ShiftQueueItems.active == 1) {

			if (A_PriorKey == objCommand.physicalKey) {
				UpdateEventLog("---- Item Double tap! ---")
				CastOnYourself(objCommand)
				Return
			}

			if (m_EventLog.active) {
				UpdateEventLog("Module QuickCastItems is ON")
			}

			Send % "{Shift Down}"objCommand.ingameHotkey

			if (m_EventLog.active) {
				UpdateEventLog("Shift Queueing item...")
			}

			; ONLY QUICK CAST IF THE MODULE IS ENABLED
			if (m_QuickCastItems.active == 1) {
				QuickCastItem(objCommand)
			}
		}

		; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.
		if (m_ShiftQueueItems.active == 0) {

			if (m_EventLog.active) {
				UpdateEventLog("Attempt to activate " objCommand.ingameHotkey "`n(Default behavior - no action)")
			}
		}

	; No "Shift" Item Usage
	} else {

		; redirect to CastOnYourself if an ITEM hotkey has been double-tapped
		if ((keyPressed_LAlt || keyPressed_RAlt) AND (currentTime - LastKeyPressTime < 200) && LastKeyPressTime != 0)  { ; Added LastKeyPressTime != 0 to prevent initial false positive
	    	UpdateEventLog("---- Item Double Tap! ---")
		    LastKeyPressTime := 0
		    CastOnYourself(objCommand)
		    Return
		}
		
		LastKeyPressTime := currentTime

		Send % objCommand.ingameHotkey ; send in-game command to use the item

		; redirect to quickcast if the module is enabled
		if (m_QuickCastItems.active == 1) {

			if (m_EventLog.active) {
				UpdateEventLog("Module QuickCastItems is ON")
			}

			QuickCastItem(objCommand)

		} else {
			if (m_EventLog.active) {
				UpdateEventLog("Module QuickCast Items is OFF")
			}	
		}
	}
}