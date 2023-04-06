. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

function Get-ScreenBrightness {
	return (Get-WmiObject -namespace root/wmi -class "WmiMonitorBrightness").CurrentBrightness
}