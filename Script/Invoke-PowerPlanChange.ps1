. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)
. (Join-Path $PSScriptRoot .\Get-PlanName.ps1)
. (Join-Path $PSScriptRoot .\Register-Task.ps1)
. (Join-Path $PSScriptRoot .\Complete-PowerPlanChange.ps1)

if ($enabled) {
	Write-Host "Execution started"

	$planName = Get-PlanName

	$plan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "ElementName = '$planName'"

	$guid = $plan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")

	# if ($guid -ne $previousPlanGuid) {
		Complete-PowerPlanChange $guid $planName $true
	# }
	
	# Set-ExecutionPolicy $executionPolicyAfterExecution

	Register-Task

	Write-Host "Execution completed"
}