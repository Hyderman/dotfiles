#Requires AutoHotkey v2

#HotIf !Winactive("ahk_exe firefox.exe")
^h::Left
#HotIf

^j::Down
^k::Up
^l::Right

<^>!j::ù
<^>!k::ï
<^>!l::ø

<#b:: {
    if Winexist("ahk_exe firefox.exe")
        WinActivate
    else
        Run "firefox"
}

<#f:: {
    state := WinGetMinMax("A")
    if (state) == 0
        WinMaximize "A"
    else 
        WinRestore "A"
}

<#m:: {
    WinMinimize "A"
}

<#Enter:: {
    if Winexist("ahk_exe WindowsTerminal.exe")
        WinActivate
    else
        Run("wt.exe")
        WinWait("ahk_exe WindowsTerminal.exe")
        WinActivate("ahk_exe WindowsTerminal.exe")
}
