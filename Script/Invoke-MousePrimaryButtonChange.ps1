param($planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Set-MousePrimaryButton.ps1)
. (Join-Path $PSScriptRoot .\Add-CMSTypeDefinition.ps1)

if ($enabled) {	
	Write-Host "Change started"

	Add-CMSTypeDefinition

	if ($planName -eq $priorityPowerPlan.name) {
		Set-MousePrimaryButton $priorityPowerPlan.leftHanded
	}
	elseif ($planName -eq $pluggedInPowerPlan.name) {
		Set-MousePrimaryButton $pluggedInPowerPlan.leftHanded
	}
	else {
		Set-MousePrimaryButton $batteryPowerPlan.leftHanded
	}
	
	Write-Host "Change ended"
}