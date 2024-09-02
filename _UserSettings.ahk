;-----------------------------------------
; Welcome to the Set Up file
;-----------------------------------------



;-----------------------------------------
; What hotkey do you want to control the App with?
;
; ^ - CTRL
; + - SHIFT
; ! - ALT
; Wiki page: 
; https://www.autohotkey.com/docs/v1/Hotkeys.htm

Hotkey_Toggle_DisplacedGrid								= ScrollLock 	; Hotswitch between Displaced Grid and Default Grid
Hotkey_ScriptReload 									= ^Numpad3 		; Reload Script (in case you've modified internal code)
Hotkey_ScriptFolder										= 

;-----------------------------------------
; What Modules do you want to have access to?
;
; If set to 'True' - Module will load on start and will be present in App Tray
; If set to 'False' - Module will NOT load on start and will NOT be present in App Tray
;-----------------------------------------

Global b_DisplacedGrid 									:= True ; / False

Global b_QuickCastItems 								:= True
Global b_HoldRecast										:= True
Global b_ShiftQueueItems								:= True
Global b_AltKeyImprovements								:= True
Global b_CommandMultipleGroups 							:= True
Global b_CameraHotkeys 									:= True
Global b_QuickDropItems 								:= True

Global b_EventLog	 									:= False ; this is a debugging overlay

;-----------------------------------------
; 'Camera Hotkeys' Module Set Up
;
; defaults in Displaced Grid are control groups 7,8,9,0 
; which are bound to f1 f2 f3 f4

ControlGroup1.jumpCameraInstantly := False 	; a
ControlGroup2.jumpCameraInstantly := False 	; s
ControlGroup3.jumpCameraInstantly := False 	; z
ControlGroup4.jumpCameraInstantly := False 	; x
ControlGroup5.jumpCameraInstantly := False 	; q
ControlGroup6.jumpCameraInstantly := False 	; w
ControlGroup7.jumpCameraInstantly := True 	; f1
ControlGroup8.jumpCameraInstantly := True 	; f2
ControlGroup9.jumpCameraInstantly := True 	; f3
ControlGroup0.jumpCameraInstantly := True 	; f4

;-----------------------------------------
; 'Command Multiple Groups' Module Set Up
;
; Your designated 'Army' Control Groups
; I recommend using CG1 CG2 CG3 CG4 as your 'army' (which are bound to A S Z X)
; I recommed using CG5 CG6 as your 'production' (which are bound to Q W)
;-----------------------------------------

ControlGroup1.commandThisGroup := True 		; a
ControlGroup2.commandThisGroup := True 		; s
ControlGroup3.commandThisGroup := True 		; z
ControlGroup4.commandThisGroup := True 		; x
ControlGroup5.commandThisGroup := False 	; q
ControlGroup6.commandThisGroup := False 	; w
ControlGroup7.commandThisGroup := False 	; f1
ControlGroup8.commandThisGroup := False 	; f2
ControlGroup9.commandThisGroup := False 	; f3
ControlGroup0.commandThisGroup := False 	; f4

;-----------------------------------------
; ???Where is your Portait UI element on your screen???
; Relevant for the AltKeyImprovements module, because we mouse click the Portrait UI element
;
; otherwise this module won't work
;
; You can see the coordinates in Paint:
; https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/assets/images/pixelhuntsetup.mp4
;-----------------------------------------

PortraitUI.x := 700
PortraitUI.y := 900

;-----------------------------------------
; ???Where is your Inventory/Backpack UI on your screen???
;
; Relevant for the QuickCastItem module, because we pixel hunt whether or not it is on cooldown
; Relevant for the QuickDropItem module, because we click the item
;
; otherwise these two modules won't work
;
;-----------------------------------------
; The following works for 1920x1080
;
; You can see the coordinates in Paint:
; https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/assets/images/pixelhuntsetup.mp4
;-----------------------------------------

; item slot #1 (top-left)
Item1.x 					:= 	1197
Item1.y 					:= 	880

; item slot #2 (top-right)
Item2.x 					:= 	1270
Item2.y 					:= 	880

; item slot #3 (middle-left)
Item3.x 					:= 	1197
Item3.y 					:= 	949

; item slot #4 (middle-right)
Item4.x 					:= 	1270
Item4.y 					:= 	949

; item slot #5 (bottom-left)
Item5.x 					:= 	1197
Item5.y 					:= 	1017

; item slot #6 (bottom-right)
Item6.x 					:= 	1270
Item6.y 					:= 	1017