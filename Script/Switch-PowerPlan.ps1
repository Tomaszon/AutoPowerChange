. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-ImageName.ps1)
. (Join-Path $PSScriptRoot .\Show-Toast.ps1)

function Switch-PowerPlan ($reason, $guid, $planName, $previousPlanGuid, $previousPlanName, $showToast) {
	if ($planGuid -ne $previousPlanGuid) {
		powercfg /setactive $guid

		if ($showToast) {
			$imageName = Get-ImageName $planName
			
			Show-Toast $reason $planName $imageName $previousPlanGuid $previousPlanName
		}

		Write-Host "Power plan changed to $planName"
	}

	# powercfg /setdcvalueindex SCHEME_CURRENT SUB_ENERGYSAVER ESBATTTHRESHOLD 40
	
	if ($planName -eq $priorityPowerPlan.name) {
			powercfg /setdcvalueindex SCHEME_CURRENT SUB_ENERGYSAVER ESBATTTHRESHOLD $priorityPowerPlan.batterySaverThreshold
	}
	elseif ($planName -eq $pluggedInPowerPlan.name) {
		powercfg /setdcvalueindex SCHEME_CURRENT SUB_ENERGYSAVER ESBATTTHRESHOLD $pluggedInPowerPlan.batterySaverThreshold
	}
	elseif ($planName -eq $batteryPowerPlan.name) {
		powercfg /setdcvalueindex SCHEME_CURRENT SUB_ENERGYSAVER ESBATTTHRESHOLD $batteryPowerPlan.batterySaverThreshold
	}
	powercfg /setactive SCHEME_CURRENT
}