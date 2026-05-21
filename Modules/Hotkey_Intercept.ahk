; this file is responsible for new bevahiors of all intercepted keys
; keys are intercepted in SetHotkeys.ahk
; this is necessary to 'listen' to keystrokes and attack our desired behavior to them

; these functions fire ONLY when a layout is loaded


Hotkey_LAlt() {

	global keyPressed_LAlt
	keyPressed_LAlt := 1

	if (m_EventLog.active) {
		UpdateEventLog("LAlt Pressed")
	}

	; here we intercept and BLOCK the Alt key so that it doesn't toggle off healthbars.

	; on LAlt key resease...
	;KeyWait, LAlt
	KeyWait, % object_LAlt.physicalKey

	; this is very much needed because we intercept and block Alt.
	; this means while Warcraft 3 is active the Alt cannot be activated
	; this is great, because Alt no longer toggles of our healthbars in-game. Especially great, because we use Alt for Items.
	; this is bad, because when Alt is blocked, we can't Alt-tab, which sucks massively.
	; the code below listens to Alt and allows us to "simulate" Alt-Tabbing.
	
	; if we alt-tab the window/game loses focus. the alt will get stuck if we don't check for the window.
	if (A_PriorKey == "Tab" || !WinActive(winClass)) {
		Send {Alt Up}
	}

	; this handles Alt+Enter combo
	if (A_PriorKey == "Enter" || A_PriorKey == "NumpadEnter" ) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send {Alt Up}
	}

	keyPressed_LAlt = 0
	if (m_EventLog.active) {
		UpdateEventLog("LAlt Released")
	}
}


Hotkey_RAlt() {

	global keyPressed_RAlt
	keyPressed_RAlt := 1

	if (m_EventLog.active) {
		UpdateEventLog("RAlt Pressed")
	}

	; here we intercept and BLOCK the Alt key so that it doesn't toggle off healthbars.

	; on RAlt key resease...
	;KeyWait, RAlt
	KeyWait, % object_RAlt.physicalKey

	; this is very much needed because we intercept and block Alt.
	; this means while Warcraft 3 is active the Alt cannot be activated
	; this is great, because Alt no longer toggles of our healthbars in-game. Especially great, because we use Alt for Items.
	; this is bad, because when Alt is blocked, we can't Alt-tab, which sucks massively.
	; the code below listens to Alt and allows us to "simulate" Alt-Tabbing.
	
	; if we alt-tab the window/game loses focus. the alt will get stuck if we don't check for the window.
	if (A_PriorKey == "Tab" || !WinActive(winClass)) {
		Send {Alt Up}
	}

	; this handles Alt+Enter combo
	if (A_PriorKey == "Enter" || A_PriorKey == "NumpadEnter" ) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send {Alt Up}
	}

	keyPressed_RAlt = 0
	if (m_EventLog.active) {
		UpdateEventLog("RAlt Released")
	}
}


Hotkey_LCtrl() {

	global keyPressed_LCtrl
	keyPressed_LCtrl := 1

	if (m_EventLog.active) {
		UpdateEventLog("LCtrl Pressed")
	}

	KeyWait, % object_LCtrl.physicalKey

	keyPressed_LCtrl = 0
	if (m_EventLog.active) {
		UpdateEventLog("LCtrl Released")
	}
}

Hotkey_RCtrl() {

	global keyPressed_RCtrl
	keyPressed_RCtrl := 1

	if (m_EventLog.active) {
		UpdateEventLog("RCtrl Pressed")
	}

	KeyWait, % object_RCtrl.physicalKey

	keyPressed_RCtrl = 0
	if (m_EventLog.active) {
		UpdateEventLog("RCtrl Released")
	}
}



Hotkey_LShift() {

	global keyPressed_LShift
	keyPressed_LShift := 1

	if (m_EventLog.active) {
		UpdateEventLog("LShift Pressed")
	}

	KeyWait, % object_LShift.physicalKey

	keyPressed_LShift = 0
	if (m_EventLog.active) {
		UpdateEventLog("LShift Released")
	}
}

Hotkey_RShift() {

	global keyPressed_RShift
	keyPressed_RShift := 1

	if (m_EventLog.active) {
		UpdateEventLog("RShift Pressed")
	}

	KeyWait, % object_RShift.physicalKey

	keyPressed_RShift = 0
	if (m_EventLog.active) {
		UpdateEventLog("RShift Released")
	}
}


Hotkey_Tab() {

    static keyPressed_Tab := false
    global keyPressed_LAlt, keyPressed_RAlt ; ensure global scope

    if (keyPressed_Tab)
        return

    keyPressed_Tab := true

    if (m_EventLog.active) {
        UpdateEventLog("Tab Pressed")
    }

    if (keyPressed_LAlt || keyPressed_RAlt) {
        if (m_EventLog.active) {
            UpdateEventLog("ALT + TAB")
        }
        Send {Alt Down}{Tab}
        
        keyPressed_Tab := false
        return
    }

    ; Send initial Tab press immediately
    ; removed blind
    Send {Tab}

    ; this emulates alt-tabbing through the menu
    holdCounter := 0

    while (GetKeyState(object_Tab.physicalKey, "P")) {
        holdCounter++
        if (holdCounter > 4) { ; ~200ms delay before repeat starts (4 * 50ms)
            Send, {Tab}
        }
        Sleep 50
    }

    keyPressed_Tab := false

    if (m_EventLog.active) {
        UpdateEventLog("Tab Released after repeat")
    }
}


Hotkey_Menu() {

	global keyPressed_Menu
	keyPressed_Menu := 1

	if (m_EventLog.active) {
		UpdateEventLog("Menu Pressed")
	}
	
	KeyWait, % object_Menu.physicalKey

	keyPressed_Menu = 0
	if (m_EventLog.active) {
		UpdateEventLog("Menu Released")
	}
}

	


; this does nothing but allows us to flag CapsLock and log it
; I also desided to "block" the key entirely, so that Capslock has no effect while Warcraft3 is in focus
; CapsLock is "listenned to" so that we can use it as a modifier for UnifiedOrders
Hotkey_CapsLock() {

	global keyPressed_CapsLock
	keyPressed_CapsLock := 1

	if (m_EventLog.active) {
		UpdateEventLog("CapsLock Pressed")
	}

	KeyWait, % object_Capslock.physicalKey

	keyPressed_CapsLock = 0
	if (m_EventLog.active) {
		UpdateEventLog("CapsLock Released")
	}
}


Hotkey_Enter() {

	global keyPressed_Enter, keyPressed_LAlt, keyPressed_RAlt
	keyPressed_Enter := 1

	if (m_EventLog.active) {
		UpdateEventLog("Enter Pressed")
	}

	; this is needed because we intercept and block Alt.
	if (keyPressed_LAlt || keyPressed_RAlt) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send, {Alt Down}{Enter Down}
		Sleep, 10
		Send, {Enter Up}{Alt Up}
	} else {
	    ; Normal Enter key press behavior when Alt is NOT held down
	    Send, {Enter Down}
	}

	; for the release
	KeyWait, % object_Enter.physicalKey

	; only send Enter Up if it was a normal Enter press 
	; prevents hung states
	if (!keyPressed_LAlt && !keyPressed_RAlt) {
	    Send, {Enter Up}
	}

	keyPressed_Enter = 0
	if (m_EventLog.active) {
		UpdateEventLog("Enter Released")
	}
}

Hotkey_NumpadEnter() {

	global keyPressed_NumpadEnter, keyPressed_LAlt, keyPressed_RAlt
	keyPressed_NumpadEnter := 1

	if (m_EventLog.active) {
		UpdateEventLog("NumpadEnter Pressed")
	}

	; this is needed because we intercept and block Alt.
	if (keyPressed_LAlt || keyPressed_RAlt) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + NumpadEnter]")
		}
		Send, {Alt Down}{NumpadEnter Down}
		Sleep, 10
		Send, {NumpadEnter Up}{Alt Up}
	} else {
	    ; Normal Enter key press behavior when Alt is NOT held down
	    Send, {NumpadEnter Down}
	}

	; wait for the release
	KeyWait, % object_NumpadEnter.physicalKey

	; only send Enter Up if it was a normal Enter press 
	; prevents hung states
	if (!keyPressed_LAlt && !keyPressed_RAlt) {
	    Send, {NumpadEnter Up}
	}

	keyPressed_NumpadEnter = 0
	if (m_EventLog.active) {
		UpdateEventLog("NumpadEnter Released")
	}
}


; not used?
Hotkey_Up(state) {

	global keyPressed_Up

	if (state == 1) {

		keyPressed_Up = 1
		if (m_EventLog.active) {
			UpdateEventLog("Up Pressed")
		}
		
		Send {Up Down}

	} else {
		Send {Up Up}

		keyPressed_Up = 0
		if (m_EventLog.active) {
			UpdateEventLog("Up Released")
		}
	}
}

; not used?
Hotkey_Down(state) {

	global keyPressed_Down

	if (state == 1) {

		keyPressed_Down = 1
		if (m_EventLog.active) {
			UpdateEventLog("Down Pressed")
		}
		
		Send {Down Down}

	} else {

		Send {Down Up}

		keyPressed_Down = 0
		if (m_EventLog.active) {
			UpdateEventLog("Down Released")
		}
	}		
}

; not used?
Hotkey_Left(state) {

	global keyPressed_Left
	
	if (state == 1) {

		keyPressed_Left = 1
		if (m_EventLog.active) {
			UpdateEventLog("Left Pressed")
		}
		
		Send {Left Down}

	} else {

		Send {Left Up}

		keyPressed_Left = 0
		if (m_EventLog.active) {
			UpdateEventLog("Left Released")
		}
	}
}

; not used?
Hotkey_Right(state) {

	global keyPressed_Right

	if (state == 1) {

		keyPressed_Right = 1
		if (m_EventLog.active) {
			UpdateEventLog("Right Pressed")
		}
		
		Send {Right Down}

	} else {

		Send {Right Up}

		keyPressed_Right = 0
		if (m_EventLog.active) {
			UpdateEventLog("Right Released")
		}
	}
}