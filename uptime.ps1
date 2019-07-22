Param([string]$computerName)


$connection = test-connection -count 1 $computername -ErrorAction SilentlyContinue
if ($connection){
$lastboot = (Get-CimInstance -ClassName win32_operatingsystem -ComputerName $computerName -ErrorAction SilentlyContinue | select lastbootuptime).lastbootuptime 
$currentdate = get-date
$difference = new-timespan -start $lastboot -end $currentdate -ErrorAction SilentlyContinue
write-host $computername.ToUpper() "uptime:" $difference.Days "Days" $difference.Hours "Hours" $difference.Minutes "Minutes" -ForegroundColor Yellow
}else{
write-host "Unable to establish connection with" $computername.ToUpper() -ForegroundColor Red
}