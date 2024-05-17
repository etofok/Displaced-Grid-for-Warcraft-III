;-----------------------------------------
; ----- SHIFT QUEUE ITEMS
;-----------------------------------------
;
; This module allows the player to use items and abilities keys while holding Shift.
;
; By default, we have to let go of the Shift key in order to activate an item hotkey.
; By default, we have to use left click to Shift-queue abilities.
;
;
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
; as discussed in my video showcase there:
; Watch On Youtube -
;-----------------------------------------

; Yes I use Globals

Global menu_Toggle_ShiftQueueItems				:= "Shift-Queue Items"
Menu, Tray, Add, %menu_Toggle_ShiftQueueItems%, Toggle_ShiftQueueItems

;-----------------------------------------
; On program start...

if (b_ShiftQueueItems == 1) {
	Control_ShiftQueueItems(1)
}

;-----------------------------------------
; ShiftQueueItems Module
;-----------------------------------------

; This module affects the CORE hotkey processing modules 

;--------------------------------
; ShiftQueueItems Control
;--------------------------------

Toggle_ShiftQueueItems() {

	if (b_ShiftQueueItems == 1)
		Control_ShiftQueueItems(0)
	else
		Control_ShiftQueueItems(1)
} 


Control_ShiftQueueItems(switchTo) {

	b_ShiftQueueItems := switchTo
	
	ToggleCheckmark(menu_Toggle_ShiftQueueItems, switchTo)
	FlashSplash("Shift-Queue Items - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("Shift-Queue Items - " . switchTo)	
	}
}