# ps-scripts
This is a collection of PowerShell scripts I've written.

admin_reset_internet_connection.ps1 script resets DNS, IP lease, and Winsock.

broken_bookmarks_checker.ps1 script creates a CSV file that lists broken bookmark links from an HTML bookmarks file.
Adapted from a script found here: https://swimburger.net/blog/powershell/powershell-script-scan-documentation-for-broken-links

create_sn_alias.ps1 script updates your PowerShell profile with the alias "sn" that outputs your computer's serial number.

datetime_object.ps1 script takes a date and time string and converts it to a DateTime object.

get_usb_parent_output.ps1 script retrieves all connected USB drives' DeviceIDs and outputs them to a text file.

link_tracker_trimmer.ps1 script monitors the clipboard for URLs and removes any query parameters (source trackers) from them.
The regex lines and this script description were created with the help of AI.

ping_tracert_os_id.ps1 script is an automated WIP of this process: https://gbhackers.com/operating-systems-can-be-detected-using-ping-command/

saved_wifi_password.ps1 script helps you find the password for a saved Wi-Fi network.

temp_test_path_mkdir.ps1 script tests whether the Temp folder exists on the root C drive. If not, it creates the folder.

tracert_hops.ps1 script runs traceroute on a specified IP address and then outputs the number of hops taken.