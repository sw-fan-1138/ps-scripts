# ps-scripts
A collection of PowerShell scripts I've written

admin_reset_internet_connection.ps1 script resets DNS, IP lease, and Winsock.

create_sn_alias.ps1 script updates your PowerShell profile with the alias "sn" that outputs your computer's serial number.

datetime_object.ps1 script takes a date and time string and converts it to a datetime object

get_usb_parent_output.ps1 script retrieves all connected USB drives' DeviceID and outputs them into a text file.
Useful for getting a list to import into MS Defender's USB device allow list.

ping_tracert_os_id.ps1 script is an automated WIP of this process: https://gbhackers.com/operating-systems-can-be-detected-using-ping-command/

saved_wifi_password.ps1 script helps you find the password for a saved wifi network.

temp_test_path_mkdir.ps1 script tests whether the Temp folder exists on the root C drive. If False, it creates the folder.

tracert_hops.ps1 script runs traceroute on a specified IP address, then outputs the number of hops taken.
