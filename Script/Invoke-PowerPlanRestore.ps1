param($guid, $planName)

. (Join-Path $PSScriptRoot .\Complete-PowerPlanChange.ps1)

Complete-PowerPlanChange $guid $planName $false