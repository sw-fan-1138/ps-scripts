#This script test whether the Temp folder exists on root C drive. If False, creates the folder

if (-not (Test-Path -LiteralPath "C:\Temp" -PathType Container))
{
    mkdir C:\Temp | Out-Null
}