. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcesses.ps1)

function Get-PriorityPowerPlanProcessNames {
	return Get-PriorityPowerPlanProcesses | foreach { (Get-Item $_).BaseName }
}