. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcessNames.ps1)

function Get-PlanName {
	$priorityPowerPlanProcessNames = Get-PriorityPowerPlanProcessNames
	
	foreach ($process in Get-Process) {
		foreach ($regex in $priorityPowerPlanProcessNames) {
			if ($process.ProcessName -match $regex) {
				return $priorityPowerPlan.name
			}
		}
	}
	
	if ((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").PowerOnLine) { 
		return $pluggedInPowerPlan.name 		
	}

	return $batteryPowerPlan.name
}