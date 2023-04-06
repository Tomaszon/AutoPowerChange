. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-HighPowerPlanProcessNames.ps1)

function Get-PlanName {
	$result = $batteryPowerPlanName
	
	if ((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").PowerOnLine) { 
		$result = $pluggedInPowerPlanName 
	}
	
	$highPowerPlanProcessNames = Get-HighPowerPlanProcessNames

	foreach ($process in Get-Process) {
		foreach ($regex in $highPowerPlanProcessNames) {
			if ($process.ProcessName -match $regex) {
				return $highPowerPlanName
			}
		}
	}

	return $result
}