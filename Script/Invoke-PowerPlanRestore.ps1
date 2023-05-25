param($guid, $planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Switch-PowerPlan.ps1)

if ($enabled) {	
	Write-Host "Restore started"

	Switch-PowerPlan $guid $planName $false
	
	Set-ExecutionPolicy $executionPolicyAfterExecution -Scope CurrentUser

	Write-Host "Restore ended"
}