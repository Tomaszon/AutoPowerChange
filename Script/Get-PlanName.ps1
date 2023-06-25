. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-CurrentPriorityProcessNames.ps1)

function Get-PlanName {	
	$processNames = Get-CurrentPriorityProcessNames

	if ($processNames -ne $null) {
		return $priorityPowerPlan.name
	}
	
	if ((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").PowerOnLine) { 
		return $pluggedInPowerPlan.name 		
	}

	return $batteryPowerPlan.name
}