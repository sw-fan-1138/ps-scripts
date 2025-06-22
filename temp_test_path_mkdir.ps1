# This script tests whether the Temp folder exists on the root of the C: drive. If not, it creates the folder.

if (-not (Test-Path -LiteralPath "C:\Temp" -PathType Container))
{
    mkdir C:\Temp | Out-Null
}