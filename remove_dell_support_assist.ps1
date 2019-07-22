$support_assist = Get-CimInstance -Classname Win32_Product | Where-Object Name -Match ‘Dell SupportAssist’
if ($support_assist){
Get-CimInstance -Classname Win32_Product | Where-Object Name -Match ‘Dell SupportAssist’ | Invoke-CimMethod -MethodName UnInstall
}