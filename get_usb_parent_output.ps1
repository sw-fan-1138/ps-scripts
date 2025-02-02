# This PowerShell script retrieves all connected USB drives' DeviceID and outputs them into a text file. Useful for getting a list to import into MS Defender's USB device allow list.

Get-WmiObject -Class Win32_PnPEntity | Where-Object Caption -Match "USB Mass Storage Device" | Select-Object -ExpandProperty DeviceID >> USBParents.txt