# This script edits your PowerShell profile to create a function that outputs your computer's serial number, 
# then assigns the alias 'sn' to the function.

'Function global:Serial-Number {Get-WmiObject -Class Win32_BIOS | Select-Object -Property SerialNumber}' >> $PROFILE
'Set-Alias -Name sn -Value Serial-Number' >> $PROFILE