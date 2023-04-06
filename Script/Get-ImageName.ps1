. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-ImageName ($planName) {
	switch ($planName) {
		$priorityPowerPlanName { return $priorityPowerPlanImageName }
		$pluggedInPowerPlanName { return $pluggedInPowerPlanImageName }
		$batteryPowerPlanName { return $batteryPowerPlanImageName }
	}
}