;-----------------------------------------
; ----- I M A G E  O V E R L A Y -----
;-----------------------------------------
;
; This module overlay an image on top of the Warcraft III active window
; This image shows the Displaced GRID hotkeys on top of the command card actions and items
;
; (!) This is NOT a cheat and you are free to use it in competitive play
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
; as discussed in my video showcase there:
; Watch On Youtube -
;-----------------------------------------

Global WarcraftIII_posX 	:= 
Global WarcraftIII_posY 	:= 
Global WarcraftIII_width 	:= 
Global WarcraftIII_height 	:= 

Hotkey, %Hotkey_Toggle_Overlay%, Toggle_Overlay, UseErrorLevel

; Yes I use Globals
Global Tooltip_Hotkey_Toggle_Overlay 	:= ReplaceModifiers(Hotkey_Toggle_Overlay)
Global menu_Toggle_Overlay				:= "Toggle Overlay <" . Tooltip_Hotkey_Toggle_Overlay 	. ">"

Menu, Tray, Add, %menu_Toggle_Overlay%, Toggle_Overlay

;-----------------------------------------
; On program start...

if (b_Overlay == 1) {

	; only toggle on if the Warcraft III window exists
	if WinExist(winTitle) {
		Control_Overlay(1)
	} else {
		Control_Overlay(0)
		MsgBox, Warcraft III is NOT ACTIVE:`nCannot display the hotkey overlay!`nPlease Run Warcraft III and try again!
	}
}

;--------------------------------
; Overlay Control
;--------------------------------

Toggle_Overlay() {

	if (b_Overlay == 1) {
		Control_Overlay(0)
	} else {
		Control_Overlay(1)
	}
}


Control_Overlay(switchTo) {

	if (switchTo == 1) {
		SetupImageOverlay()	; yes, every time
		Gui, gui_imageOverlay:Show, NoActivate, % "x" (WarcraftIII_posX) " y" (WarcraftIII_posY)
	} else {
		Gui, gui_imageOverlay:Hide
	}

	b_Overlay := switchTo

	ToggleCheckmark(menu_Toggle_Overlay, switchTo)
	FlashSplash("Hotkey Overlay - " . switchTo, FlashSplashTime)

	if (b_EventLog) {
		UpdateEventLog("Hotkey Overlay - " . switchTo)	
	}
} 




; We call this once at the very launch, and then everytime an attempt to enable the overlay is made
SetupImageOverlay() {

	WinGet, windowHandle, ID, %winName%
	WinGetPos, WarcraftIII_posX, WarcraftIII_posY, WarcraftIII_width, WarcraftIII_height, %winName%
	
	image_OverlayLayout_Path = %A_ScriptDir%\IMAGE_OVERLAY.png

	GuiControl, gui_imageOverlay:, Picture, *w(%WarcraftIII_width%) *h(%WarcraftIII_height%) %image_OverlayLayout_Path%
	Gui, gui_imageOverlay:Add, Picture, x(%WarcraftIII_posX%) y(%WarcraftIII_posY%) h(%WarcraftIII_height%) w(%WarcraftIII_width%), %image_OverlayLayout_Path%
	Gui, gui_imageOverlay: -Caption +ToolWindow +LastFound -Border +Owner%windowHandle%
	
	color := "FFFFFF"
	Gui, gui_imageOverlay:Color, %color%
	Gui, gui_imageOverlay:margin, 0, 0

	WinSet, TransColor, %color% 222, % gui_imageOverlay ; PNG transparency. 0 = fully transparent
	WinSet, ExStyle, +0x20, % gui_imageOverlay	; Click-through

}