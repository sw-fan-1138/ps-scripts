#This script runs traceroute on a specfied IP address, then outputs the number of hops taken

if (-not (Test-Path -LiteralPath "C:\Temp" -PathType Container))
{
    mkdir C:\Temp | Out-Null
}

$ipaddress = Read-Host 'What is the IP Address?'

tracert /d $ipaddress > C:\Temp\tracert.txt

$tracertstring = Select-String -Path C:\Temp\tracert.txt -Pattern 'Trace Complete' -Context 2

$tracertarray = $tracertstring -split (" ")

$hops = $tracertarray[3]

Write-Output $hops