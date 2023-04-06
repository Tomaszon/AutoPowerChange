. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Set-ScreenBrightness ($brightness) {
	(Get-WmiObject -namespace root/wmi -class "WmiMonitorBrightnessmethods").WmiSetBrightness(0, $brightness)

	Write-Host "Screen brightness restored"
}