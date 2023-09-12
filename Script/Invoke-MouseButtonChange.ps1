param($planName)

. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Add-CMSTypeDefinition.ps1)
. (Join-Path $PSScriptRoot .\Set-MousePrimaryButton.ps1)

if ($enabled) {		
	Add-CMSTypeDefinition
	
	Set-MousePrimaryButton $planName
	
	Write-Host "Primary mouse button set"
}