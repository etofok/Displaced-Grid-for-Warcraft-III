Global 	DisplacedGridVersion			:= "v2.2.0"

Global 	winName 						:= "" ; "Warcraft III"				; Warcraft III window name. Moved to settings.ini (v2.1.0)
Global 	winClass 						:= "" ; "ahk_class OsWindow" 		; Warcraft III class name, as seen in WindowSpy of AutoHotkey. Moved to settings.ini (v2.1.0)
Global 	winPID							:= ""
Global 	winID							:= ""

Global 	SettingsIniFile 				:= A_ScriptDir "\settings.ini"
Global 	locate_War3Preferences 			:= A_MyDocuments "\Warcraft III\War3Preferences.txt"
Global 	error_warcraftNotFound 			:= "Warcraft III not found!"

; ----------------------------------------------
; Initialize variables...

Global 	a_Layouts 						:= {}
Global 	LayoutMap 						:= {}
Global 	currentLayout					:=
Global 	layoutName						:=
Global 	hotkeysRemapped					:=
Global 	DisplacedGrid_logoOn = 
Global 	DisplacedGrid_logoOff = 

DisplacedGrid_logoOn = %A_ScriptDir%\Modules\icons\icon_Hotkeys1.ico
DisplacedGrid_logoOff = %A_ScriptDir%\Modules\icons\icon_Hotkeys0.ico

; --- settings  ---
Global 	ActivateHotkeysOnLaunch 		:=
Global 	EnableHotkeyOverlay 			:=
Global 	activateHotkeys 				:=
Global 	Hotkey_Toggle_CurrentLayout		:=
Global 	Hotkey_ScriptReload				:=
Global 	Hotkey_OpenSettings				:=
Global 	Hotkey_EnterAndToggleLayout				:=

; --- quickcast ?  ---
Global 	m_AbilityQuickcast 				:= {}

; --- modules  ---
Global 	m_HealthbarsAlwaysStay 			:= {}
Global 	m_QuickCastItems 				:= {}
Global 	m_RapidFire 					:= {}
Global 	m_RepeatMouse 					:= {}
Global 	m_UnifiedOrders 				:= {}
Global 	m_SetSkillPoint 				:= {}
Global 	m_CastOnYourself 				:= {}
Global 	m_QuickDropItems 				:= {}
Global 	m_ShiftQueueItems 				:= {}
Global 	m_InstantCamera 				:= {}
Global 	m_EventLog	 					:= {} 	
	 	m_EventLog.enabled				:= 0	

Global 	a_Modules						:= [m_HealthbarsAlwaysStay, m_CastOnYourself, m_SetSkillPoint, m_QuickCastItems, m_QuickDropItems, m_UnifiedOrders, m_RapidFire, m_RepeatMouse, m_InstantCamera, m_EventLog]

; unfortunately in v1.1 you have to use flat variables for many things

; --- game relevant keys ---
Global	GRID_00 			:= 	[]
Global	GRID_10 			:=	[]
Global	GRID_20 			:=	[]
Global	GRID_30 			:=	[]
Global	GRID_01 			:=	[]
Global	GRID_11 			:=	[]
Global	GRID_21 			:=	[]
Global	GRID_31 			:=	[]
Global	GRID_02 			:=	[]
Global	GRID_12 			:=	[]
Global	GRID_22 			:=	[]
Global	GRID_32 			:=	[]
Global 	a_GRID 				:= 	[GRID_00, GRID_10, GRID_20, GRID_30, GRID_01, GRID_11, GRID_21, GRID_31, GRID_02, GRID_12, GRID_22, GRID_32]

Global	SelectHero1 		:=	[]
Global	SelectHero2 		:=	[]
Global	SelectHero3 		:=	[]
Global	IdleWorker 			:=	[]
Global	JumpToEvent			:=	[]

Global	ControlGroup1 		:=	[]
Global	ControlGroup2 		:=	[]
Global	ControlGroup3 		:=	[]
Global	ControlGroup4 		:=	[]
Global	ControlGroup5 		:=	[]
Global	ControlGroup6 		:=	[]
Global	ControlGroup7 		:=	[]
Global	ControlGroup8 		:=	[]
Global	ControlGroup9 		:=	[]
Global	ControlGroup0 		:=	[]
Global 	a_ControlGroups 	:= 	[ControlGroup1, ControlGroup2, ControlGroup3, ControlGroup4, ControlGroup5, ControlGroup6, ControlGroup7, ControlGroup8, ControlGroup9, ControlGroup0]

Global	Item1 				:= 	[] 		
Global	Item2 				:= 	[]
Global	Item3 				:= 	[]
Global	Item4 				:= 	[]
Global	Item5 				:= 	[]
Global	Item6 				:= 	[]
Global	ItemsRequireAlt 	:= 	[]
Global	InventoryStartX 	:= 	[]
Global	InventoryStartY 	:= 	[]
Global	InventoryEndX 		:= 	[]
Global	InventoryEndY 		:= 	[]
Global	InventoryWidth 		:= 	[]
Global	InventoryHeight		:= 	[]
Global 	a_Items 			:= 	[Item1, Item2, Item3, Item4, Item5, Item6]

Global	object_LButton 			:= 	[]
Global	object_RButton 			:= 	[]
Global	object_LShift			:= 	[]
Global	object_LCtrl			:= 	[]
Global	object_LAlt 			:= 	[]
Global	object_RShift			:= 	[]
Global	object_RCtrl			:= 	[]
Global	object_RAlt 			:= 	[]
Global	object_Menu				:= 	[]
Global	object_Capslock			:= 	[]
Global	object_Tab				:= 	[]
Global	object_Enter			:= 	[]
Global	object_NumpadEnter		:= 	[]

Global	object_Up				:= 	[]
Global	object_Down				:= 	[]
Global	object_Left				:= 	[]
Global	object_Right			:= 	[]

; --- overlay things ---
Global 	clientArea			:= 	[]
Global 	PortraitUI 			:=	[]

Global 	Coordinates_Items_offset_x 	:= []
Global 	Coordinates_Items_offset_y 	:= []
Global 	CommandCardButtonSize 		:= []
Global 	LastKeyPressTime 			:= 0
;-----------------------------------------

; --- intercept keys ---
Global 	keyPressed_LShift 			:= 0
Global 	keyPressed_LCtrl 			:= 0
Global 	keyPressed_LAlt 			:= 0
Global 	keyPressed_RShift 			:= 0
Global 	keyPressed_RCtrl 			:= 0
Global 	keyPressed_RAlt 			:= 0
Global 	keyPressed_Menu 			:= 0
Global 	keyPressed_CapsLock 		:= 0
Global 	keyPressed_Tab 				:= 0
Global 	keyPressed_Enter 			:= 0
Global 	keyPressed_NumpadEnter		:= 0
Global 	keyPressed_Up				:= 0
Global 	keyPressed_Down				:= 0
Global 	keyPressed_Left				:= 0
Global 	keyPressed_Right			:= 0
Global 	keyPressed_LButton 			:= 0
Global 	keyPressed_RButton 			:= 0

Global repeatHotkey 				:= ""
Global repeatKey 					:= ""
Global repeatRunning 				:= false
Global repeatTimerStarted 			:= false



