. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcessNames.ps1)

function Get-CurrentPriorityProcessNames {
	$priorityPowerPlanProcessNames = Get-PriorityPowerPlanProcessNames

	$processNames = @()

	foreach ($process in Get-Process) {
		foreach ($regex in $priorityPowerPlanProcessNames) {
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