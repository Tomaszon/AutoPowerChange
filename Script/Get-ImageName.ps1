. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-ImageName ($planName) {
	switch ($planName) {
		$highPowerPlanName { return $highPowerPlanImageName }
		$pluggedInPowerPlanName { return $pluggedInPowerPlanImageName }
		$batteryPowerPlanName { return $batteryPowerPlanImageName }
	}
}