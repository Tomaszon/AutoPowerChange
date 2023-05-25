. (Join-Path $PSScriptRoot .\Get-ScreenBrightness.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenBrightness.ps1)
. (Join-Path $PSScriptRoot .\Switch-PowerPlan.ps1)

function Switch-PowerPlanWrapper($planGuid, $previousPlan, $planName, $showToast) {
	$previousPlanName = $previousPlan.ElementName
	
	$previousPlanGuid = $previousPlan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")

	if ($planGuid -ne $previousPlanGuid) {
		$brightness = Get-ScreenBrightness

		Switch-PowerPlan $planGuid $planName $previousPlanGuid $previousPlanName $showToast

		Start-Sleep -Milliseconds $screenBrightnessChangeDelay

		Set-ScreenBrightness $brightness
	}

	Set-ExecutionPolicy $executionPolicyAfterExecution -Scope CurrentUser
}