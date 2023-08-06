. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcesses.ps1)

function Confirm-RunningPriorityProcess {
	$regexes = (Get-PriorityPowerPlanProcesses).PSObject.Properties | foreach { $_.Name }

	foreach ($process in Get-Process) {
		foreach ($regex in $regexes) {
			if ($process.ProcessName -match $regex) {
				return $true
			}
		}
	}

	return $false
}