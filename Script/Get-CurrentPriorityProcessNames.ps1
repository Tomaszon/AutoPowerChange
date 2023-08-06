. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcesses.ps1)

function Get-CurrentPriorityProcessNames {
	$processNames = @()

	$regexes = (Get-PriorityPowerPlanProcesses).PSObject.Properties | foreach { $_.Name }

	foreach ($process in Get-Process) {
		foreach ($regex in $regexes) {
			if ($process.ProcessName -match $regex) {
				$processNames = $processNames + $process.ProcessName
			}
		}
	}

	if ($processNames.Length -eq 0) {
		return $null
	}
	else {
		$processNames = $processNames | Sort-Object | Get-Unique
		
		foreach ($processName in $processNames) {
			$result += $processName + ", "
		}

		return $result.TrimEnd().TrimEnd(",")
	}
}