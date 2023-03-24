. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Set-ScreenBrightness {
	$time = [int](Get-Date -Format "HH")
	
	$brightness = if ($time -ge $daylightTime[0] -and $time -lt $daylightTime[1]) {
		$defaultDayScreenBrightness
	}
	else {
		$defaultNightScreenBrightness
	}

	(Get-WmiObject -namespace root/wmi -class "WmiMonitorBrightnessmethods").WmiSetBrightness(0, $brightness)
}