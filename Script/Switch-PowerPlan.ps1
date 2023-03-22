. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PlanName.ps1)
. (Join-Path $PSScriptRoot .\Get-ImageName.ps1)
. (Join-Path $PSScriptRoot .\Show-Toast.ps1)

# for app start/terminate trigger switches local security policy -> Local Policies.Audit Policy.Audit process tracking.Success must be set

function Switch-PowerPlan($guid, $planName) {
	powercfg /setactive $guid
		
	$imageName = Get-ImageName $planName
		
	Show-Toast $planName $imageName

	return $planName
}