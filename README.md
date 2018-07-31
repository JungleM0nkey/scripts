Collection of scripts and useful tools I have created to help with a problem or just for fun.

1. check_pc_usage.ps1 outputs CPU, RAM and Disk utiliation stats for a given computer name. Make sure WSMAN is enabled on the target system (enable-psremoting)

2. enable_bitlocker.ps1 enables bitlocker, fetches the recovery key information and stores it in a location under $backup_location