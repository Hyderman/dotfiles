$PSStyle.FileInfo.Directory = $PSStyle.Foreground.FromRgb(0xfab387) + $PSStyle.Bold
$PSStyle.Formatting.TableHeader = $PSStyle.Foreground.FromRgb(0xf9e2af) + $PSStyle.Bold
Invoke-Expression (&starship init powershell)
Invoke-Expression (&sfsu hook)
Set-PSReadLineOption -AddToHistoryHandler {
    param([string]$line)
    return $line.Length -gt 3 -and $line[0] -ne ' ' -and $line[0] -ne ';'
}
(Get-PSReadLineOption).HistoryNoDuplicates = $False
# Import-Module -Name Terminal-Icons
Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -Editmode Vi
Set-alias -Name "nvimrc" -Value "C:\Users\logan\AppData\Local\nvim\init.lua"
Set-alias -Name "tree" -Value "Show-Tree"
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    }
    else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Write-Host -NoNewLine "`e[5 q"
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
Set-PSReadLineKeyHandler -Chord "Ctrl+Oem4" -Vimode Insert -Function ViCommandMode
Set-PSReadLineKeyHandler -Chord "f2" -Function SwitchPredictionView
Set-PSReadLineKeyHandler -Chord "alt+4" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "alt+l" -Function AcceptNextSuggestionWord
Set-PSReadLineKeyHandler -Chord "alt+h" -Function BackwardDeleteWord
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineKeyHandler -Chord '"', "'" `
    -BriefDescription SmartInsertQuote `
    -LongDescription "Insert paired quotes if not already on a quote" `
    -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}
