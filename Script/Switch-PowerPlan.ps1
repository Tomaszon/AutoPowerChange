. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-ImageName.ps1)
. (Join-Path $PSScriptRoot .\Show-Toast.ps1)

function Switch-PowerPlan ($guid, $planName) {
	powercfg /setactive $guid
		
	$imageName = Get-ImageName $planName
		
	Show-Toast $planName $imageName
}