. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-HighPowerPlanProcesses {
	$jsonContent =  Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json
	
	return $jsonContent | foreach { if ($_ -match "\\\*$") { Get-ChildItem -Path $_ -Include "*.exe" -Recurse } else { $_ } }
}