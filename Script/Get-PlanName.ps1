. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcessNames.ps1)

function Get-PlanName {
	$result = $batteryPowerPlanName
	
	if ((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").PowerOnLine) { 
		$result = $pluggedInPowerPlanName 
	}
	
	$priorityPowerPlanProcessNames = Get-PriorityPowerPlanProcessNames

	foreach ($process in Get-Process) {
		foreach ($regex in $priorityPowerPlanProcessNames) {
			if ($process.ProcessName -match $regex) {
				return $priorityPowerPlanName
			}
		}
	}

	return $result
}