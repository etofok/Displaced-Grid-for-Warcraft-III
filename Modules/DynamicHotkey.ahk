Global DynamicHotkey_TargetGuiVar := "" ; store GUI control

DynamicHotkey_Prompt(gLabel) {
    global DynamicHotkey_TargetGuiVar
    DynamicHotkey_TargetGuiVar := gLabel

    Suspend, On
    Gui, HotkeyPrompt:New, +ToolWindow -Caption +AlwaysOnTop
    Gui, HotkeyPrompt:Font, S14 Bold, Arial
    Gui, HotkeyPrompt:Add, Text,, Press key to set Hotkey...
    Gui, HotkeyPrompt:Show, Center AutoSize

    SetTimer, _WatchForKeyPress, 10
}

DynamicHotkey_Capture(capturedKey) {
    global DynamicHotkey_TargetGuiVar
    global SettingsIniFile
       
    ; ---
    global Hotkey_Toggle_CurrentLayout, Hotkey_ScriptReload, Hotkey_OpenSettings, Hotkey_EnterAndToggleLayout
    global GUI_Hotkey_Toggle_CurrentLayout, GUI_Hotkey_ScriptReload, GUI_Hotkey_OpenSettings, GUI_Hotkey_EnterAndToggleLayout

    FinalHotkey := ""

    ; delay to avoid race condition with key state capture
    Sleep, 100

    ; get modifier state AFTER key press
    if GetKeyState("Ctrl", "P")  ; Only if physically held
        FinalHotkey .= "^"
    if GetKeyState("Alt", "P")
        FinalHotkey .= "!"
    if GetKeyState("Shift", "P")
        FinalHotkey .= "+"
    if GetKeyState("LWin", "P") || GetKeyState("RWin", "P")
        FinalHotkey .= "#"

    if (capturedKey = "LControl" || capturedKey = "RControl")
        FinalHotkey := "^"
    else if (capturedKey = "LAlt" || capturedKey = "RAlt")
        FinalHotkey := "!"
    else if (capturedKey = "LShift" || capturedKey = "RShift")
        FinalHotkey := "+"
    else if (capturedKey = "LWin" || capturedKey = "RWin")
        FinalHotkey := "#"
    else
        FinalHotkey .= capturedKey


    Switch DynamicHotkey_TargetGuiVar {
        Case "GUI_Hotkey_Toggle_CurrentLayout":
            GUI_Hotkey_Toggle_CurrentLayout := FinalHotkey
        Case "GUI_Hotkey_ScriptReload":
            GUI_Hotkey_ScriptReload := FinalHotkey
        Case "GUI_Hotkey_OpenSettings":
            GUI_Hotkey_OpenSettings := FinalHotkey        
        Case "GUI_Hotkey_EnterAndToggleLayout":
            GUI_Hotkey_EnterAndToggleLayout := FinalHotkey
    }




    ; save immediately on change

    ; -------------------------------------    
    IniWrite, %GUI_Hotkey_Toggle_CurrentLayout%,            %SettingsIniFile%, General, Hotkey_Toggle_CurrentLayout
    Hotkey, %Hotkey_Toggle_CurrentLayout%,                  Toggle_CurrentLayout,       UseErrorLevel
    ; -------------------------------------    
    Hotkey_ScriptReload                                     := GUI_Hotkey_ScriptReload
    IniWrite, %GUI_Hotkey_ScriptReload%,                    %SettingsIniFile%, General, Hotkey_ScriptReload
    Hotkey, %Hotkey_ScriptReload%,                          ScriptReload,               On
    ; -------------------------------------
    Hotkey_OpenSettings                                     := GUI_Hotkey_OpenSettings
    IniWrite, %GUI_Hotkey_OpenSettings%,                    %SettingsIniFile%, General, Hotkey_OpenSettings
    Hotkey, %Hotkey_OpenSettings%,                          OpenSettings,               UseErrorLevel
    ; -------------------------------------
    Hotkey_EnterAndToggleLayout                                      := GUI_Hotkey_EnterAndToggleLayout
    IniWrite, %GUI_Hotkey_EnterAndToggleLayout%,                     %SettingsIniFile%, General, Hotkey_EnterAndToggleLayout
    Hotkey, %Hotkey_EnterAndToggleLayout%,                           EnterAndToggleLayout,               UseErrorLevel
    ; -------------------------------------


    ; Update GUI
    FinalHotkey := ReplaceModifiers(FinalHotkey) ; this affects only the label
    GuiControl, gui_Settings:, %DynamicHotkey_TargetGuiVar%, %FinalHotkey%
    Gui, HotkeyPrompt:Destroy


    Suspend, Off
    Gui, gui_Settings: Show, w450 h570, Displaced Grid %DisplacedGridVersion% by etofok

    DynamicHotkey_TargetGuiVar := ""
}


DynamicHotkey_Cancel() {
    global DynamicHotkey_GUI_ID
    Gui, HotkeyPrompt:Destroy
    Suspend, Off
    DynamicHotkey_TargetGuiVar := ""
    DynamicHotkey_GUI_ID := ""
}


DynamicHotkey_Prompt_ToggleLayout() {
    DynamicHotkey_Prompt("GUI_Hotkey_Toggle_CurrentLayout")
}

DynamicHotkey_Prompt_ScriptReload() {
    DynamicHotkey_Prompt("GUI_Hotkey_ScriptReload")
}

DynamicHotkey_Prompt_OpenSettings() {
    DynamicHotkey_Prompt("GUI_Hotkey_OpenSettings")
}

DynamicHotkey_Prompt_EnterAndToggleLayout() {
    DynamicHotkey_Prompt("GUI_Hotkey_EnterAndToggleLayout")
}
