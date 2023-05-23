. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-ImageName.ps1)
. (Join-Path $PSScriptRoot .\Show-Toast.ps1)

function Switch-PowerPlan ($guid, $planName, $showToast) {
	powercfg /setactive $guid
		
	$imageName = Get-ImageName $planName
		
	if($showToast) {
		Show-Toast $planName $imageName 
	}

	Write-Host "Power plan changed to $planName"
}