. (Join-Path $PSScriptRoot .\Get-HighPowerPlanProcesses.ps1)

function Get-HighPowerPlanProcessNames {
	return Get-HighPowerPlanProcesses | foreach { (Get-Item $_).BaseName }
}