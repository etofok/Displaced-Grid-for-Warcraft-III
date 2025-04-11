;-----------------------------------------
; ----- I M A G E  O V E R L A Y -----
;-----------------------------------------
;
; This module overlays an image on top of the Warcraft III:Reforged window.
;
;-----------------------------------------

#Include *i %A_ScriptDir%\Modules\Gdip_All.ahk

; Path to the overlay image
Global DisplacedGrid_Overlay_Path = 
DisplacedGrid_Overlay_Path = %A_ScriptDir%\DisplacedGrid_Overlay\DisplacedGrid_Overlay.png

Global WarcraftIII_posX 	:= 
Global WarcraftIII_posY 	:= 
Global WarcraftIII_width 	:= 
Global WarcraftIII_height 	:= 

; the overlay is tied to the Displaced Grid layout. Layout On = Overlay On.
b_Overlay 										:= b_DisplacedGrid

;-----------------------------------------
; On program start...

if (b_Overlay == 1) {
	Control_Overlay(1)	
} else {
	Control_Overlay(0)
}

;--------------------------------
; Overlay Control
;--------------------------------

Control_Overlay(switchTo) {

	if (switchTo == 1) {
		if WinExist(winTitle) {
			SetupImageOverlay()	; yes, every time to resize it just in case, etc
		} else {
			MsgBox, %error_warcraftNotFound%
		}

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
    
    ; Get the window handle and position of Warcraft III
    WinGet, windowHandle, ID, %winName%
    WinGetPos, WarcraftIII_posX, WarcraftIII_posY, WarcraftIII_width, WarcraftIII_height, %winName%

    ; Create a GUI for the overlay with no borders, etc.
    Gui, gui_imageOverlay: -Caption +ToolWindow +LastFound -Border +Owner%windowHandle%
    Gui, gui_imageOverlay: Color, %color%

    ; Set the GUI background to be fully transparent
    WinSet, TransColor, %color% 255, % gui_imageOverlay

    ; Set the window as click-through
    WinSet, ExStyle, +0x20, % gui_imageOverlay

    ; Add the PNG image to the overlay at the exact size and position of the Warcraft III window
    Gui, gui_imageOverlay: Add, Picture, x0 y0 w%WarcraftIII_width% h%WarcraftIII_height%, %DisplacedGrid_Overlay_Path%

    ; Show the GUI overlay without activating it (No Activate)
    Gui, gui_imageOverlay: Show, NA x%WarcraftIII_posX% y%WarcraftIII_posY% w%WarcraftIII_width% h%WarcraftIII_height%

    ; Ensure the Warcraft III window stays in focus
    WinActivate, %winName%
}

