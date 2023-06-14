. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-ImageName ($planName) {
	switch ($planName) {
		$priorityPowerPlan.name { return $priorityPowerPlan.imageName }
		$pluggedInPowerPlan.name { return $pluggedInPowerPlan.imageName }
		$batteryPowerPlan.name { return $batteryPowerPlan.imageName }
	}
}