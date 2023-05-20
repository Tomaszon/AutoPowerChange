. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcessNames.ps1)

function Get-PlanName {
	$result = $batteryPowerPlanName
	
	$priorityPowerPlanProcessNames = Get-PriorityPowerPlanProcessNames
	
	foreach ($process in Get-Process) {
		foreach ($regex in $priorityPowerPlanProcessNames) {
			if ($process.ProcessName -match $regex) {
				return $priorityPowerPlanName
			}
		}
	}
	
	if ((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").PowerOnLine) { 
		$result = $pluggedInPowerPlanName 
		
		Start-Sleep -Milliseconds $chargeRateCheckDelay

		$lowChargeRateDetected = (Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").ChargeRate -lt $lowChargeRateThreshold;

		if($usePriorityPowerPlanOnLowChargeRate -and $lowChargeRateDetected) {
			$result = $priorityPowerPlanName
		}
	}

	return $result
}