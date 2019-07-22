#Disable Fast Boot.
#powercfg -h off
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t reg_dword /d 0 /f
#Change power settings to allow Wake on Lan magic packet to wake the NIC.
get-netadapter -name Ethernet | Enable-NetAdapterPowerManagement -WakeOnMagicPacket
#Configure bios to allow Wake on Lan for NIC (DELL)
$cctk_path = "C:\Program Files (x86)\Dell\Command Configure\X86_64\cctk.exe"
&$cctk_path --setuppwd=itdirector --valsetuppwd=itdirector
&$cctk_path --deepsleepctrl=disable --valsetuppwd=itdirector
&$cctk_path --wakeonlan=enable  --valsetuppwd=itdirector
&$cctk_path --setuppwd= --valsetuppwd=itdirector