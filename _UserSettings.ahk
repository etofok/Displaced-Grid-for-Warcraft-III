;-----------------------------------------
; Welcome to UserSettings!
; Please set aside 5 minutes to set up everything once and for all.
;-----------------------------------------



;-----------------------------------------
;
; (!) How to enable QuickCasts for Abilities in Warcraft III:Reforged.
; Displaced Grid is designed with this functionality in mind.
;
; Step 1. You MUST use the 'GRID' layout. 
; Warcraft III -> Menu -> Options -> Input -> Preset Keybindings -> Dropdown select "Grid" -> Save -> Exit Warcraft III
;
; Step 2. Open War3Preferences.txt
; Go to your %USERNAME%\Documents\Warcraft III\War3Preferences.txt
;
; Step 3. 
; In War3Preferences.txt change every "QuickCast=0" to "QuickCast=1".
; Save War3Preferences.txt -> Launch the game.
;
;-----------------------------------------






;-----------------------------------------
; 1. Do you want to switch Displaced Grid hotkeys on or off on app Launch?
;-----------------------------------------

Global b_DisplacedGrid 			:= True		; True / False



;-----------------------------------------
; 2. What hotkeys do you want to control the app with?
;-----------------------------------------

Hotkey_Toggle_DisplacedGrid		= ScrollLock 	; Hotswitch between Displaced Grid and Default hotkeys. You need this in order to type in game chats.
Hotkey_ScriptReload 			= ^Numpad3 	; Reload Script. Default is CTRL+Numpad3

; ^ - CTRL
; + - SHIFT
; ! - ALT
; Wiki page: https://www.autohotkey.com/docs/v1/Hotkeys.htm



;-----------------------------------------
; 3. What MODULES do you want to use?
;
; If set to 'True' - the module WILL be loaded.
; If set to 'False' - the module WILL NOT be loaded.
;-----------------------------------------

Global b_QuickCastItems 		:= True 	; Pseudo QuickCast for Items (requires precise pixel coordinates, see below)
Global b_RapidFire			:= True 	; RapidFire Casting: Hold Command
Global b_ShiftQueueItems		:= True 	; Queue items by holding SHIFT
Global b_AltKeyImprovements		:= True 	; Hold ALT to Self Cast. Holding ALT no longer block commands.
Global b_CommandMultipleGroups 		:= True 	; Command Multiple Groups (defaults 'A', 'S', 'Z' and 'X', see below)
Global b_CameraHotkeys 			:= True 	; Instant Camera Jump for certain groups (defaults 'F1', 'F2', 'F3' and 'F4', see below)
Global b_QuickDropItems 		:= True 	; ALT + CTRL + q/w/a/s/z/x to drop/pass items to mouse cursor (requires precise pixel coordinates, see below)

Global b_EventLog	 		:= False 	; This is a debugging overlay used in development.



;-----------------------------------------
; 4. To which control groups would you like to attach the instant camera pan functionality? | 'Camera Hotkeys' Module Set Up
;
; The defaults in Displaced Grid are the control groups 7,8,9 and 0 (which are bound to F1 F2 F3 and F4).
; These are VALID control groups.
; The module double-taps the group when you tap it, that's why the camera instantly pans.
;-----------------------------------------

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

; I found two main use cases:
; Instant camera pan to a scout or a hit-squad
; Instant camera pan between your Main Base and Expansion



;-----------------------------------------
; 5. Which control groups would you like to manage simultaneously using CapsLock? | 'Command Multiple Groups' Module Set Up
;
; This module allow the user to send attack/move/cast/stop/hold/patrol commands to specific control groups.
;
; I recommend using CG1 CG2 CG3 CG4 as your main 'army' hotkeys (which are bound to 'A', 'S', 'Z' and 'X').
; I recommend using CG5 or CG6 as your 'production' hotkey (which are bound to Q and W respectively).
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
; 6. Where is the Portrait UI element located on your screen?
;
; This is required for the "Alt Cast" module in order to click the Portrait UI element.
; Otherwise this module will not work properly.
;
; You can easily check the coordinates in Windows Paint (see in the bottom-left), like so:
; https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/assets/images/pixelhuntsetup.mp4
;-----------------------------------------

; The following works for 1920x1080
PortraitUI.x := 700
PortraitUI.y := 900



;-----------------------------------------
; 7. Where is the Inventory/Backpack UI element located on your screen?
;
; This is required for the QuickCastItem module, because we pixel hunt whether the item is on cooldown or not (by its blue cooldown overlay).
; This is required for the QuickDropItem module, because we right-click the item in order to grab-and-drag it.
; Otherwise these two modules will not work properly.
;
; You can easily check the coordinates in Windows Paint (see in the bottom-left), like so:
; https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/assets/images/pixelhuntsetup.mp4
;
; We are looking for the blue overlay on top of the item border. Just one pixel.
;
; This way we can determine whether or not the item slot contains an item (by its silver-colored border), and we also can determine whether or not the item is on cooldown (by the blue overlay).
;-----------------------------------------

; The following works for 1920x1080

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

;-----------------------------------------

; That's it!
; etofok
