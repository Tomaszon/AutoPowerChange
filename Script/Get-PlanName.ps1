. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcessNames.ps1)

function Get-PlanName ($recurse, $reason) {
	$result = $batteryPowerPlanName
	
	$priorityPowerPlanProcessNames = Get-PriorityPowerPlanProcessNames
	
	foreach ($process in Get-Process) {
		foreach ($regex in $priorityPowerPlanProcessNames) {
			if ($process.ProcessName -match $regex) {
				return $priorityPowerPlanName
			}
		}
	}
	
	$batteryStatus = Get-WmiObject -Class "BatteryStatus" -Namespace "root\wmi"

	if ($batteryStatus.PowerOnLine) { 
		$result = $pluggedInPowerPlanName 
		
		if ($reason -eq $acReasonValue -and $usePriorityPowerPlanOnLowChargeRate) {
			if ($recurse) {
				Start-Sleep -Milliseconds $chargeRateCheckDelay
				
				$result = Get-PlanName $false $reason
			}
			else {
				if($batteryStatus.ChargeRate -gt 0 -and $batteryStatus.ChargeRate -lt $lowChargeRateThreshold) {
					$result = $priorityPowerPlanName
				}
			}
		}
	}

	return $result
}