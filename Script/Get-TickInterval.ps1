. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-TickInterval($planName) {
	$result = switch ($planName) {
		$highPowerPlanName { $highPowerTickInterval }
		$balancedPowerPlanName { $balancedPowerTickInterval }
		$lowPowerPlanName { $lowPowerTickInterval }
	}

	return $result
}