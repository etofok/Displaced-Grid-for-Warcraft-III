;-----------------------------------------
; Welcome to UserSettings!
; Please set aside 5 minutes to set up everything once and for all.
;-----------------------------------------



;-----------------------------------------
;
; (!) How to enable QuickCasts for Abilities in Warcraft III:Reforged.
; Displaced Grid is designed with this functionality in mind.
;
; Step 1. You MUST use the 'GRID' layout in Warcraft III:Reforged. 
; Warcraft III -> Menu -> Options -> Input -> Preset Keybindings -> Dropdown select "Grid" -> Save -> Exit Warcraft III
;
; Step 2. Open War3Preferences.txt
; Go to your %USERNAME%\Documents\Warcraft III\War3Preferences.txt
;
; Step 3. 
; In War3Preferences.txt change every "QuickCast=0" to "QuickCast=1".
; Save War3Preferences.txt -> Launch the game.
;
; You now have QuickCasts for Abilities enabled.
;-----------------------------------------






;-----------------------------------------
; 1. Do you want to have Displaced Grid hotkeys on or off on app Launch?
; Change the variable to indicate Yes or No (True = Yes, False = No).
;-----------------------------------------

Global b_DisplacedGrid 			:= True		; True / False



;-----------------------------------------
; 2. What hotkeys do you want to control the app with?
;-----------------------------------------

; Hotswitch between Displaced Grid and Default hotkeys. 
Hotkey_Toggle_DisplacedGrid		= ScrollLock 	

Hotkey_Send_glhf 				= F9 		; type "gl hf" in chat
Hotkey_Send_gg 					= F11		; type "gg" in chat
; you want these two for Displaced Grid because otherwise it's impossible to type.
; it's easier just to press f9/f11 than to deactivate dgrid -> enter -> type -> enter -> activate drid back


Hotkey_ScriptReload 			= ^Numpad3 	; Reload the Script.
; "^" is CTRL in Autohotkey.
; ^ - CTRL
; + - SHIFT
; ! - ALT
; Wiki page: https://www.autohotkey.com/docs/v1/Hotkeys.htm



;-----------------------------------------
; 3. What MODULES do you want to use?
;
; If set to 'True' - the module is ENABLED.
; If set to 'False' - the module is DISABLED.
;-----------------------------------------

Global b_RapidFire			:= False 	; RapidFire Casting: Hold Command
Global b_CameraHotkeys 			:= False 	; Instant camera pan for control groups (defaults 'F1', 'F2', 'F3' and 'F4', see below)
Global b_CommandMultipleGroups 		:= False 	; Command Multiple Groups (defaults 'A', 'S', 'Z' and 'X', see below)
Global b_ShiftQueueItems		:= False 	; Queue items by holding SHIFT and ALT. It's a minor module, but more important for DGRID users because we need to hold down ALT to use items on DGRID.

; The following modules REQUIRE YOUR ATTENTION to work properly.
; These DO NOT work "from the box".
; Down below you'll see how to set these modules
; (it's not hard, just mandatory)

Global b_QuickCastItems 		:= False 	; Pseudo QuickCast for Items (requires precise pixel coordinates, see below)
Global b_QuickDropItems 		:= False 	; ALT + CTRL + q/w/a/s/z/x to drop/pass items to mouse cursor (requires precise pixel coordinates, see below)
Global b_AltKeyImprovements		:= False 	; Hold ALT to Self Cast. Holding ALT no longer block commands.


;-----------------------------------------
; 4. To which control groups would you like to attach the instant camera pan functionality? | 'Camera Hotkeys' Module Set Up
;
; The defaults in Displaced Grid are the control groups 7,8,9 and 0 (which are bound to F1 F2 F3 and F4).
; These are VALID control groups.
; The module double-taps the group when you tap it, that's why the camera instantly pans.
;-----------------------------------------

ControlGroup1.instantCameraPan := False 	; a
ControlGroup2.instantCameraPan := False 	; s
ControlGroup3.instantCameraPan := False 	; z
ControlGroup4.instantCameraPan := False 	; x
ControlGroup5.instantCameraPan := False 	; q
ControlGroup6.instantCameraPan := False 	; w
ControlGroup7.instantCameraPan := True 	; f1
ControlGroup8.instantCameraPan := True 	; f2
ControlGroup9.instantCameraPan := True 	; f3
ControlGroup0.instantCameraPan := True 	; f4

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















Global b_EventLog	 		:= FALSE 	
; This is a debugging overlay used in development for troubleshooting. 
; You can switch it on if you're curious but it's useless for gameplay.
