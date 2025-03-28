;-----------------------------------------
; ----- Set Skill Point
;-----------------------------------------
;
; Set Skill Point with CTRL + Ability Key
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_SetSkillPoint				:= "[CTRL] Ability to Set Skill Point"
Menu, Tray, Add, %menu_Toggle_SetSkillPoint%,	Toggle_SetSkillPoint

;-----------------------------------------
; On program start...

if (b_SetSkillPoint == 1) {
	Control_SetSkillPoint(1)
} else {
	Control_SetSkillPoint(0)
	Menu, Tray, Disable, 	%menu_Toggle_SetSkillPoint%
}



;-----------------------------------------
; Module logic

; Set Skill Point with CTRL + Ability Key
SetSkillPoint(objCommand) {

	if (b_EventLog)
		UpdateEventLog("SetSkillPoint..." . objCommand.logicalKey)

	; Ability 1
	if (objCommand.logicalKey == GRID_02.logicalKey) {
		Send % GRID_31.logicalKey ; Hero Abilities Menu
		Sleep, % Rand(50, 100)
		Send % GRID_00.logicalKey ; Ability 1 in Hero Abilities Menu

		if (b_EventLog)
			UpdateEventLog("CTRL + Ability 4")

		return	
	}

	; Ability 2
	if (objCommand.logicalKey == GRID_12.logicalKey) {
		Send % GRID_31.logicalKey ; Hero Abilities Menu
		Sleep, % Rand(50, 100)
		Send % GRID_10.logicalKey ; Ability 2 in Hero Abilities Menu

		if (b_EventLog)
			UpdateEventLog("CTRL + Ability 4")

		return	
	}

	; Ability 3
	if (objCommand.logicalKey == GRID_22.logicalKey) {
		Send % GRID_31.logicalKey ; Hero Abilities Menu
		Sleep, % Rand(50, 100)
		Send % GRID_20.logicalKey ; Ability 3 in Hero Abilities Menu

		if (b_EventLog)
			UpdateEventLog("CTRL + Ability 4")

		return	
	}

	; Ability 4
	if (objCommand.logicalKey == GRID_32.logicalKey) {
		Send % GRID_31.logicalKey ; Hero Abilities Menu
		Sleep, % Rand(50, 100)
		Send % GRID_30.logicalKey ; Ability 4 in Hero Abilities Menu

		if (b_EventLog)
			UpdateEventLog("CTRL + Ability 4")

		return	
	}

}


;-----------------------------------------
; SetSkillPoint Control
;-----------------------------------------

Toggle_SetSkillPoint() {

	if (b_SetSkillPoint == 1) 
		Control_SetSkillPoint(0)
	else 
		Control_SetSkillPoint(1)
}

Control_SetSkillPoint(switchTo) {

	b_SetSkillPoint := switchTo
	
	ToggleCheckmark(menu_Toggle_SetSkillPoint, switchTo)

	if (b_EventLog) {
		UpdateEventLog("SetSkillPoint - " . switchTo)
	}
}