. (Join-Path $PSScriptRoot .\Switch-PowerPlan.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenBrightness.ps1)
. (Join-Path $PSScriptRoot .\Get-ScreenBrightness.ps1)
. (Join-Path $PSScriptRoot .\Get-PlanName.ps1)
. (Join-Path $PSScriptRoot .\Register-Task.ps1)

if ($enabled) {
	Write-Host "Execution started"

	$planName = Get-PlanName

	$plan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "ElementName = '$planName'"

	$guid = $plan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")

	$previousPlan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "IsActive=True"

	$previousGuid = $previousPlan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")

	if ($guid -ne $previousGuid) {
		$brightness = Get-ScreenBrightness

		Switch-PowerPlan $guid $planName
		
		Start-Sleep -Milliseconds $screenBrightnessChangeDelay
		
		Set-ScreenBrightness $brightness
	}
	
	Set-ExecutionPolicy $executionPolicyAfterExecution

	Register-Task

	Write-Host "Execution completed"
}