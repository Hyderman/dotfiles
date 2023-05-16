Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "%USERPROFILE%/dotfiles/komorebi/startup.bat" & Chr(34), 0
Set WshShell = Nothing
