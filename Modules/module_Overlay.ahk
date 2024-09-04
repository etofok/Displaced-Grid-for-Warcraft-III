;-----------------------------------------
; ----- I M A G E  O V E R L A Y -----
;-----------------------------------------
;
; This module overlays an image on top of the Warcraft III:Reforged window.
;
;-----------------------------------------

; Path to the overlay image
Global image_OverlayLayout_Path = 
image_OverlayLayout_Path = %A_ScriptDir%\Image_Overlay\IMAGE_OVERLAY.png

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
			Gui, gui_imageOverlay:Show, NoActivate, % "x" (WarcraftIII_posX) " y" (WarcraftIII_posY)
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

    WinGet, windowHandle, ID, %winName%
    WinGetPos, WarcraftIII_posX, WarcraftIII_posY, WarcraftIII_width, WarcraftIII_height, %winName%

    ; Add the image with full dimensions of the window
    ; Show the GUI overlay at the exact position of the Warcraft III window
	Gui, gui_imageOverlay:Add, Picture, x0 y0 w%WarcraftIII_width% h%WarcraftIII_height%, %image_OverlayLayout_Path%
	Gui, gui_imageOverlay:Show, x%WarcraftIII_posX% y%WarcraftIII_posY% w%WarcraftIII_width% h%WarcraftIII_height%
    Gui, gui_imageOverlay:-AlwaysOnTop -Caption +ToolWindow +LastFound -Border +Owner%windowHandle%

	Gui, gui_imageOverlay:Color, %color%

    ; Make the GUI transparent and click-through
	WinSet, TransColor, %color% 250, % gui_imageOverlay ; PNG transparency. 0 = fully transparent
	WinSet, ExStyle, +0x20, % gui_imageOverlay	; Click-through

	WinActivate, %winName%
}
