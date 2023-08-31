. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

function Get-ScreenResolution ($displayId, $displayIndex) {

	New-PSDrive -PSProvider Registry -Name HKLM -Root HKEY_LOCAL_MACHINE

	$width = Get-ItemPropertyValue -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Configuration\$displayId\$displayIndex" -Name "PrimSurfSize.cx"
	
	$height = Get-ItemPropertyValue -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Configuration\$displayId\$displayIndex" -Name "PrimSurfSize.cy"

	return [PSCustomObject]@{
		width = $width
		height = $height
	}
}