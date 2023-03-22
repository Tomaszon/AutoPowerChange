. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-PlanName() {
	$result = $lowPowerPlanName
	
	if ((Get-WmiObject -Class BatteryStatus -Namespace root\wmi).PowerOnLine) { 
		$result = $balancedPowerPlanName 
	}
	
	foreach ($process in Get-Process) {
		foreach ($regex in $highPowerPlanProcessRegexes) {
			if ($process.ProcessName -match $regex) {
				return $highPowerPlanName
			}
		}
	}

	return $result
}