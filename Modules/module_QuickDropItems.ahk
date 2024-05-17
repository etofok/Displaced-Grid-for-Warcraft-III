; ----------------------------------------------------
;
; Quick Item Drop: Ctrl Alt + 1 2 3 4 5 6 (+ Shift)
;
; Drop/Pass/Sell an item from the inventory to the target at mouse cursor, 
; i.e. place on the ground, pass to a hero or sell in a shop.
;
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
; Just like in World of Warcraft (also a Blizzard game) players are free to bind to instantly use abilities on a specific teammate / target.
; 
; -------------

; Yes I use Globals
Global menu_Toggle_QuickDropItems				:= "QuickDrop Items (hold CTRL)"
Menu, Tray, Add, %menu_Toggle_QuickDropItems%, Toggle_QuickDropItems

;-----------------------------------------
; On program start...

if (b_QuickDropItems == 1) {
	Control_QuickDropItems(1)
}

;-----------------------------------------
; QuickDrop Module
;-----------------------------------------

QuickDrop(objItem) {

	ItemX := objItem.x
	ItemY := objItem.y+4 ; a few pixels below the coordinates specified in UserSettings.ahk

	MouseGetPos, StartX, StartY			; remember where the mouse cursor is

	; if Shift is pressed down...
	if !(GetKeyState("Shift", "P")) {	
		Send {Click Right}										; issue a right-click, so the unit starts to move towards the target immediately. 
		Send {Click %ItemX% %ItemY% Right}						; grab the item on the interface
		Send {Click %StartX% %StartY%}							; otherwise Mouse Left Click

	} else {
	
		;Send {Shift Down}{Click Right}{Shift Up}				; This is an important difference that's necessary to comment out, because otherwise you'll shift-queue the 'follow' order. Meaning, the unit won't get to pass the item ever.
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
	FlashSplash("QuickDrop Items - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("QuickDrop Items - " . switchTo)	
	}
}