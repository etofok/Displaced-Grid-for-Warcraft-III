;-----------------------------------------
; ----- C O M M A N D - A L L - U N I T S -
;-----------------------------------------
; This macro goes through the designated below 'Army Force' control groups and executes the command card action for each.
; At the end, we end up with the 'Army Force 1' selected, because it is our first/main Army group.
;
; Hold CapsLock to command units assigned to CallArmyForceX Control Groups.
; Extremely useful to issue attacks and move commands for the entire army.
;
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
; as discussed in my video showcase there:
; Watch On Youtube -
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_CommandMultipleGroups				:= "Command Multiple Groups (hold CAPSLOCK)"
Menu, Tray, Add, %menu_Toggle_CommandMultipleGroups%,	Toggle_CommandMultipleGroups

;-----------------------------------------
; Capslock Right Click to Order Right Click
;-----------------------------------------

If (false) {

	#If GetKeyState("CapsLock", "P")
		
		*RButton:: 

			CommandMultipleGroups(GetModifiersState(), MouseButtonRight)

		return

	#If
}

;-----------------------------------------
; On program start...

if (b_CommandMultipleGroups == 1) {
	Control_CommandMultipleGroups(1)

	Global ControlGroups := [ControlGroup0, ControlGroup1, ControlGroup2, ControlGroup3, ControlGroup4, ControlGroup5, ControlGroup6, ControlGroup7, ControlGroup8, ControlGroup9]
}


;-----------------------------------------
; Module Control

CommandMultipleGroups(modifiers, objCommand) {

	Loop, % ControlGroups.MaxIndex() {
	    if (ControlGroups[A_Index].commandThisGroup == 1) {
	        Send % ControlGroups[A_Index].logicalKey
	        Send % modifiers objCommand.logicalKey
	    }
	}


	if (b_EventLog) {
		modifiers := ReplaceModifiers(modifiers)
		UpdateEventLog("Command Multiple Groups:`n" modifiers objCommand.logicalKey)	
	}
}

;-----------------------------------------
; CommandMultipleGroups Control
;-----------------------------------------

Toggle_CommandMultipleGroups() {

	if (b_CommandMultipleGroups == 1)
		Control_CommandMultipleGroups(0)
	else
		Control_CommandMultipleGroups(1)
} 

Control_CommandMultipleGroups(switchTo) {

	b_CommandMultipleGroups := switchTo
	
	ToggleCheckmark(menu_Toggle_CommandMultipleGroups, switchTo)
	FlashSplash("Command Multiple Groups - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("Command Multiple Groups - " . switchTo)	
	}
}