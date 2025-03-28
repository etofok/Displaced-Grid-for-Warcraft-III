;-----------------------------------------
; ----- QuickDrop Items
;-----------------------------------------
; Ctrl + Alt + Item1 / Item2 / Item3 / Item4 / Item5 / Item6 
;(+ Shift)
;
; Drop/Pass/Sell an item from your inventory to the target at mouse cursor: 
; a. place on the ground
; b. pass to a hero
; c. sell in a shop.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_QuickDropItems				:= "[CTRL] Item to QuickDrop"
Menu, Tray, Add, %menu_Toggle_QuickDropItems%, Toggle_QuickDropItems

;-----------------------------------------
; On program start...

if (b_QuickDropItems == 1) {
	Control_QuickDropItems(1)
} else {
	Control_QuickDropItems(0)
	Menu, Tray, Disable, 	%menu_Toggle_QuickDropItems%
}

;-----------------------------------------
; QuickDrop Module
;-----------------------------------------

QuickDrop(objItem) {

	if (b_QuickDropItems == 0) {

		if (b_EventLog) {
			UpdateEventLog("QuickDropItems module is off!")	
		}

		return
	}

	ItemX := objItem.x
	ItemY := objItem.y+4 ; a few pixels below the coordinates specified in UserSettings.ahk

	MouseGetPos, StartX, StartY			; remember where the mouse cursor is

	; if Shift is pressed down...
	if !(GetKeyState("Shift", "P")) {	
		Send {Click Right}										; issue a right-click, so the unit starts to move towards the target immediately. 
		Send {Click %ItemX% %ItemY% Right}						; grab the item on the interface
		Send {Click %StartX% %StartY%}							; otherwise Mouse Left Click

	} else {
		;Send {Shift Down}{Click Right}{Shift Up}				; This is an important difference that's necessary to comment out, because otherwise it'll shift-queue the 'follow' order.
		Send {Click %ItemX% %ItemY% Right}						; grab the item on the interface
		Send {Shift Down}{Click %StartX% %StartY%}{Shift Up}	; then Shift Mouse Left Click
	}
}

;--------------------------------
; QuickDropItems Control
;--------------------------------

Toggle_QuickDropItems() {

	if (b_QuickDropItems == 1)
		Control_QuickDropItems(0)
	else
		Control_QuickDropItems(1)
} 


Control_QuickDropItems(switchTo) {

	b_QuickDropItems := switchTo

	ToggleCheckmark(menu_Toggle_QuickDropItems, switchTo)

	if (b_EventLog) {
		UpdateEventLog("QuickDrop Items - " . switchTo)
	}
}