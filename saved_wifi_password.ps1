#This script finds the password for a defined saved wifi network

Write-Output "This will help you find the Wi-Fi password for a saved nework."

Get-WiFiProfile
Write-Output "Enter a Wi-Fi name under User Profiles from the list above"
$wifiNet=Read-Host "Wi-Fi Network SSID (Name): "
Get-WiFiProfile -ProfileName $wifiNet -ClearKey | Select-Object Password
Write-Output "See above for your Wi-Fi password"