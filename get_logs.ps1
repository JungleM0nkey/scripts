#Make sure the firewall has the correct inbound rules to allow the log requests.
#Parameter 1: computer name, default current computer
#Parameter 2: how many days to get the logs for from today, default 7
#Makes a directory called logs under your user directory containing folders with the workstation names and the log .csv files
param([string]$computername,[int]$days)
write-host $computername
if (-not $computername){
$computername = $env:computername 
}else{
$computername = "$computername"
}
if (-not $days){
$days = 7
}
write-host "Fetching Logs for: $computername"
write-host "Number of days: $days days"
$now=get-date
$startdate=$now.adddays(-$days)
$system = get-eventlog -ComputerName $computername -log System -After $startdate -EntryType Error, Warning
$application = get-eventlog -ComputerName $computername -log Application -After $startdate -EntryType Error, Warning 
mkdir "C:\Users\$env:USERNAME\logs\$computername\" -ErrorAction SilentlyContinue | out-null
#Export .csv files
$system | export-csv "C:\Users\$env:USERNAME\logs\$computername\system_eventlog.csv" 
$application | export-csv "C:\Users\$env:USERNAME\logs\$computername\application_eventlog.csv"
write-host "Done. Files located under C:\Users\$env:USERNAME\logs\$computername" -ForegroundColor yellow
