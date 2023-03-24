. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Register-Task {
	$hashTable = Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json

	foreach ($property in $hashTable.PSObject.Properties) {
		$formatted = $queryWrapper.Replace('{0}', $property.Value)
		$apps += "$formatted or " 
	}

	$query = $apps.TrimEnd(" or ")

	$template = (Get-Content $taskTemplatePath | Out-String).Replace("{0}", $query)

	Register-ScheduledTask -TaskName $taskName -Xml $template -Force
}
