#This script creates a csv file listing broken bookmark links from Firefox bookmarks

# Url Regex specifically for HTML keeping []() [][] into account
$FilePath = $env:APPDATA+"\Mozilla\Firefox\Profiles"
$UrlRegex = '((?:https?):\/\/[a-z0-9\.:].*?(?=[\s\]\[\)]))|((?:https?):\/\/[a-z0-9\.:].*?(?=[\s\]\[\)]))';
Get-ChildItem -LiteralPath $FilePath -Recurse -File "bookmarks.html" `
    | Select-String -Pattern $UrlRegex -AllMatches `
    | ForEach-Object { 
    [Microsoft.PowerShell.Commands.MatchInfo]$MatchInfo = $PSItem; 
    $MatchInfo.Matches `
        | Where-Object { $_.Value.StartsWith('http://') -or $_.Value.StartsWith('https://') } `
        | ForEach-Object {
            $Value = $PSItem.Value;
            $Value = $Value.Trim('"').Trim("'");

            try {
                $Response =  Invoke-WebRequest `
                    -Uri $Value `
                    -UseBasicParsing `
                    -ErrorAction SilentlyContinue;
            }
            catch {
                $Response = $PSItem.Exception.Response;
                "$([int]$Response.StatusCode), $Value" >> .\broken_bookmarks.csv;
            }
        };
};