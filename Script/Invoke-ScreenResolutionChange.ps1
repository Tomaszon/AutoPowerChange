param($planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenResolution.ps1)
. (Join-Path $PSScriptRoot .\Add-CDSTypeDefinition.ps1)

if ($enabled) {	
	Write-Host "Change started"

	Add-CDSTypeDefinition

	if ($planName -eq $priorityPowerPlan.name) {
		Set-ScreenResolution $priorityAppScreenResolution.width $priorityAppScreenResolution.height $priorityAppScreenResolution.dpi $priorityAppScreenResolution.id $priorityAppScreenResolution.index
	}
	else {
		Set-ScreenResolution $standardScreenResolution.width $standardScreenResolution.height $standardScreenResolution.dpi $standardScreenResolution.id $standardScreenResolution.index
	}
	
	Write-Host "Change ended"
}