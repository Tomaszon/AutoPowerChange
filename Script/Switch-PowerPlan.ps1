. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-ImageName.ps1)
. (Join-Path $PSScriptRoot .\Show-Toast.ps1)

function Switch-PowerPlan ($reason, $guid, $planName, $previousPlanGuid, $previousPlanName, $showToast) {
	powercfg /setactive $guid
		
	if ($showToast) {
		$imageName = Get-ImageName $planName
		
		Show-Toast $reason $planName $imageName $previousPlanGuid $previousPlanName
	}

	Write-Host "Power plan changed to $planName"
}