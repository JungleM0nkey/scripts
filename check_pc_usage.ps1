Param([string]$computerName)
#Usage: .\check_pc_usage.ps1 computername
function check_resources{

if (Test-Connection $computerName -Count 1 -Quiet){

invoke-command $computerName {
$computer = $env:computername
$system = Get-WmiObject win32_OperatingSystem
$totalPhysicalMem = $system.TotalVisibleMemorySize
$freePhysicalMem = $system.FreePhysicalMemory
$usedPhysicalMem = $totalPhysicalMem - $freePhysicalMem
$RAM = [math]::Round(($usedPhysicalMem / $totalPhysicalMem) * 100,1)
#$RAM = [int](Get-Counter '\Memory\Available Bytes').countersamples.cookedvalue


$CPU = [int](Get-Counter '\Processor(_Total)\% Processor Time').countersamples.cookedvalue
#$DISK = [int](get-counter "\physicaldisk(_total)\% disk time").countersamples.cookedvalue
$DISK = ((Get-Counter "\\$Computer\PhysicalDisk(*)\% Disk Time"     ).Countersamples | ? {$_.InstanceName -eq "0 c:"}).cookedvalue

write-host @"

===============================================
==== Resources Usage Statistics for for $computername ======
===============================================
CPU : $CPU % Used
RAM : $RAM % Used
DISK : $DISK % Currently Utilised
===============================================

"@
}
}else{

write-host "Unable to establish a connection to: $computername" -ForegroundColor Red

}


}

check_resources