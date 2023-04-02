. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-PlanName() {
	$result = $batteryPowerPlanName
	
	if ((Get-WmiObject -Class BatteryStatus -Namespace root\wmi).PowerOnLine) { 
		$result = $pluggedInPowerPlanName 
	}
	
	$jsonObject = Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json
	
	$highPowerPlanProcesses = @()
	
	foreach ($property in $jsonObject.PSObject.Properties) {
		$highPowerPlanProcesses += $property.Name
	}

	foreach ($process in Get-Process) {
		foreach ($regex in $highPowerPlanProcesses) {
			if ($process.ProcessName -match $regex) {
				return $highPowerPlanName
			}
		}
	}

	return $result
}