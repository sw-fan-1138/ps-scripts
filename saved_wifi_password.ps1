# This script finds the password for a defined saved Wi-Fi network

# Lets user know what the script does
Write-Output "This will help you find the Wi-Fi password for a saved network."

# Shows Wi-Fi profiles saved to the computer
Get-WiFiProfile

# Asks user to enter Wi-Fi Profile Name
Write-Output "Enter a Wi-Fi name under User Profiles from the list above"
$wifiNet = Read-Host "Wi-Fi Network SSID (Name): "

# Shows entered Profile Name password
Get-WiFiProfile -ProfileName $wifiNet -ClearKey | Select-Object Password
Write-Output "See above for your Wi-Fi password"