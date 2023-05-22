. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenBrightness.ps1)
. (Join-Path $PSScriptRoot .\Get-ScreenBrightness.ps1)
. (Join-Path $PSScriptRoot .\Switch-PowerPlan.ps1)

function Complete-PowerPlanChange($guid, $planName, $showToast) {
	$brightness = Get-ScreenBrightness

	Switch-PowerPlan $guid $planName $showToast

	Start-Sleep -Milliseconds $screenBrightnessChangeDelay

	Set-ScreenBrightness $brightness
}