;-------------------------------------------
; In-Game Original Grid Hotkeys
; The following in-game hotkeys will be called...

load_BlizzardGrid() {

	SelectHero1.physicalKey		:= 	"f1"
	SelectHero2.physicalKey		:= 	"f2"
	SelectHero3.physicalKey		:= 	"f3"
	IdleWorker.physicalKey		:=	"f8"
	JumpToEvent.physicalKey		:=	"Space"

	ControlGroup1.physicalKey	:=	"1"
	ControlGroup2.physicalKey	:=	"2"
	ControlGroup3.physicalKey	:=	"3"
	ControlGroup4.physicalKey	:=	"4"
	ControlGroup5.physicalKey	:=	"5"
	ControlGroup6.physicalKey	:=	"6"
	ControlGroup7.physicalKey	:=	"7"
	ControlGroup8.physicalKey	:=	"8"
	ControlGroup9.physicalKey	:=	"9"
	ControlGroup0.physicalKey	:=	"0"

	; Blizzard GRID
	; | 0,0 | 1,0 | 2,0 | 3,0 |
	; | 0,1 | 1,1 | 2,1 | 3,1 |
	; | 0,2 | 1,2 | 2,2 | 3,2 |
	
	GRID_00.physicalKey 		:= 	"q"
	GRID_10.physicalKey 		:= 	"w"
	GRID_20.physicalKey 		:= 	"e"
	GRID_30.physicalKey 		:= 	"r"

	GRID_01.physicalKey 		:= 	"a"
	GRID_11.physicalKey 		:= 	"s"
	GRID_21.physicalKey 		:= 	"d"
	GRID_31.physicalKey 		:= 	"f"

	GRID_02.physicalKey 		:= 	"z"
	GRID_12.physicalKey 		:= 	"x"
	GRID_22.physicalKey 		:= 	"c"
	GRID_32.physicalKey 		:= 	"v"

	Item1.physicalKey			:=	"numpad7"
	Item2.physicalKey			:=	"numpad8"
	Item3.physicalKey			:=	"numpad4"
	Item4.physicalKey			:=	"numpad5"
	Item5.physicalKey			:=	"numpad1"
	Item6.physicalKey			:=	"numpad2"

	MouseButtonRight.physicalKey:=	"Rbutton"
}