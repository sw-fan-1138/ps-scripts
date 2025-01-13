#This script finds the password for a defined saved wifi network

#Lets user know what hte script does
Write-Output "This will help you find the Wi-Fi password for a saved nework."

#Shows wifi profiles saved to the computer
Get-WiFiProfile

#Asks user to enter wifi ProfileName
Write-Output "Enter a Wi-Fi name under User Profiles from the list above"
$wifiNet=Read-Host "Wi-Fi Network SSID (Name): "

#Shows entered ProfileName password
Get-WiFiProfile -ProfileName $wifiNet -ClearKey | Select-Object Password
Write-Output "See above for your Wi-Fi password"