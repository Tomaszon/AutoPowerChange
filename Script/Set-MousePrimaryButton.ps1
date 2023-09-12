. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Set-MousePrimaryButton ($planName) {
	if ($planName -eq $priorityPowerPlan.name) {
		[CMS.Helper]::SwapMouseButtons($priorityPowerPlan.leftHanded)
	}
	elseif ($planName -eq $pluggedInPowerPlan.name) {
		[CMS.Helper]::SwapMouseButtons($pluggedInPowerPlan.leftHanded)
	}
	else {
		[CMS.Helper]::SwapMouseButtons($batteryPowerPlan.leftHanded)
	}
}