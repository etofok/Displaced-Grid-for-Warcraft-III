Hotkey_ControlGroup(objCommand) {

	appendModifiers := GetModifiersState()

	if (b_EventLog) {
		mods := ReplaceModifiers(appendModifiers)
		UpdateEventLog("Physical Key:`t" mods objCommand.physicalKey "`nCorresponding Action:  " mods objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
	}

	Send % appendModifiers objCommand.logicalKey

	; See module_InstantCamera.ahk
	if (b_InstantCamera == 1) {
		InstantCamera(objCommand)	
	}
}