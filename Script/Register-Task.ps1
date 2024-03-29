. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcesses.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)

function Register-Task ($taskName, $taskTemplatePath, $params) {
	$processes = (Get-PriorityPowerPlanProcesses).PSObject.Properties | foreach { $_.Value }

	foreach ($process in $processes) {
		$formatted = $queryWrapper.Replace("{0}", $process)
		$apps += "$formatted`r`n        or`r`n        " 
	}

	$query = $apps.TrimEnd("`r`n        or`r`n        ")

	$user = Get-LocalUser -name $userName

	$sid = $user.Sid.Value

	$template = (Get-Content $taskTemplatePath | Out-String).Replace("{0}", $query).Replace("{1}", $sid).Replace("{2}", (Get-Date -Format "yyyy-MM-ddTHH:mm:ss")).Replace("{3}", $params)

	Register-ScheduledTask -TaskName $taskName -Xml $template -Force

	Write-Host "Task registered"
}