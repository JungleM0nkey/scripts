Enable-Bitlocker -MountPoint c: -SkipHardwareTest -RecoveryPasswordProtector -UsedSpaceOnly
$id = (Get-BitLockerVolume -MountPoint C).KeyProtector.keyprotectorid[1].trim('{','}')
$recovery_key = (Get-BitLockerVolume -MountPoint C).KeyProtector.recoverypassword
#insert backup location for the recovery key
$backup_location = ""
$text = @"
BitLocker Drive Encryption recovery key 

To verify that this is the correct recovery key, compare the start of the following identifier with the identifier value displayed on your PC.

Identifier:

	$id

If the above identifier matches the one displayed by your PC, then use the following key to unlock your drive.

Recovery Key:

	$recovery_key

If the above identifier doesn't match the one displayed by your PC, then this isn't the right key to unlock your drive.
Try another recovery key, or refer to https://go.microsoft.com/fwlink/?LinkID=260589 for additional assistance.

"@
write-output $text > "$backup_location\$env:computername - Bitlocker Recovery Key $id.TXT"