# This PowerShell script resets DNS, IP lease and winsock.

# Clears DNS cache
Clear-DnsClientCache

# Registers DNS names
Register-DnsClient

# Releases IP Address Lease
ipconfig /release

# Renews IP Address Lease
ipconfig /renew

#Resets Winsock
netsh winsock reset

#Asks user if to reboot or not
Restart-Computer -Confirm