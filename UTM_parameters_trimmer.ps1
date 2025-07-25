# This PowerShell script monitors the clipboard for URLs and removes any UTM parameters from them.

while ($true) {

    $ClipBoardIn = Get-Clipboard

    $linkPattern = '(https?:\/\/[^\s/$.?#].[^\s]*)'

    if ($ClipBoardIn -match $linkPattern) {
    $ClipBoardOut = $ClipBoardIn -replace '\?.*$', ''
        Set-Clipboard -Value $ClipBoardOut
    } else {
        return
    }
            Start-Sleep -Milliseconds 500
}