. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Register-Task {
	$hashTable = Get-Content $taskWatchListPath | Out-String | ConvertFrom-Json

	foreach ($property in $hashTable.PSObject.Properties) {
		$formatted = $queryWrapper.Replace('{0}', $property.Value)
		$apps += "$formatted or " 
	}

	$query = $apps.TrimEnd(" or ")

	$user = Get-LocalUser -name $userName

	$sid = $user.Sid.Value

	$template = (Get-Content $taskTemplatePath | Out-String).Replace("{0}", $query).Replace("{1}", $sid)

	Register-ScheduledTask -TaskName $taskName -Xml $template -Force
}