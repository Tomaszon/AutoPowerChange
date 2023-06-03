. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-ScreenResolution {
	[cds.Helper]::GetDisplaySettings($displayId)
}