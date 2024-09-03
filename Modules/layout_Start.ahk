Global	GRID_00 			:= 	[]
Global	GRID_01 			:=	[]
Global	GRID_02 			:=	[]
Global	GRID_03 			:=	[]
Global	GRID_10 			:=	[]
Global	GRID_11 			:=	[]
Global	GRID_12 			:=	[]
Global	GRID_13 			:=	[]
Global	GRID_20 			:=	[]
Global	GRID_21 			:=	[]
Global	GRID_22 			:=	[]
Global	GRID_23 			:=	[]

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

GRID_00.logicalKey 			:= 	"{q}"	; Parentheses are necessary, because otherwise the hotkeys won't work once you change the language in Windows
GRID_01.logicalKey			:=	"{w}"
GRID_02.logicalKey			:=	"{e}"
GRID_03.logicalKey			:=	"{r}"
GRID_10.logicalKey			:=	"{a}"
GRID_11.logicalKey			:=	"{s}"
GRID_12.logicalKey			:=	"{d}"
GRID_13.logicalKey			:=	"{f}"
GRID_20.logicalKey			:=	"{z}"
GRID_21.logicalKey			:=	"{x}"
GRID_22.logicalKey			:=	"{c}"
GRID_23.logicalKey			:=	"{v}"

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