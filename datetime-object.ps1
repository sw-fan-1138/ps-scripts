#This script takes a date and time string and converts it to a datetime object

$datetimeString="15/05/2024, 08:03:15.635"

$dateValue,$timeValue=$datetimeString -split ","
$timeValue=$timeValue.Trim()

$dayValue,$monthValue,$yearValue=$dateValue -split "/"
$hourValue,$minuteValue,$secondsValue=$timeValue -split ":"

New-Object -TypeName datetime ($yearValue,$monthValue,$dayValue,$hourValue,$minuteValue,$secondsValue)
