;-----------------------------------------
; ----- I M A G E  O V E R L A Y -----
;-----------------------------------------
;
; This module overlay an image on top of the Warcraft III active window
; This image shows the Displaced GRID hotkeys on top of the command card actions and items
;
; (!) You are free to use it in competitive play
;-----------------------------------------

Global WarcraftIII_posX 	:= 
Global WarcraftIII_posY 	:= 
Global WarcraftIII_width 	:= 
Global WarcraftIII_height 	:= 

; initially I wanted to have this module 'turn off-able'
b_Overlay 										:= True


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
		SetupImageOverlay()	; yes, every time to resize it just in case, etc
	} else {
		Gui, gui_imageOverlay:Hide
	}

	b_Overlay := switchTo

	if (b_EventLog) {
		UpdateEventLog("Hotkey Overlay - " . switchTo)	
	}
}


SetupImageOverlay() {
	color := "FFFFFF"

    WinGet, windowHandle, ID, %winName%
    WinGetPos, WarcraftIII_posX, WarcraftIII_posY, WarcraftIII_width, WarcraftIII_height, %winName%

    ; Path to the overlay image
    image_OverlayLayout_Path = %A_ScriptDir%\IMAGE_OVERLAY.png

    ; Set up the GUI for the overlay with transparency
    Gui, gui_imageOverlay:-AlwaysOnTop -Caption +ToolWindow +LastFound -Border +Owner%windowHandle%
    
    ; Add the image with full dimensions of the window
    Gui, gui_imageOverlay:Add, Picture, x0 y0 w%WarcraftIII_width% h%WarcraftIII_height%, %image_OverlayLayout_Path%
 
    ; Show the GUI overlay at the exact position of the Warcraft III window
    Gui, gui_imageOverlay:Show, x%WarcraftIII_posX% y%WarcraftIII_posY% w%WarcraftIII_width% h%WarcraftIII_height%
	Gui, gui_imageOverlay:Color, %color%

    ; Make the GUI transparent and click-through
	WinSet, TransColor, %color% 250, % gui_imageOverlay ; PNG transparency. 0 = fully transparent
	WinSet, ExStyle, +0x20, % gui_imageOverlay	; Click-through

	WinActivate, %winName%
}
