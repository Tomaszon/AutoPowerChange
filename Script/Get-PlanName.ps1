. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Confirm-RunningPriorityProcess.ps1)

function Get-PlanName {	
	$processNames = Confirm-RunningPriorityProcess

	if ($processNames -eq $true) {
		return $priorityPowerPlan.name
	}
	
	if ((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").PowerOnLine) {
		return $pluggedInPowerPlan.name
	}

	return $batteryPowerPlan.name
}