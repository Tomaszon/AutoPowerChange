. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)
. (Join-Path $PSScriptRoot .\Get-PlanName.ps1)
. (Join-Path $PSScriptRoot .\Register-Task.ps1)
. (Join-Path $PSScriptRoot .\Switch-PowerPlanWrapper.ps1)

if ($enabled) {
	Write-Host "Execution started"

	Start-Sleep -Milliseconds $triggerDelay

	$planName = Get-PlanName $true

	$plan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "ElementName = '$planName'"

	$planGuid = $plan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")

	$previousPlan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "IsActive=True"

	Switch-PowerPlanWrapper $planGuid $previousPlan $planName $true

	Register-Task

	Write-Host "Execution completed"
}