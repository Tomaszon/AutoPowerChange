param($planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenResolution.ps1)
. (Join-Path $PSScriptRoot .\Add-CDSTypeDefinition.ps1)
. (Join-Path $PSScriptRoot .\Set-MousePrimaryButton.ps1)
if ($enabled) {	
	# TODO move to a proper place
	Set-MousePrimaryButton $planName
	
	Add-CDSTypeDefinition

	if ($planName -eq $priorityPowerPlan.name) {
		Set-ScreenResolution $priorityAppScreenResolution.width $priorityAppScreenResolution.height $priorityAppScreenResolution.dpi $priorityAppScreenResolution.id $priorityAppScreenResolution.index
	}
	else {
		Set-ScreenResolution $standardScreenResolution.width $standardScreenResolution.height $standardScreenResolution.dpi $standardScreenResolution.id $standardScreenResolution.index
	}
	
	Write-Host "Screen resolution set"
}