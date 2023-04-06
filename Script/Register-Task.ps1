. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-HighPowerPlanProcesses.ps1)

function Register-Task {
	foreach ($process in Get-HighPowerPlanProcesses) {
		$formatted = $queryWrapper.Replace("{0}", $process)
		$apps += "$formatted`r`n        or`r`n        " 
	}

	$query = $apps.TrimEnd("`r`n        or`r`n        ")

	$user = Get-LocalUser -name $userName

	$sid = $user.Sid.Value

	$template = (Get-Content $taskTemplatePath | Out-String).Replace("{0}", $query).Replace("{1}", $sid)

	Register-ScheduledTask -TaskName $taskName -Xml $template -Force
}