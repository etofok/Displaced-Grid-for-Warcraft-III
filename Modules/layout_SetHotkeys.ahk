SetHotkeys(activeOrNot) {

	if (activeOrNot == 1)
		activeOrNot := "On"
	else
		activeOrNot := "Off"

	; ----------------------------------------------------
	; Jump to Unique.
	;
	; Defaults are 1 2 3 for Heroes, 
	; 4 for Idle Worker
	; 5 for Jump to Recent Event
	; ----------------------------------------------------

	set_SelectHero1									:= Func("Hotkey_CommandCard").bind(SelectHero1)
	set_SelectHero2									:= Func("Hotkey_CommandCard").bind(SelectHero2)
	set_SelectHero3									:= Func("Hotkey_CommandCard").bind(SelectHero3)
	set_IdleWorker									:= Func("Hotkey_CommandCard").bind(IdleWorker)
	set_JumpToEvent									:= Func("Hotkey_CommandCard").bind(JumpToEvent)

	Hotkey % "*"SelectHero1.physicalKey,			% set_SelectHero1, 	%activeOrNot%
	Hotkey % "*"SelectHero2.physicalKey,			% set_SelectHero2, 	%activeOrNot%
	Hotkey % "*"SelectHero3.physicalKey,			% set_SelectHero3, 	%activeOrNot%
	Hotkey % "*"IdleWorker.physicalKey,				% set_IdleWorker,	%activeOrNot%
	Hotkey % "*"JumpToEvent.physicalKey,			% set_JumpToEvent,	%activeOrNot%

	; ----------------------------------------------------
	; Control Groups. 
	;
	; Defaults are f1 f2 f3 f4 qw as zx
	; -------------

	set_ControlGroup1								:= Func("Hotkey_ControlGroup").bind(ControlGroup1)
	set_ControlGroup2								:= Func("Hotkey_ControlGroup").bind(ControlGroup2)
	set_ControlGroup3								:= Func("Hotkey_ControlGroup").bind(ControlGroup3)
	set_ControlGroup4								:= Func("Hotkey_ControlGroup").bind(ControlGroup4)
	set_ControlGroup5								:= Func("Hotkey_ControlGroup").bind(ControlGroup5)
	set_ControlGroup6								:= Func("Hotkey_ControlGroup").bind(ControlGroup6)
	set_ControlGroup7								:= Func("Hotkey_ControlGroup").bind(ControlGroup7)
	set_ControlGroup8								:= Func("Hotkey_ControlGroup").bind(ControlGroup8)
	set_ControlGroup9								:= Func("Hotkey_ControlGroup").bind(ControlGroup9)
	set_ControlGroup0								:= Func("Hotkey_ControlGroup").bind(ControlGroup0)

	Hotkey % "*"ControlGroup1.physicalKey,			% set_ControlGroup1, %activeOrNot%
	Hotkey % "*"ControlGroup2.physicalKey,			% set_ControlGroup2, %activeOrNot%
	Hotkey % "*"ControlGroup3.physicalKey,			% set_ControlGroup3, %activeOrNot%
	Hotkey % "*"ControlGroup4.physicalKey,			% set_ControlGroup4, %activeOrNot%
	Hotkey % "*"ControlGroup5.physicalKey,			% set_ControlGroup5, %activeOrNot%
	Hotkey % "*"ControlGroup6.physicalKey,			% set_ControlGroup6, %activeOrNot%
	Hotkey % "*"ControlGroup7.physicalKey,			% set_ControlGroup7, %activeOrNot%
	Hotkey % "*"ControlGroup8.physicalKey,			% set_ControlGroup8, %activeOrNot%
	Hotkey % "*"ControlGroup9.physicalKey,			% set_ControlGroup9, %activeOrNot%
	Hotkey % "*"ControlGroup0.physicalKey,			% set_ControlGroup0, %activeOrNot%

	; ----------------------------------------------------
	; Command Card.
	;
	; 1rd Row: Move Stop Hold Attack / Build T1 / Train units
	; Defaults are D F G Space
	
	; 2rd Row: T2 / Miscellaneous
	; Default are C V B N

	; 3rd Row: Use Abilities / Build T3, Shop / Research Upgrades
	; Default are E R T Y
   	
   	set_GRID_00 									:= Func("Hotkey_CommandCard").bind(GRID_00)
   	set_GRID_01 									:= Func("Hotkey_CommandCard").bind(GRID_01)
   	set_GRID_02 									:= Func("Hotkey_CommandCard").bind(GRID_02)
    set_GRID_03 									:= Func("Hotkey_CommandCard").bind(GRID_03)

    set_GRID_10 									:= Func("Hotkey_CommandCard").bind(GRID_10)
    set_GRID_11 									:= Func("Hotkey_CommandCard").bind(GRID_11)
    set_GRID_12 									:= Func("Hotkey_CommandCard").bind(GRID_12)
    set_GRID_13 									:= Func("Hotkey_CommandCard").bind(GRID_13)

    set_GRID_20 									:= Func("Hotkey_CommandCard").bind(GRID_20)
    set_GRID_21 									:= Func("Hotkey_CommandCard").bind(GRID_21)
    set_GRID_22 									:= Func("Hotkey_CommandCard").bind(GRID_22)
    set_GRID_23 									:= Func("Hotkey_CommandCard").bind(GRID_23)

    Hotkey % "*"GRID_00.physicalKey, 				% set_GRID_00, %activeOrNot%
    Hotkey % "*"GRID_01.physicalKey, 				% set_GRID_01, %activeOrNot%
    Hotkey % "*"GRID_02.physicalKey, 				% set_GRID_02, %activeOrNot%
    Hotkey % "*"GRID_03.physicalKey, 				% set_GRID_03, %activeOrNot%

    Hotkey % "*"GRID_10.physicalKey, 				% set_GRID_10, %activeOrNot%
    Hotkey % "*"GRID_11.physicalKey, 				% set_GRID_11, %activeOrNot%
    Hotkey % "*"GRID_12.physicalKey, 				% set_GRID_12, %activeOrNot%
    Hotkey % "*"GRID_13.physicalKey, 				% set_GRID_13, %activeOrNot%

    Hotkey % "*"GRID_20.physicalKey, 				% set_GRID_20, %activeOrNot%
    Hotkey % "*"GRID_21.physicalKey, 				% set_GRID_21, %activeOrNot%
    Hotkey % "*"GRID_22.physicalKey, 				% set_GRID_22, %activeOrNot%
    Hotkey % "*"GRID_23.physicalKey, 				% set_GRID_23, %activeOrNot%

	; ----------------------------------------------------
	; Items.
	;
	; Defaults are Alt + q w a s z x
	; -------------

    set_Item1 								:= Func("Hotkey_Item").bind(Item1)
    set_Item2 								:= Func("Hotkey_Item").bind(Item2)
    set_Item3 								:= Func("Hotkey_Item").bind(Item3)
    set_Item4 								:= Func("Hotkey_Item").bind(Item4)
    set_Item5 								:= Func("Hotkey_Item").bind(Item5)
    set_Item6 								:= Func("Hotkey_Item").bind(Item6)

	Hotkey % "*"Item1.physicalKey,			% set_Item1, %activeOrNot%
	Hotkey % "*"Item2.physicalKey,			% set_Item2, %activeOrNot%
	Hotkey % "*"Item3.physicalKey,			% set_Item3, %activeOrNot%
	Hotkey % "*"Item4.physicalKey,			% set_Item4, %activeOrNot%
	Hotkey % "*"Item5.physicalKey,			% set_Item5, %activeOrNot%
	Hotkey % "*"Item6.physicalKey,			% set_Item6, %activeOrNot%

    ; ----------------------------------------------------
    ; Quick Drop Module
    ; ----------------------------------------------------

    set_QuickDrop_Item1 			:= Func("QuickDrop").bind(Item1)
    set_QuickDrop_Item2 			:= Func("QuickDrop").bind(Item2)
    set_QuickDrop_Item3 			:= Func("QuickDrop").bind(Item3)
    set_QuickDrop_Item4 			:= Func("QuickDrop").bind(Item4)
    set_QuickDrop_Item5 			:= Func("QuickDrop").bind(Item5)
    set_QuickDrop_Item6 			:= Func("QuickDrop").bind(Item6)

    Hotkey % "^!"Item1.physicalKey, % set_QuickDrop_Item1, %activeOrNot%
    Hotkey % "^!"Item2.physicalKey, % set_QuickDrop_Item2, %activeOrNot%
    Hotkey % "^!"Item3.physicalKey, % set_QuickDrop_Item3, %activeOrNot%
    Hotkey % "^!"Item4.physicalKey, % set_QuickDrop_Item4, %activeOrNot%
    Hotkey % "^!"Item5.physicalKey, % set_QuickDrop_Item5, %activeOrNot%
    Hotkey % "^!"Item6.physicalKey, % set_QuickDrop_Item6, %activeOrNot%

    ; Shift-Queue
    Hotkey % "^!+"Item1.physicalKey, % set_QuickDrop_Item1, %activeOrNot%
    Hotkey % "^!+"Item2.physicalKey, % set_QuickDrop_Item2, %activeOrNot%
    Hotkey % "^!+"Item3.physicalKey, % set_QuickDrop_Item3, %activeOrNot%
    Hotkey % "^!+"Item4.physicalKey, % set_QuickDrop_Item4, %activeOrNot%
    Hotkey % "^!+"Item5.physicalKey, % set_QuickDrop_Item5, %activeOrNot%
    Hotkey % "^!+"Item6.physicalKey, % set_QuickDrop_Item6, %activeOrNot%
}