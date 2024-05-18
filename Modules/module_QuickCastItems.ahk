;-----------------------------------------
; ----- QUICKCASTITEMS
;-----------------------------------------
;
; For some reason QuickCast=1 in .../Documents/WarcraftIII/War3preferences.txt 
; works for Ability hotkeys, 
; but does NOT work for Item hotkeys.
; 
; This module does three things:
; 1. Checks that the item slot is not empty (pixel hunting)
; 2. Checks that the item is not on cooldown (pixel hunting)
; 3. Sends a Left Mouse click
; 
; which makes it a 'Pseudo' Quick Cast.
;
; (!) The reason this is not a 'true' quickcast is because the left mouse click is not connected to 'reality'
; i.e. say, we intend to use an item, but it's a passive item (= not 'activatable').
; This module will send a Left Mouse Click regardless, 
; because it can't differentiate between what's an active and what's a passive item.
;
; This is a very minor limitation - just don't activate passive items.
;
; (!) To make this work on a non-fullHD resolution you must modify the required screen coordinates in UserSettings.ahk
;
; (!) IMPORTANT: Since this is a macro (left click, Pixel Hunt x2) that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
	; I have not found a clever way to differentiate between active and passive Items (i.e. Orb of Fire)
	; which means it'll send a left click if we attempt to use a passive item.
	; SOLUTION: don't attempt to use passive items.

; Having said that, I do believe this functionality SHOULD be a part of the core experience
; as discussed in my video showcase there:
; Watch On Youtube -
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_QuickCastItems				:= "QuickCast Items"
Menu, Tray, Add, %menu_Toggle_QuickCastItems%, Toggle_QuickCastItems

;--------------------------------
; On program start...

if (b_QuickCastItems == 1) {
	Control_QuickCastItems(1)
}

;-----------------------------------------
; QuickCastItems Module 
;-----------------------------------------

QuickCast(objItem) {

	if (b_EventLog) {
		UpdateEventLog("--- QuickCast Items --- ")
		UpdateEventLog("Slot: " objItem.slot "; x: " objItem.x "; y: " objItem.y)	
	}

	;-----------------------------------------
	; check if the Item slot is NOT empty to continue...
	ImageSearch, image_cdX, image_cdY, objItem.x-2, objItem.y-2, objItem.x+2, objItem.y+2, *30 %A_ScriptDir%\Modules\pixelhunt\PixelHunt_NonEmptySlot.png
	
	; image_cdX, image_cdY setup in 
	; PixelHunt_NonEmptySlot is a gray pixel indicating an item's border

	if !(image_cdX > 0) {
			
		if (b_EventLog)
			UpdateEventLog("Slot Item " objItem.slot " is Empty!")	

		return
	}

	;-----------------------------------------
	; check if the Item is NOT on cooldown to continue...
	ImageSearch, image_cdX, image_cdY, objItem.x-2, objItem.y-2, objItem.x+2, objItem.y+2, *10 %A_ScriptDir%\Modules\pixelhunt\PixelHunt_Cooldown.png
	; PixelHunt_Cooldown is a blue pixel indicating an item's cooldown overlay

	if (image_cdX > 0) {
			
		if (b_EventLog) 
			UpdateEventLog("Item " objItem.slot " is on Cooldown!")	

		return
	}

	;-----------------------------------------
	; Finally, send a Click or Shift-Click
	; I have not found a clever way to differentiate between active and passive Items (i.e. Orb of Fire)
	; which means it'll send a left click if we attempt to use a passive item.
	; SOLUTION: don't attempt to use passive items it's not complicated guys.
	
	if (GetKeyState("Shift", "P")) {

		Send {Shift Down}{Click}{Shift Up}

		if (b_EventLog)
			UpdateEventLog("QuickCast: SHIFT CLICK!")

	} else {

		Send {Click}

		if (b_EventLog)
			UpdateEventLog("QuickCast Items: CLICK!")

	}
}


;--------------------------------
; QuickCastItems Control
;--------------------------------

Toggle_QuickCastItems() {

	if (b_QuickCastItems == 1)
		Control_QuickCastItems(0)
	else
		Control_QuickCastItems(1)
} 


Control_QuickCastItems(switchTo) {

	b_QuickCastItems := switchTo
	
	ToggleCheckmark(menu_Toggle_QuickCastItems, switchTo)
	FlashSplash("QuickCast Items - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("QuickCast Items - " . switchTo)	
	}
} 