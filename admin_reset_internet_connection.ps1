# This PowerShell script resets DNS, IP lease, and Winsock.

# Clear DNS cache
Clear-DnsClientCache

# Register DNS names
Register-DnsClient

# Release IP address lease
ipconfig /release

# Renew IP address lease
ipconfig /renew

# Reset Winsock
netsh winsock reset

# Ask user whether to reboot
Restart-Computer -Confirm