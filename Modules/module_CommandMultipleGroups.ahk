;-----------------------------------------
; ----- C O M M A N D - A L L - U N I T S -
;-----------------------------------------
;
; Hold CapsLock to issue a command to all the units assigned to "commandThisGroup" control groups.
;
; This is A VERY OBVIOUS to anyone macro.
;
; This module loops through the designated 'Army' control groups to execute the action for each group.
; It loops from bottom up so that the first group is selected at the end of the cycle.
;
; Extremely useful to issue attacks and move commands for the entire army.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_CommandMultipleGroups				:= "Command Multiple Groups: Hold CapsLock"
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
	    i := ControlGroups.MaxIndex() - A_Index + 1
	    if (ControlGroups[i].commandThisGroup == 1) {
	        Send % ControlGroups[i].logicalKey
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

	if (b_EventLog) {
		UpdateEventLog("Command Multiple Groups - " . switchTo)	
		FlashSplash("Command Multiple Groups - " . switchTo, FlashSplashTime)
	}
}