# This will help you find the Wi-Fi password for a saved network.

$choice = Read-Host -Prompt "Do you know the network SSID (Name)? y/n: "

$lowercaseChoice = $choice.ToLower()

if ( $lowercaseChoice -eq "n" )
{
    netsh wlan show profiles
    Write-Output "Enter a Wi-Fi name under User Profiles from the list above."
    $wifiNet = Read-Host -Prompt "Wi-Fi Network SSID (Name): "
    netsh wlan show profile $wifiNet key=clear
    Write-Output "See above for Key Content. That is your Wi-Fi password."
}

elseif ( $lowercaseChoice -eq "y" )
{
    $wifiNet = Read-Host -Prompt "Wi-Fi Network SSID (Name): "
    netsh wlan show profile $wifiNet key=clear
    Write-Output "See above for Key Content. That is your Wi-Fi password."
}

else
{
    Write-Output "Please close and rerun script and type y or n when prompted, then press Enter"
}

PAUSE