Connect-VIServer -Server esxi02
Get-VMHostFirmware -VMHost esxi02 -BackupConfiguration -DestinationPath .