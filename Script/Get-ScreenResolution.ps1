. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-ScreenResolution {
	$width = ((Get-WmiObject -Class Win32_VideoController).VideoModeDescription  -split "x")[1].Trim()
	$height = ((Get-WmiObject -Class Win32_VideoController).VideoModeDescription  -split "x")[2].Trim()

	return [PSCustomObject]@{
		width = $width
		height = $height
	}
}