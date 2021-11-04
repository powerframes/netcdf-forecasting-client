$currentPath = Get-Location
$scriptPath = Join-Path $currentPath "DownloadNetcdf.ps1"
$scriptCmd = ($scriptPath + ' (Get-Date -Format "yyyy-MM-dd") ' + '"' + $currentPath + '"')
$action = New-ScheduledTaskAction -Execute 'PowerShell' -Argument "-NonInteractive -NoLogo -NoProfile -File $scriptCmd"
$trigger = New-ScheduledTaskTrigger -Daily -At 5pm
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings
Register-ScheduledTask -TaskName 'Descarga Pronósticos Power Frames' -InputObject $task