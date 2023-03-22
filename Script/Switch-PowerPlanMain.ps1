. (Join-Path $PSScriptRoot .\Switch-PowerPlan.ps1)
. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-TickInterval.ps1)
. (Join-Path $PSScriptRoot .\Set-ScreenBrightness.ps1)

try {
	$planName = Get-PlanName
	
	$plan = Get-CimInstance -Name root\cimv2\power -Class win32_PowerPlan -Filter "ElementName = '$planName'"
		
	$guid = $plan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")
		
	$previousPlan = Get-CimInstance -Name root\cimv2\power -Class win32_PowerPlan -Filter IsActive=True
		
	$previousGuid = $previousPlan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")
		
	if ($guid -ne $previousGuid) {
		$planName = Switch-PowerPlan $guid $planName

		Start-Sleep 2

		Set-ScreenBrightness
	}
}
catch {
	Write-Host($_)
}