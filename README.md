Collection of scripts and useful tools I have created to help with a problem or just for fun.

1. check_pc_usage.ps1 outputs CPU, RAM and Disk utiliation stats for a given computer name. Make sure WSMAN is enabled on the target system (enable-psremoting)

2. enable_bitlocker.ps1 enables bitlocker, fetches the recovery key information and stores it in a location under $backup_location

3. get_logs.ps1 downloads event viewer logs either from the local system or a remote one if a paramter is given. Output is a .csv file for System logs and .csv file for Application logs, second parameter sets numbers of days

4. enable_WOL.ps1 enables Wake on Lan for Dell computers which have Dell Command | Configure installed. 

5. uptime.ps1 will show the uptime of a windows sytem, tests connection via icmp before attempting to run the check. 
   Usage: uptime.ps1 <computername>
