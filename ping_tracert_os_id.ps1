# This script will run ping and traceroute on a specified IP address, then output possible operating systems.

if (-not (Test-Path -LiteralPath "C:\Temp" -PathType Container))
{
    mkdir C:\Temp | Out-Null
}

$ipaddress = Read-Host 'What is the IP Address?'

ping -n 1 $ipaddress > C:\Temp\ping.txt

$pingstring = Select-String -Path C:\Temp\ping.txt -Pattern 'TTL'

$pingarray = $pingstring -split ("=")

[int]$ttl = $pingarray[-1]

tracert /d $ipaddress > C:\Temp\tracert.txt

$tracertstring = Select-String -Path C:\Temp\tracert.txt -Pattern 'Trace Complete' -Context 2

$tracertarray = $tracertstring -split (" ")

[int]$hops = $tracertarray[3]
$osid = $hops + $ttl


Write-Output TTL=$ttl Hops=$hops OS-ID=$osid