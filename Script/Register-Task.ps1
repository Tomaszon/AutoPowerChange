. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Register-Task {
	$hashTable = Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json -AsHashTable
	
	$apps = @()
	foreach ($key in $hashTable.Keys) {
		$apps += $queryWrapper.Replace("{0}", $hashTable[$key])
	}

	$query = Join-String -InputObject $apps -Separator " or "

	$template = (Get-Content $taskTemplatePath | Out-String).Replace("{0}", $query)

	Register-ScheduledTask -TaskName $taskName -Xml $template -Force
}
