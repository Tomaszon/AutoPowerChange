. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcessNames.ps1)

function Get-PlanName($recurse) {
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
		
		if($usePriorityPowerPlanOnLowChargeRate) {
			if($recurse) {
				Start-Sleep -Milliseconds $chargeRateCheckDelay
				
				$result = Get-PlanName $false
			}
			else {
				if((Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi").ChargeRate -lt $lowChargeRateThreshold) {
					$result = $priorityPowerPlanName
				}
			}
		}
	}

	return $result
}