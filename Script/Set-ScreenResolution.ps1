function Set-ScreenResolution ([int] $width ,[int] $height, [int] $dpi, [string] $id, [string] $index) {
	[cds.Helper]::ChangeDisplaySettings($width, $height, $dpi, $id, $index)

	start-sleep 5
}