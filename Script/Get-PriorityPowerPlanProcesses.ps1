. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-PriorityPowerPlanProcesses {
	return Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json
}