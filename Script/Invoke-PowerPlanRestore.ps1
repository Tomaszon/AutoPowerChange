param($guid, $planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Switch-PowerPlanWrapper.ps1)

if ($enabled) {	
	Write-Host "Restore started"

	$previousPlan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "IsActive=True"

	Switch-PowerPlanWrapper $guid $previousPlan $planName

	Write-Host "Restore ended"
}