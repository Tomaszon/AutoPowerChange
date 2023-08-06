. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcesses.ps1)

function Get-CurrentPriorityProcessNames {
	$processNames = @()

	foreach ($process in Get-Process) {
		foreach ($regex in (Get-PriorityPowerPlanProcesses).PSObject.Properties) {
			if ($process.Description -match $regex.Name) {
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