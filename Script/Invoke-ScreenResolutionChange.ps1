param($planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenResolution.ps1)
. (Join-Path $PSScriptRoot .\Add-CDSTypeDefinition.ps1)
. (Join-Path $PSScriptRoot .\Get-PlanName.ps1)

if ($enabled) {	
	Write-Host "Change started"

	Add-CDSTypeDefinition

	if ($planName -eq $priorityPowerPlanName) {
		Set-ScreenResolution $priorityAppScreenResolution.width $priorityAppScreenResolution.height $priorityAppScreenResolution.dpi
	}
	else {
		Set-ScreenResolution $standardScreenResolution.width $standardScreenResolution.height $standardScreenResolution.dpi
	}
	
	Write-Host "Change ended"
}