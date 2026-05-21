; Autohotkey v1 sucks immensely
; can't work with object/properties, needs weird ass syntax
; my apologies for what you are about to witness


ReadSettingsFromIni() {

    temp := 0
    global SettingsIniFile

    ; --- [General] ---
    IniRead, winName, %SettingsIniFile%, Paths, winName
    IniRead, winClass, %SettingsIniFile%, Paths, winClass
    ; MsgBox, % "winName: " winName "`nwinClass: " winClass

    IniRead, currentLayout, %SettingsIniFile%, General, currentLayout
    IniRead, ActivateHotkeysOnLaunch, %SettingsIniFile%, General, ActivateHotkeysOnLaunch
    IniRead, EnableHotkeyOverlay, %SettingsIniFile%, General, EnableHotkeyOverlay
    IniRead, Hotkey_Toggle_CurrentLayout, %SettingsIniFile%, General, Hotkey_Toggle_CurrentLayout
    IniRead, Hotkey_ScriptReload, %SettingsIniFile%, General, Hotkey_ScriptReload
    IniRead, Hotkey_OpenSettings, %SettingsIniFile%, General, Hotkey_OpenSettings
    IniRead, Hotkey_EnterAndToggleLayout, %SettingsIniFile%, General, Hotkey_EnterAndToggleLayout

    ; --- [Modules] ---
    IniRead, temp, %SettingsIniFile%, Modules, m_AbilityQuickcast.enabled
    m_AbilityQuickcast.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_HealthbarsAlwaysStay.enabled
    m_HealthbarsAlwaysStay.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_UnifiedOrders.enabled
    m_UnifiedOrders.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_CastOnYourself.enabled
    m_CastOnYourself.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_SetSkillPoint.enabled
    m_SetSkillPoint.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_RapidFire.enabled
    m_RapidFire.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_RepeatMouse.enabled
    m_RepeatMouse.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_QuickCastItems.enabled
    m_QuickCastItems.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_QuickDropItems.enabled
    m_QuickDropItems.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_InstantCamera.enabled
    m_InstantCamera.enabled := temp

    IniRead, temp, %SettingsIniFile%, Modules, m_ShiftQueueItems.enabled
    m_ShiftQueueItems.enabled := temp

    ; ------------------------------------------------------------------
    ; [UnifiedOrders]
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup1.unifiedOrders
    ControlGroup1.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup2.unifiedOrders
    ControlGroup2.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup3.unifiedOrders
    ControlGroup3.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup4.unifiedOrders
    ControlGroup4.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup5.unifiedOrders
    ControlGroup5.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup6.unifiedOrders
    ControlGroup6.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup7.unifiedOrders
    ControlGroup7.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup8.unifiedOrders
    ControlGroup8.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup9.unifiedOrders
    ControlGroup9.unifiedOrders := temp
    IniRead, temp, %SettingsIniFile%, UnifiedOrders, ControlGroup0.unifiedOrders
    ControlGroup0.unifiedOrders := temp

    ; ------------------------------------------------------------------
    ; [InstantCamera]
    IniRead, temp, %SettingsIniFile%, InstantCamera, SelectHero1.instantCamera
    SelectHero1.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, SelectHero2.instantCamera
    SelectHero2.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, SelectHero3.instantCamera
    SelectHero3.instantCamera := temp

    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup1.instantCamera
    ControlGroup1.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup2.instantCamera
    ControlGroup2.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup3.instantCamera
    ControlGroup3.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup4.instantCamera
    ControlGroup4.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup5.instantCamera
    ControlGroup5.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup6.instantCamera
    ControlGroup6.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup7.instantCamera
    ControlGroup7.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup8.instantCamera
    ControlGroup8.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup9.instantCamera
    ControlGroup9.instantCamera := temp
    IniRead, temp, %SettingsIniFile%, InstantCamera, ControlGroup0.instantCamera
    ControlGroup0.instantCamera := temp

    ; ------------------------------------------------------------------
    ; [ItemQuickcast]
    IniRead, temp, %SettingsIniFile%, ItemQuickcast, Item1.quickcast
    Item1.quickcast := temp
    IniRead, temp, %SettingsIniFile%, ItemQuickcast, Item2.quickcast
    Item2.quickcast := temp
    IniRead, temp, %SettingsIniFile%, ItemQuickcast, Item3.quickcast
    Item3.quickcast := temp
    IniRead, temp, %SettingsIniFile%, ItemQuickcast, Item4.quickcast
    Item4.quickcast := temp
    IniRead, temp, %SettingsIniFile%, ItemQuickcast, Item5.quickcast
    Item5.quickcast := temp
    IniRead, temp, %SettingsIniFile%, ItemQuickcast, Item6.quickcast
    Item6.quickcast := temp
}



SettingsGUI() {

    Gui, gui_Settings: Destroy

    ReadSettingsFromIni()

    Gui, gui_Settings: Font, s9 w300, Tahoma
    Gui, gui_Settings: Font, 282F3D
    Gui, gui_Settings: Color, F9F9FF
    Gui, gui_Settings: Add, Tab2, x0 y0 w450 h580 +hwndhTabCtrl, General|UnifiedOrders|InstantCamera|Quickcast|About|Disclamer

    ; ------------------------------------------------------------------
    ; --- Tab 1: General ---

    ; [General]
    global currentLayout
    global a_Layouts
    Global GUI_a_Layouts_list                   := Join(a_Layouts, "|")
    Global GUI_currentLayout                    := currentLayout

    Gui, gui_Settings: Tab, 1
    Gui, gui_Settings: Add, Text, x90 y80, Selected Layout:
    Gui, gui_Settings: Add, DropDownList, x235 y80 w120 vGUI_a_Layouts_list, %GUI_a_Layouts_list%
    GuiControl, gui_Settings: ChooseString, GUI_a_Layouts_list, % currentLayout

    Global GUI_ActivateHotkeysOnLaunch          := ActivateHotkeysOnLaunch
    Global GUI_EnableHotkeyOverlay              := EnableHotkeyOverlay

    Gui, gui_Settings: Add, Text, x90 y105, Activate Layout on Launch:
    Gui, gui_Settings: Add, Checkbox, x340 y105 vGUI_ActivateHotkeysOnLaunch Checked%GUI_ActivateHotkeysOnLaunch%

    Gui, gui_Settings: Add, Text, x90 y130, Enable Hotkey Overlay:
    Gui, gui_Settings: Add, Checkbox, x340 y130 vGUI_EnableHotkeyOverlay Checked%GUI_EnableHotkeyOverlay%

    ; --- Tab 1: Modules ---

    ; [Modules]
    Global GUI_m_AbilityQuickcast_enabled       := m_AbilityQuickcast.enabled
    Global GUI_m_AbilityQuickcastText           := 

    Global GUI_m_HealthbarsAlwaysStay_enabled   := m_HealthbarsAlwaysStay.enabled
    Global GUI_m_UnifiedOrders_enabled          := m_UnifiedOrders.enabled
    Global GUI_m_CastOnYourself_enabled         := m_CastOnYourself.enabled
    Global GUI_m_SetSkillPoint_enabled          := m_SetSkillPoint.enabled
    Global GUI_m_RapidFire_enabled              := m_RapidFire.enabled
    Global GUI_m_RepeatMouse_enabled            := m_RepeatMouse.enabled
    Global GUI_m_QuickCastItems_enabled         := m_QuickCastItems.enabled
    Global GUI_m_QuickDropItems_enabled         := m_QuickDropItems.enabled
    Global GUI_m_InstantCamera_enabled          := m_InstantCamera.enabled
    Global GUI_m_ShiftQueueItems_enabled        := m_ShiftQueueItems.enabled

    Gui, gui_Settings: Add, Text, x90 y180, %m_HealthbarsAlwaysStay_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y180 vGUI_m_HealthbarsAlwaysStay_enabled Checked%GUI_m_HealthbarsAlwaysStay_enabled%

    Gui, gui_Settings: Add, Text, x90 y210, %m_UnifiedOrders_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y210 vGUI_m_UnifiedOrders_enabled Checked%GUI_m_UnifiedOrders_enabled%

    Gui, gui_Settings: Add, Text, x90 y240, %m_CastOnYourself_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y240 vGUI_m_CastOnYourself_enabled Checked%GUI_m_CastOnYourself_enabled%

    Gui, gui_Settings: Add, Text, x90 y270, %m_SetSkillPoint_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y270 vGUI_m_SetSkillPoint_enabled Checked%GUI_m_SetSkillPoint_enabled%

    Gui, gui_Settings: Add, Text, x90 y300, %m_RapidFire_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y300 vGUI_m_RapidFire_enabled Checked%GUI_m_RapidFire_enabled%    

    Gui, gui_Settings: Add, Text, x90 y330, %m_RepeatMouse_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y330 vGUI_m_RepeatMouse_enabled Checked%GUI_m_RepeatMouse_enabled%

    Gui, gui_Settings: Add, Text, x90 y360, %m_InstantCamera_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y360 vGUI_m_InstantCamera_enabled Checked%GUI_m_InstantCamera_enabled%

    Gui, gui_Settings: Add, Text, x90 y390, %m_QuickCastItems_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y390 vGUI_m_QuickCastItems_enabled gOn_GUI_m_QuickcastItemsToggle Checked%GUI_m_QuickCastItems_enabled%

    Gui, gui_Settings: Add, Text, x90 y420, %m_QuickDropItems_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y420 vGUI_m_QuickDropItems_enabled Checked%GUI_m_QuickDropItems_enabled%

    Gui, gui_Settings: Add, Text, x90 y450, %m_ShiftQueueItems_menuLabel%
    Gui, gui_Settings: Add, Checkbox, x340 y450 vGUI_m_ShiftQueueItems_enabled Checked%GUI_m_ShiftQueueItems_enabled%

    ; --------------------
    ; button
    Gui, gui_Settings: Add, Button, Default x125 y500 w200 h40 gButtonSave, Save and Restart

    ; ------------------------------------------------------------------
    ; --- Tab 2 Unified Orders ---
    Gui, gui_Settings: Tab, 2
    Gui, gui_Settings: Add, Text, x90 y80, Check control groups for Unified Orders
    Gui, gui_Settings: Add, Text, x90 y110, Modifier Key: [CapsLock]

    ; [UnifiedOrders]
    Global GUI_ControlGroup1_unifiedOrders := ControlGroup1.unifiedOrders
    Global GUI_ControlGroup2_unifiedOrders := ControlGroup2.unifiedOrders
    Global GUI_ControlGroup3_unifiedOrders := ControlGroup3.unifiedOrders
    Global GUI_ControlGroup4_unifiedOrders := ControlGroup4.unifiedOrders
    Global GUI_ControlGroup5_unifiedOrders := ControlGroup5.unifiedOrders
    Global GUI_ControlGroup6_unifiedOrders := ControlGroup6.unifiedOrders
    Global GUI_ControlGroup7_unifiedOrders := ControlGroup7.unifiedOrders
    Global GUI_ControlGroup8_unifiedOrders := ControlGroup8.unifiedOrders
    Global GUI_ControlGroup9_unifiedOrders := ControlGroup9.unifiedOrders
    Global GUI_ControlGroup0_unifiedOrders := ControlGroup0.unifiedOrders

    Gui, gui_Settings: Add, Text, x90 y180, % "Control Group 1 [" ControlGroup1.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y180 vGUI_ControlGroup1_unifiedOrders Checked%GUI_ControlGroup1_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y210, % "Control Group 2 [" ControlGroup2.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y210 vGUI_ControlGroup2_unifiedOrders Checked%GUI_ControlGroup2_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y240, % "Control Group 3 [" ControlGroup3.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y240 vGUI_ControlGroup3_unifiedOrders Checked%GUI_ControlGroup3_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y270, % "Control Group 4 [" ControlGroup4.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y270 vGUI_ControlGroup4_unifiedOrders Checked%GUI_ControlGroup4_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y300, % "Control Group 5 [" ControlGroup5.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y300 vGUI_ControlGroup5_unifiedOrders Checked%GUI_ControlGroup5_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y330, % "Control Group 6 [" ControlGroup6.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y330 vGUI_ControlGroup6_unifiedOrders Checked%GUI_ControlGroup6_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y360, % "Control Group 7 [" ControlGroup7.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y360 vGUI_ControlGroup7_unifiedOrders Checked%GUI_ControlGroup7_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y390, % "Control Group 8 [" ControlGroup8.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y390 vGUI_ControlGroup8_unifiedOrders Checked%GUI_ControlGroup8_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y420, % "Control Group 9 [" ControlGroup9.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y420 vGUI_ControlGroup9_unifiedOrders Checked%GUI_ControlGroup9_unifiedOrders%

    Gui, gui_Settings: Add, Text, x90 y450, % "Control Group 0 [" ControlGroup0.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y450 vGUI_ControlGroup0_unifiedOrders Checked%GUI_ControlGroup0_unifiedOrders%

    ; --------------------
    ; button
    Gui, gui_Settings: Add, Button, Default x125 y500 w200 h40 gButtonSave, Save and Restart

    ; ------------------------------------------------------------------
    ; --- Tab 3 InstantCamera ---
    Gui, gui_Settings: Tab, 3
    Gui, gui_Settings: Add, Text, x90 y80, Check control groups for Instant Camera
    ;Gui, gui_Settings: Add, Text, x90 y110, Double-taps the control group

    ; [InstantCamera]
    Global GUI_SelectHero1_instantCamera := SelectHero1.instantCamera
    Global GUI_SelectHero2_instantCamera := SelectHero2.instantCamera
    Global GUI_SelectHero3_instantCamera := SelectHero3.instantCamera
    Global GUI_ControlGroup1_instantCamera := ControlGroup1.instantCamera
    Global GUI_ControlGroup2_instantCamera := ControlGroup2.instantCamera
    Global GUI_ControlGroup3_instantCamera := ControlGroup3.instantCamera
    Global GUI_ControlGroup4_instantCamera := ControlGroup4.instantCamera
    Global GUI_ControlGroup5_instantCamera := ControlGroup5.instantCamera
    Global GUI_ControlGroup6_instantCamera := ControlGroup6.instantCamera
    Global GUI_ControlGroup7_instantCamera := ControlGroup7.instantCamera
    Global GUI_ControlGroup8_instantCamera := ControlGroup8.instantCamera
    Global GUI_ControlGroup9_instantCamera := ControlGroup9.instantCamera
    Global GUI_ControlGroup0_instantCamera := ControlGroup0.instantCamera

    Gui, gui_Settings: Add, Text, x90 y110, % "Select Hero 1 [" SelectHero1.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y110 vGUI_SelectHero1_instantCamera Checked%GUI_SelectHero1_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y130, % "Select Hero 2 [" SelectHero2.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y130 vGUI_SelectHero2_instantCamera Checked%GUI_SelectHero2_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y150, % "Select Hero 3 [" SelectHero3.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y150 vGUI_SelectHero3_instantCamera Checked%GUI_SelectHero3_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y180, % "Control Group 1 [" ControlGroup1.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y180 vGUI_ControlGroup1_instantCamera Checked%GUI_ControlGroup1_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y210, % "Control Group 2 [" ControlGroup2.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y210 vGUI_ControlGroup2_instantCamera Checked%GUI_ControlGroup2_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y240, % "Control Group 3 [" ControlGroup3.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y240 vGUI_ControlGroup3_instantCamera Checked%GUI_ControlGroup3_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y270, % "Control Group 4 [" ControlGroup4.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y270 vGUI_ControlGroup4_instantCamera Checked%GUI_ControlGroup4_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y300, % "Control Group 5 [" ControlGroup5.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y300 vGUI_ControlGroup5_instantCamera Checked%GUI_ControlGroup5_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y330, % "Control Group 6 [" ControlGroup6.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y330 vGUI_ControlGroup6_instantCamera Checked%GUI_ControlGroup6_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y360, % "Control Group 7 [" ControlGroup7.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y360 vGUI_ControlGroup7_instantCamera Checked%GUI_ControlGroup7_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y390, % "Control Group 8 [" ControlGroup8.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y390 vGUI_ControlGroup8_instantCamera Checked%GUI_ControlGroup8_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y420, % "Control Group 9 [" ControlGroup9.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y420 vGUI_ControlGroup9_instantCamera Checked%GUI_ControlGroup9_instantCamera%

    Gui, gui_Settings: Add, Text, x90 y450, % "Control Group 0 [" ControlGroup0.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox, x340 y450 vGUI_ControlGroup0_instantCamera Checked%GUI_ControlGroup0_instantCamera%

    ; --------------------
    ; button
    Gui, gui_Settings: Add, Button, Default x125 y500 w200 h40 gButtonSave, Save and Restart

    ; ------------------------------------------------------------------
    ; --- Tab 4 ItemQuickcast ---    
    Gui, gui_Settings: Tab, 4
    Gui, gui_Settings: Add, Text,       x90     y80,    Ability Quickcast requires changes to War3Preferences.txt
    Gui, gui_Settings: Add, Button,     x90     y100    w270 h35 gButton_LocateWar3Preferences, Locate War3Preferences.txt
    Gui, gui_Settings: Add, Button,     x90     y140    w130 h35 gButton_EnableQuickcast, Write "Quickcast=1"
    Gui, gui_Settings: Add, Button,     x230    y140    w130 h35 gButton_DisableQuickcast, Write "Quickcast=0"

    m_AbilityQuickcast_text := 
    if (m_AbilityQuickcast.enabled == 0) {
        m_AbilityQuickcast_text := "Ability Quickcast is Disabled"
    } else {
        m_AbilityQuickcast_text := "Ability Quickcast is Enabled"
    }

    Gui, gui_Settings: Add, Text,       x90     y180 vGUI_m_AbilityQuickcastText +0x200, % m_AbilityQuickcast_text
    Gui, gui_Settings: Add, Checkbox,   x340    y180 vGUI_m_AbilityQuickcast_enabled Checked%GUI_m_AbilityQuickcast_enabled% Disabled


    Gui, gui_Settings: Add, Text,       x90     y230, Check Item Slots for Item Quickcast
    Gui, gui_Settings: Add, Text,       x90     y260, Experimental demo. Only supports 1920x1080 Classic.

    ; [ItemQuickcast]
    Global GUI_Item1_quickcast := Item1.quickcast
    Global GUI_Item2_quickcast := Item2.quickcast
    Global GUI_Item3_quickcast := Item3.quickcast
    Global GUI_Item4_quickcast := Item4.quickcast
    Global GUI_Item5_quickcast := Item5.quickcast
    Global GUI_Item6_quickcast := Item6.quickcast

    Gui, gui_Settings: Add, Text,       x90     y300, % "Item 1 [" Item1.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox,   x340    y300 vGUI_Item1_quickcast Checked%GUI_Item1_quickcast%

    Gui, gui_Settings: Add, Text,       x90     y330, % "Item 2 [" Item2.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox,   x340    y330 vGUI_Item2_quickcast Checked%GUI_Item2_quickcast%

    Gui, gui_Settings: Add, Text,       x90     y360, % "Item 3 [" Item3.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox,   x340    y360 vGUI_Item3_quickcast Checked%GUI_Item3_quickcast%

    Gui, gui_Settings: Add, Text,       x90     y390, % "Item 4 [" Item4.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox,   x340    y390 vGUI_Item4_quickcast Checked%GUI_Item4_quickcast%

    Gui, gui_Settings: Add, Text,       x90     y420, % "Item 5 [" Item5.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox,   x340    y420 vGUI_Item5_quickcast Checked%GUI_Item5_quickcast%

    Gui, gui_Settings: Add, Text,       x90     y450, % "Item 6 [" Item6.physicalKey "]"
    Gui, gui_Settings: Add, Checkbox,   x340    y450 vGUI_Item6_quickcast Checked%GUI_Item6_quickcast%

    ; crutch. don't cares
    if (GUI_m_QuickCastItems_enabled == 0) {
        GuiControl, gui_Settings: +Disabled, GUI_Item1_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item2_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item3_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item4_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item5_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item6_quickcast
    }

    if (GUI_m_QuickCastItems_enabled == 1) {
        GuiControl, gui_Settings: -Disabled, GUI_Item1_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item2_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item3_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item4_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item5_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item6_quickcast
    }

    ; --------------------
    ; button
    Gui, gui_Settings: Add, Button, Default x125 y500 w200 h40 gButtonSave, Save and Restart



    ; ------------------------------------------------------------------
    ; --- Tab 5 About ---
    Gui, gui_Settings: Tab, 5
    Gui, gui_Settings: Add, Text, x90 y80, 

    Global GUI_Hotkey_Toggle_CurrentLayout      := Hotkey_Toggle_CurrentLayout
    Global GUI_Hotkey_ScriptReload              := Hotkey_ScriptReload
    Global GUI_Hotkey_OpenSettings              := Hotkey_OpenSettings
    Global GUI_Hotkey_EnterAndToggleLayout      := Hotkey_EnterAndToggleLayout

    label_GUI_Hotkey_Toggle_CurrentLayout := ReplaceModifiers(GUI_Hotkey_Toggle_CurrentLayout)
    Gui, gui_Settings: Add, Text, x90 y80, Toggle Layout:
    Gui, gui_Settings: Add, Button, x235 y80 w120 h25 vGUI_Hotkey_Toggle_CurrentLayout gDynamicHotkey_Prompt_ToggleLayout, %label_GUI_Hotkey_Toggle_CurrentLayout%

    label_GUI_Hotkey_EnterAndToggleLayout := ReplaceModifiers(GUI_Hotkey_EnterAndToggleLayout)
    Gui, gui_Settings: Add, Text, x90 y110, Toggle && Enter:
    Gui, gui_Settings: Add, Button, x235 y110 w120 h25 vGUI_Hotkey_EnterAndToggleLayout gDynamicHotkey_Prompt_EnterAndToggleLayout, %label_GUI_Hotkey_EnterAndToggleLayout%

    label_GUI_Hotkey_ScriptReload := ReplaceModifiers(GUI_Hotkey_ScriptReload)
    Gui, gui_Settings: Add, Text, x90 y140, App Reload:
    Gui, gui_Settings: Add, Button, x235 y140 w120 h25 vGUI_Hotkey_ScriptReload gDynamicHotkey_Prompt_ScriptReload, %label_GUI_Hotkey_ScriptReload%

    label_GUI_Hotkey_OpenSettings := ReplaceModifiers(GUI_Hotkey_OpenSettings)
    Gui, gui_Settings: Add, Text, x90 y170, Open Settings:
    Gui, gui_Settings: Add, Button, x235 y170 w120 h25 vGUI_Hotkey_OpenSettings gDynamicHotkey_Prompt_OpenSettings, %label_GUI_Hotkey_OpenSettings%

    Gui, gui_Settings: Add, Button, x90 y230 w270 h40 gButton_Donate, Donate
    Gui, gui_Settings: Add, Button, x90 y280 w270 h40 gButton_Discord, Discord


    ; --------------------
    ; button
    Gui, gui_Settings: Add, Button, Default x125 y500 w200 h40 gButtonSave, Save and Restart


    ; --- Tab 6 About ---
    Gui, gui_Settings: Tab, 6
    Gui, gui_Settings: Add, Text, x40 y80, Disclamer

    Gui, gui_Settings: Add, Text, x40 y130 w370 Wrap, Disclaimer: Displaced Grid is a free, open-source application created for entertainment purposes. Displaced Grid is a collection of proof-of-concept prototypes and tech-demos aimed to showcase potentially improved user experience (UX). Displaced Grid is not affiliated with, endorsed by, or sponsored by any company or brand. All relevant trademarks belong to their respective owners. This application is provided strictly "as is", without any warranties, express or implied. We make no guarantees regarding its performance, compatibility, or freedom from bugs. By using Displaced Grid, you acknowledge and agree that the developer shall not be held liable for any direct, indirect, incidental, special, or consequential damages arising from its use or inability to use the application.

    ; --------------------
    ; button
    Gui, gui_Settings: Add, Button, Default x125 y500 w200 h40 gButtonSave, Save and Restart

    ; ------------------------------------------------------------------
    Gui, gui_Settings: Show, w450 h580, Displaced Grid %DisplacedGridVersion% by etofok
}

ButtonSave() {

    Gui, gui_Settings: Submit, NoHide

    global SettingsIniFile
       
    ; ---
    global currentLayout, ActivateHotkeysOnLaunch, EnableHotkeyOverlay, Hotkey_Toggle_CurrentLayout, Hotkey_ScriptReload, Hotkey_OpenSettings, Hotkey_EnterAndToggleLayout
    global GUI_currentLayout, GUI_a_Layouts_list, GUI_ActivateHotkeysOnLaunch, GUI_EnableHotkeyOverlay, GUI_Hotkey_Toggle_CurrentLayout, GUI_Hotkey_ScriptReload, GUI_Hotkey_OpenSettings, GUI_Hotkey_EnterAndToggleLayout

    ; -------------------------------------    
    currentLayout                                           := GUI_a_Layouts_list
    IniWrite, %currentLayout%,                              %SettingsIniFile%, General, currentLayout

    ; -------------------------------------    
    ActivateHotkeysOnLaunch                                 := GUI_ActivateHotkeysOnLaunch
    IniWrite, %ActivateHotkeysOnLaunch%,                    %SettingsIniFile%, General, ActivateHotkeysOnLaunch
    
    EnableHotkeyOverlay                                     := GUI_EnableHotkeyOverlay
    IniWrite, %EnableHotkeyOverlay%,                        %SettingsIniFile%, General, EnableHotkeyOverlay
    
    ; -------------------------------------
    Hotkey_Toggle_CurrentLayout                             := GUI_Hotkey_Toggle_CurrentLayout
    IniWrite, %GUI_Hotkey_Toggle_CurrentLayout%,            %SettingsIniFile%, General, Hotkey_Toggle_CurrentLayout
    Hotkey, %Hotkey_Toggle_CurrentLayout%,                  Toggle_CurrentLayout,       UseErrorLevel
    
    ; -------------------------------------
    Hotkey_EnterAndToggleLayout                                      := GUI_Hotkey_EnterAndToggleLayout
    IniWrite, %GUI_Hotkey_EnterAndToggleLayout%,                     %SettingsIniFile%, General, Hotkey_EnterAndToggleLayout
    Hotkey, %Hotkey_EnterAndToggleLayout%,                           EnterAndToggleLayout,               UseErrorLevel
    
    ; -------------------------------------
    Hotkey_ScriptReload                                     := GUI_Hotkey_ScriptReload
    IniWrite, %GUI_Hotkey_ScriptReload%,                    %SettingsIniFile%, General, Hotkey_ScriptReload
    Hotkey, %Hotkey_ScriptReload%,                          ScriptReload,               On

    ; -------------------------------------
    Hotkey_OpenSettings                                     := GUI_Hotkey_OpenSettings
    IniWrite, %GUI_Hotkey_OpenSettings%,                    %SettingsIniFile%, General, Hotkey_OpenSettings
    Hotkey, %Hotkey_OpenSettings%,                          OpenSettings,               UseErrorLevel

   ; -------------------------------------
  
    Global GUI_m_AbilityQuickcast_enabled
    Global GUI_m_HealthbarsAlwaysStay_enabled
    Global GUI_m_UnifiedOrders_enabled
    Global GUI_m_CastOnYourself_enabled
    Global GUI_m_SetSkillPoint_enabled
    Global GUI_m_RapidFire_enabled
    Global GUI_m_RepeatMouse_enabled
    Global GUI_m_QuickCastItems_enabled
    Global GUI_m_QuickDropItems_enabled
    Global GUI_m_InstantCamera_enabled
    Global GUI_m_ShiftQueueItems_enabled

    Global m_AbilityQuickcast_enabled
    Global m_HealthbarsAlwaysStay_enabled
    Global m_UnifiedOrders_enabled
    Global m_CastOnYourself_enabled
    Global m_SetSkillPoint_enabled
    Global m_RapidFire_enabled
    Global m_RepeatMouse_enabled
    Global m_QuickCastItems_enabled
    Global m_QuickDropItems_enabled
    Global m_InstantCamera_enabled
    Global m_ShiftQueueItems_enabled

    m_AbilityQuickcast_enabled                          := GUI_m_AbilityQuickcast_enabled
    m_HealthbarsAlwaysStay_enabled                      := GUI_m_HealthbarsAlwaysStay_enabled
    m_UnifiedOrders_enabled                             := GUI_m_UnifiedOrders_enabled
    m_CastOnYourself_enabled                            := GUI_m_CastOnYourself_enabled
    m_SetSkillPoint_enabled                             := GUI_m_SetSkillPoint_enabled
    m_RapidFire_enabled                                 := GUI_m_RapidFire_enabled
    m_RepeatMouse_enabled                               := GUI_m_RepeatMouse_enabled
    m_QuickCastItems_enabled                            := GUI_m_QuickCastItems_enabled
    m_QuickDropItems_enabled                            := GUI_m_QuickDropItems_enabled
    m_InstantCamera_enabled                             := GUI_m_InstantCamera_enabled
    m_ShiftQueueItems_enabled                           := GUI_m_ShiftQueueItems_enabled

    ; write to Settings.ini
    IniWrite, %GUI_m_AbilityQuickcast_enabled%,         %SettingsIniFile%, Modules, m_AbilityQuickcast.enabled
    IniWrite, %GUI_m_HealthbarsAlwaysStay_enabled%,     %SettingsIniFile%, Modules, m_HealthbarsAlwaysStay.enabled
    IniWrite, %GUI_m_UnifiedOrders_enabled%,            %SettingsIniFile%, Modules, m_UnifiedOrders.enabled
    IniWrite, %GUI_m_CastOnYourself_enabled%,           %SettingsIniFile%, Modules, m_CastOnYourself.enabled
    IniWrite, %GUI_m_SetSkillPoint_enabled%,            %SettingsIniFile%, Modules, m_SetSkillPoint.enabled
    IniWrite, %GUI_m_RapidFire_enabled%,                %SettingsIniFile%, Modules, m_RapidFire.enabled
    IniWrite, %GUI_m_RepeatMouse_enabled%,              %SettingsIniFile%, Modules, m_RepeatMouse.enabled
    IniWrite, %GUI_m_QuickCastItems_enabled%,           %SettingsIniFile%, Modules, m_QuickCastItems.enabled
    IniWrite, %GUI_m_QuickDropItems_enabled%,           %SettingsIniFile%, Modules, m_QuickDropItems.enabled
    IniWrite, %GUI_m_InstantCamera_enabled%,            %SettingsIniFile%, Modules, m_InstantCamera.enabled
    IniWrite, %GUI_m_ShiftQueueItems_enabled%,          %SettingsIniFile%, Modules, m_ShiftQueueItems.enabled

    ; assign the actual value
    m_AbilityQuickcast.enabled          := m_AbilityQuickcast_enabled
    m_HealthbarsAlwaysStay.enabled      := m_HealthbarsAlwaysStay_enabled
    m_UnifiedOrders.enabled             := m_UnifiedOrders_enabled
    m_CastOnYourself.enabled            := m_CastOnYourself_enabled
    m_SetSkillPoint.enabled             := m_SetSkillPoint_enabled
    m_RapidFire.enabled                 := m_RapidFire_enabled
    m_RepeatMouse.enabled               := m_RepeatMouse_enabled
    m_QuickCastItems.enabled            := m_QuickCastItems_enabled
    m_QuickDropItems.enabled            := m_QuickDropItems_enabled
    m_InstantCamera.enabled             := m_InstantCamera_enabled
    m_ShiftQueueItems.enabled           := m_ShiftQueueItems_enabled

    ; ----------------------------------
    ; - tab 2 - unifiedOrders

    Global GUI_ControlGroup1_unifiedOrders        
    Global GUI_ControlGroup2_unifiedOrders      
    Global GUI_ControlGroup3_unifiedOrders      
    Global GUI_ControlGroup4_unifiedOrders      
    Global GUI_ControlGroup5_unifiedOrders     
    Global GUI_ControlGroup6_unifiedOrders     
    Global GUI_ControlGroup7_unifiedOrders
    Global GUI_ControlGroup8_unifiedOrders    
    Global GUI_ControlGroup9_unifiedOrders 
    Global GUI_ControlGroup0_unifiedOrders    

    Global ControlGroup1_unifiedOrders                      := GUI_ControlGroup1_unifiedOrders
    Global ControlGroup2_unifiedOrders                      := GUI_ControlGroup2_unifiedOrders
    Global ControlGroup3_unifiedOrders                      := GUI_ControlGroup3_unifiedOrders
    Global ControlGroup4_unifiedOrders                      := GUI_ControlGroup4_unifiedOrders
    Global ControlGroup5_unifiedOrders                      := GUI_ControlGroup5_unifiedOrders
    Global ControlGroup6_unifiedOrders                      := GUI_ControlGroup6_unifiedOrders
    Global ControlGroup7_unifiedOrders                      := GUI_ControlGroup7_unifiedOrders
    Global ControlGroup8_unifiedOrders                      := GUI_ControlGroup8_unifiedOrders
    Global ControlGroup9_unifiedOrders                      := GUI_ControlGroup9_unifiedOrders
    Global ControlGroup0_unifiedOrders                      := GUI_ControlGroup0_unifiedOrders   

    ; write to Settings.ini
    IniWrite, %GUI_ControlGroup1_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup1.unifiedOrders
    IniWrite, %GUI_ControlGroup2_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup2.unifiedOrders
    IniWrite, %GUI_ControlGroup3_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup3.unifiedOrders
    IniWrite, %GUI_ControlGroup4_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup4.unifiedOrders
    IniWrite, %GUI_ControlGroup5_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup5.unifiedOrders
    IniWrite, %GUI_ControlGroup6_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup6.unifiedOrders
    IniWrite, %GUI_ControlGroup7_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup7.unifiedOrders
    IniWrite, %GUI_ControlGroup8_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup8.unifiedOrders
    IniWrite, %GUI_ControlGroup9_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup9.unifiedOrders
    IniWrite, %GUI_ControlGroup0_unifiedOrders%,            %SettingsIniFile%, UnifiedOrders, ControlGroup0.unifiedOrders

    ; assign the actual value
    ControlGroup1.unifiedOrders := ControlGroup1_unifiedOrders
    ControlGroup2.unifiedOrders := ControlGroup2_unifiedOrders
    ControlGroup3.unifiedOrders := ControlGroup3_unifiedOrders
    ControlGroup4.unifiedOrders := ControlGroup4_unifiedOrders
    ControlGroup5.unifiedOrders := ControlGroup5_unifiedOrders
    ControlGroup6.unifiedOrders := ControlGroup6_unifiedOrders
    ControlGroup7.unifiedOrders := ControlGroup7_unifiedOrders
    ControlGroup8.unifiedOrders := ControlGroup8_unifiedOrders
    ControlGroup9.unifiedOrders := ControlGroup9_unifiedOrders
    ControlGroup0.unifiedOrders := ControlGroup0_unifiedOrders

    ; ----------------------------------
    ; - tab 3 instantCamera

    Global GUI_SelectHero1_instantCamera
    Global GUI_SelectHero2_instantCamera
    Global GUI_SelectHero3_instantCamera
    Global GUI_ControlGroup1_instantCamera
    Global GUI_ControlGroup2_instantCamera
    Global GUI_ControlGroup3_instantCamera
    Global GUI_ControlGroup4_instantCamera
    Global GUI_ControlGroup5_instantCamera
    Global GUI_ControlGroup6_instantCamera
    Global GUI_ControlGroup7_instantCamera
    Global GUI_ControlGroup8_instantCamera
    Global GUI_ControlGroup9_instantCamera
    Global GUI_ControlGroup0_instantCamera

    Global SelectHero1_instantCamera                      := GUI_SelectHero1_instantCamera
    Global SelectHero2_instantCamera                      := GUI_SelectHero2_instantCamera
    Global SelectHero3_instantCamera                      := GUI_SelectHero3_instantCamera
    Global ControlGroup1_instantCamera                      := GUI_ControlGroup1_instantCamera
    Global ControlGroup2_instantCamera                      := GUI_ControlGroup2_instantCamera
    Global ControlGroup3_instantCamera                      := GUI_ControlGroup3_instantCamera
    Global ControlGroup4_instantCamera                      := GUI_ControlGroup4_instantCamera
    Global ControlGroup5_instantCamera                      := GUI_ControlGroup5_instantCamera
    Global ControlGroup6_instantCamera                      := GUI_ControlGroup6_instantCamera
    Global ControlGroup7_instantCamera                      := GUI_ControlGroup7_instantCamera
    Global ControlGroup8_instantCamera                      := GUI_ControlGroup8_instantCamera
    Global ControlGroup9_instantCamera                      := GUI_ControlGroup9_instantCamera
    Global ControlGroup0_instantCamera                      := GUI_ControlGroup0_instantCamera 

    ; write to Settings.ini
    IniWrite, %GUI_SelectHero1_instantCamera%,            %SettingsIniFile%, InstantCamera, SelectHero1.instantCamera
    IniWrite, %GUI_SelectHero2_instantCamera%,            %SettingsIniFile%, InstantCamera, SelectHero2.instantCamera
    IniWrite, %GUI_SelectHero3_instantCamera%,            %SettingsIniFile%, InstantCamera, SelectHero3.instantCamera
    IniWrite, %GUI_ControlGroup1_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup1.instantCamera
    IniWrite, %GUI_ControlGroup2_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup2.instantCamera
    IniWrite, %GUI_ControlGroup3_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup3.instantCamera
    IniWrite, %GUI_ControlGroup4_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup4.instantCamera
    IniWrite, %GUI_ControlGroup5_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup5.instantCamera
    IniWrite, %GUI_ControlGroup6_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup6.instantCamera
    IniWrite, %GUI_ControlGroup7_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup7.instantCamera
    IniWrite, %GUI_ControlGroup8_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup8.instantCamera
    IniWrite, %GUI_ControlGroup9_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup9.instantCamera
    IniWrite, %GUI_ControlGroup0_instantCamera%,            %SettingsIniFile%, InstantCamera, ControlGroup0.instantCamera

    ; assign the actual value
    SelectHero1.instantCamera := SelectHero1_instantCamera
    SelectHero2.instantCamera := SelectHero2_instantCamera
    SelectHero3.instantCamera := SelectHero3_instantCamera
    ControlGroup1.instantCamera := ControlGroup1_instantCamera
    ControlGroup2.instantCamera := ControlGroup2_instantCamera
    ControlGroup3.instantCamera := ControlGroup3_instantCamera
    ControlGroup4.instantCamera := ControlGroup4_instantCamera
    ControlGroup5.instantCamera := ControlGroup5_instantCamera
    ControlGroup6.instantCamera := ControlGroup6_instantCamera
    ControlGroup7.instantCamera := ControlGroup7_instantCamera
    ControlGroup8.instantCamera := ControlGroup8_instantCamera
    ControlGroup9.instantCamera := ControlGroup9_instantCamera
    ControlGroup0.instantCamera := ControlGroup0_instantCamera


    ; ----------------------------------
    ; - tab 4 itemQuickcast

    Global GUI_Item1_quickcast
    Global GUI_Item2_quickcast
    Global GUI_Item3_quickcast
    Global GUI_Item4_quickcast
    Global GUI_Item5_quickcast
    Global GUI_Item6_quickcast

    Global Item1_quickcast                      := GUI_Item1_quickcast
    Global Item2_quickcast                      := GUI_Item2_quickcast
    Global Item3_quickcast                      := GUI_Item3_quickcast
    Global Item4_quickcast                      := GUI_Item4_quickcast
    Global Item5_quickcast                      := GUI_Item5_quickcast
    Global Item6_quickcast                      := GUI_Item6_quickcast

    ; write to Settings.ini
    IniWrite, %GUI_Item1_quickcast%,            %SettingsIniFile%, ItemQuickcast, Item1.quickcast
    IniWrite, %GUI_Item2_quickcast%,            %SettingsIniFile%, ItemQuickcast, Item2.quickcast
    IniWrite, %GUI_Item3_quickcast%,            %SettingsIniFile%, ItemQuickcast, Item3.quickcast
    IniWrite, %GUI_Item4_quickcast%,            %SettingsIniFile%, ItemQuickcast, Item4.quickcast
    IniWrite, %GUI_Item5_quickcast%,            %SettingsIniFile%, ItemQuickcast, Item5.quickcast
    IniWrite, %GUI_Item6_quickcast%,            %SettingsIniFile%, ItemQuickcast, Item6.quickcast

    ; assign the actual value
    Item1.quickcast := Item1_quickcast
    Item2.quickcast := Item2_quickcast
    Item3.quickcast := Item3_quickcast
    Item4.quickcast := Item4_quickcast
    Item5.quickcast := Item5_quickcast
    Item6.quickcast := Item6_quickcast

    GuiControlGet, Hotkey_Toggle_CurrentLayout, gui_Settings:, GUI_Hotkey_Toggle_CurrentLayout
    GuiControlGet, Hotkey_ScriptReload, gui_Settings:, GUI_Hotkey_ScriptReload
    GuiControlGet, Hotkey_OpenSettings, gui_Settings:, GUI_Hotkey_OpenSettings
    GuiControlGet, Hotkey_EnterAndToggleLayout, gui_Settings:, GUI_Hotkey_EnterAndToggleLayout

    ; ----------------------------------
    Gui, gui_Settings: Destroy

    ; reload to update everything otherwise it's such a headache
    RestartApp()
}




;-------------------------------------------
; support functions
Join(pArray, pDelimiter) {
    local joinedString := ""
    local firstElement := true

    For index, element in pArray {
        ; Ensure each element is trimmed of whitespace before joining
        StringTrimLeft, element, element, 0
        StringTrimRight, element, element, 0

        if (!firstElement) {
            joinedString .= pDelimiter
        }
        joinedString .= element
        firstElement := false
    }
    return joinedString
}


;--------------------------------
Button_Donate_DonationAlerts() {
    Run, https://www.donationalerts.com/r/etofok
}

Button_Donate() {

    Gui, gui_Donate:Destroy
    Gui, gui_Donate:New
    Gui, gui_Donate: Font, s10 w300, Tahoma
    Gui, gui_Donate: Font, 282F3D
    Gui, gui_Donate: Color, F9F9FF
    Gui, gui_Donate: +AlwaysOnTop +ToolWindow
    Gui, gui_Donate: Margin, 40, 40

    Gui, gui_Donate: Add, Button, x90 y130 w270 h40 gButton_Donate_DonationAlerts, DonationAlerts
    Gui, gui_Donate: Add, Picture, x125 y170 w200 h200, %A_ScriptDir%\modules\icons\QR-DonationAlerts-etofok.png

    Gui, gui_Donate: Add, Text, x30 y380, You will be redirected to https://www.donationalerts.com/r/etofok

    Gui, gui_Donate: Show, w450 h580, Displaced Grid %DisplacedGridVersion% by etofok
}

Button_Donate_Destroy() {
    Gui, gui_Donate:Destroy
}

Button_Discord() {
    Run, https://discord.gg/grmNuB5cWc
}

Button_Website() {
    Run, https://etofok.github.io/displaced-grid
}

Button_EnableQuickcast() {
    Button_SetQuickcast(1)
}

Button_DisableQuickcast() {
    Button_SetQuickcast(0)
}


Button_SetQuickcast(var) {
    global locate_War3Preferences, m_AbilityQuickcast_enabled, m_AbilityQuickcast, GUI_m_AbilityQuickcast_enabled, GUI_m_AbilityQuickcastText

    if FileExist(locate_War3Preferences) {
        FileRead, fileContent, %locate_War3Preferences%

        if ErrorLevel {
            MsgBox, 48, Error, % "Failed to read War3Preferences.txt `n`n1. Try to run this app as Administrator`n2. Remove the Read-Only flag from War3Preferences. `n3. Open manually and changes by hand."
            return
        }

        newContent := ""

        if (var == 1) {
            newContent := StrReplace(fileContent, "Quickcast=0", "Quickcast=1")
        } else {
            newContent := StrReplace(fileContent, "Quickcast=1", "Quickcast=0")
        }

        if (newContent == fileContent) {
            MsgBox, 64, Success, % "All good. `nNo changes made. `n`nQuickcast=" m_AbilityQuickcast.enabled
            return
        }

        FileDelete, %locate_War3Preferences%
        FileAppend, %newContent%, %locate_War3Preferences%

        if ErrorLevel {
            MsgBox, 48, Error, % "Failed to write changes to file: " locate_War3Preferences
        } else {
                if (var == 1) {
                    MsgBox, 64, Success, % "Replaced all Quickcast=0 -> Quickcast=1 in:`n" locate_War3Preferences "`n`n(Restart Warcraft III to take effect)"
                    m_AbilityQuickcast.enabled := 1
                    m_AbilityQuickcast_enabled := 1 ; I'm completely lost at this point
                    m_AbilityQuickcastText := "Ability Quickcast is Enabled, please restart the game"
                    GuiControl, gui_Settings:, GUI_m_AbilityQuickcastText, % m_AbilityQuickcastText
                    GuiControl, gui_Settings:, GUI_m_AbilityQuickcast_enabled, 1
                } else {
                    MsgBox, 64, Success, % "Replaced all Quickcast=1 -> Quickcast=0 in:`n" locate_War3Preferences "`n`n(Restart Warcraft III to take effect)"
                    m_AbilityQuickcast.enabled := 0
                    m_AbilityQuickcast_enabled := 0
                    m_AbilityQuickcastText := "Ability Quickcast is Disabled, please restart the game"
                    GuiControl, gui_Settings:, GUI_m_AbilityQuickcastText, % m_AbilityQuickcastText
                    GuiControl, gui_Settings:, GUI_m_AbilityQuickcast_enabled, 0
                }

            GuiControl, gui_Settings: +Disabled, GUI_m_AbilityQuickcast_enabled
            IniWrite, %m_AbilityQuickcast_enabled%,     %SettingsIniFile%, Modules, m_AbilityQuickcast.enabled
        }

    } else {
        MsgBox, 48, Error, % "War3Preferences.txt was not found:`n`n " locate_War3Preferences
        Button_LocateWar3Preferences()
    }

}

Button_LocateWar3Preferences() {
    global SettingsIniFile
    global locate_War3Preferences

    FileSelectFile, selectedFilePath, 1, %A_MyDocuments%\Warcraft III, Locate War3Preferences.txt, Text Files (*.txt)

    if (selectedFilePath != "") {
        MsgBox, 64, File Selected, % "File selected: `n`n" selectedFilePath
        locate_War3Preferences := selectedFilePath
        IniWrite, %locate_War3Preferences%, %SettingsIniFile%, Paths, path_War3Preferences
        MsgBox, 64, Path Saved, % "Successfully saved path to War3Preferences.txt"
    } else {
        MsgBox, 48, Abort, Failed to locate War3Preferences.txt!
    }
}