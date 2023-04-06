. (Join-Path $PSScriptRoot .\Get-HighPowerPlanProcesses.ps1)

function Get-HighPowerPlanProcessNames {
	return Get-HighPowerPlanProcesses | ForEach { (Get-Item $_).BaseName }
}