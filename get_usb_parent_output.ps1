# This PowerShell script retrieves the DeviceID of all connected USB drives and outputs them to a text file. Useful for creating a list to import into Microsoft Defender's USB device allow list.

Get-WmiObject -Class Win32_PnPEntity | Where-Object Caption -Match "USB Mass Storage Device" | Select-Object -ExpandProperty DeviceID >> USBParents.txt