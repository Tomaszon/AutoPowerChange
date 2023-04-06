. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-HighPowerPlanProcesses {
	return Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json
}