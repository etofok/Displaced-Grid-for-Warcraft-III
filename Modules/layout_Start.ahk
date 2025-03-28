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

Global	Item1 				:= 	[] 		
Global	Item2 				:= 	[]
Global	Item3 				:= 	[]
Global	Item4 				:= 	[]
Global	Item5 				:= 	[]
Global	Item6 				:= 	[]

Global	MouseButtonRight 	:= 	[]

;-------------------------------------------
; Command Card.
;-------------------------------------------

; Blizzard GRID
; | 0,0 | 1,0 | 2,0 | 3,0 |
; | 0,1 | 1,1 | 2,1 | 3,1 |
; | 0,2 | 1,2 | 2,2 | 3,2 |

GRID_00.logicalKey 			:= 	"{q}"	; Parentheses are necessary, because otherwise the hotkeys won't work once you change the language in Windows
GRID_10.logicalKey			:=	"{w}"
GRID_20.logicalKey			:=	"{e}"
GRID_30.logicalKey			:=	"{r}"
GRID_01.logicalKey			:=	"{a}"
GRID_11.logicalKey			:=	"{s}"
GRID_21.logicalKey			:=	"{d}"
GRID_31.logicalKey			:=	"{f}"
GRID_02.logicalKey			:=	"{z}"
GRID_12.logicalKey			:=	"{x}"
GRID_22.logicalKey			:=	"{c}"
GRID_32.logicalKey			:=	"{v}"

;-------------------------------------------
; Select Hero.
;----------------------------------------

SelectHero1.logicalKey		:= 	"{f1}"
SelectHero2.logicalKey		:= 	"{f2}"
SelectHero3.logicalKey		:= 	"{f3}"
IdleWorker.logicalKey		:=	"{f8}"
JumpToEvent.logicalKey		:=	"{Space}"

;-------------------------------------------
; Control Groups.
;-------------------------------------------

ControlGroup1.logicalKey	:=	"{1}"
ControlGroup2.logicalKey	:=	"{2}"
ControlGroup3.logicalKey	:=	"{3}"
ControlGroup4.logicalKey	:=	"{4}"
ControlGroup5.logicalKey	:=	"{5}"
ControlGroup6.logicalKey	:=	"{6}"
ControlGroup7.logicalKey	:=	"{7}"
ControlGroup8.logicalKey	:=	"{8}"
ControlGroup9.logicalKey	:=	"{9}"
ControlGroup0.logicalKey	:=	"{0}"

;-------------------------------------------
; Items.
;-------------------------------------------

Item1.slot					:= 	1
Item1.logicalKey 			:=	"{numpad7}"

Item2.slot					:= 	2
Item2.logicalKey 			:=	"{numpad8}"

Item3.slot					:= 	3
Item3.logicalKey 			:=	"{numpad4}"

Item4.slot					:= 	4
Item4.logicalKey 			:=	"{numpad5}"

Item5.slot					:= 	5
Item5.logicalKey 			:=	"{numpad1}"

Item6.slot					:= 	6
Item6.logicalKey 			:=	"{numpad2}"

;-------------------------------------------

MouseButtonRight.logicalKey := "{Rbutton}"