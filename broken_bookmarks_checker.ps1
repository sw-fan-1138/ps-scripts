# This script creates a CSV file listing broken bookmark links from Firefox bookmarks.
# Adapted from a script found here: https://swimburger.net/blog/powershell/powershell-script-scan-documentation-for-broken-links.

# Checks if OneDrive is installed or not, and chooses the correct output path.
if (Test-Path -Path $Env:OneDrive)
{
    # Folder exists
    $csvpath = $Env:OneDrive
}
else
{
    # Folder doesn't exist
    $csvpath = $Env:USERPROFILE
}

# Opens a file picker dialog box to select your bookmarks file.
Function Get-FileName($initialDirectory)
{  
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.InitialDirectory = "C:\\"
    $OpenFileDialog.Filter = "HTML files (*.html)|*.html|All files (*.*)|*.*"
    $OpenFileDialog.FilterIndex = 1
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.FileName
}
# End function Get-FileName

# *** Entry Point to Script ***

$BookmarkFile = Get-FileName -initialDirectory "C:\fso"

# URL Regex specifically for HTML, keeping []() [][] into account
$FilePath = $BookmarkFile
$UrlRegex = '((?:https?):\/\/[a-z0-9\.:].*?(?=[\s\]\[\)]))|((?:https?):\/\/[a-z0-9\.:].*?(?=[\s\]\[\)]))'
Get-ChildItem -LiteralPath $FilePath -Recurse -File "bookmarks.html" `
    | Select-String -Pattern $UrlRegex -AllMatches `
    | ForEach-Object { 
        [Microsoft.PowerShell.Commands.MatchInfo]$MatchInfo = $PSItem
        $MatchInfo.Matches `
            | Where-Object { $_.Value.StartsWith('http://') -or $_.Value.StartsWith('https://') } `
            | ForEach-Object {
                $Value = $PSItem.Value
                $Value = $Value.Trim('"').Trim("'")

                try {
                    $Response = Invoke-WebRequest `
                        -Uri $Value `
                        -UseBasicParsing `
                        -ErrorAction SilentlyContinue
                }
                catch {
                    $Response = $PSItem.Exception.Response
                    "$([int]$Response.StatusCode), $Value" >> $csvpath\Desktop\broken_bookmarks.csv
                }
            }
    }