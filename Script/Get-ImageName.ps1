. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-ImageName($planName) {
	$result = switch ($planName) {
		$highPowerPlanName { $highPowerImageName }
		$balancedPowerPlanName { $balancedPowerImageName }
		$lowPowerPlanName { $lowPowerImageName }
	}

	return $result
}