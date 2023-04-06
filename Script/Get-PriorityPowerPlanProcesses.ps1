. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-PriorityPowerPlanProcesses {
	$jsonContent =  Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json
	
	return $jsonContent | foreach { if ($_ -match "\\\*$") { Get-ChildItem -Path $_ -Include "*.exe" -Recurse } else { $_ } }
}