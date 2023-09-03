function Set-ScreenResolution ([int] $width, [int] $height, [int] $dpi, [string] $id, [string] $index) {
	[CDS.Helper]::ChangeDisplaySettings($width, $height, $dpi, $id, $index)

	Start-Sleep -Milliseconds $screenResolutionChangeDelay
}