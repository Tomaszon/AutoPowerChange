. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Set-ScreenBrightness ($brightness) {
	(Get-WmiObject -namespace root/wmi -class "WmiMonitorBrightnessmethods").WmiSetBrightness(0, $brightness)
}