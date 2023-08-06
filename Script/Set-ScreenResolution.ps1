# Source code from https://github.com/lust4life/display-resolution
# CDS.cs modified to be compiled
# TODO make dpi and reschange work together on the same display
[Flags()] enum CDSFlags {
	Dynamically = 0
	UpdateRegistry = 0x01
	Test = 0x02
	FullScreen = 0x04
	Global = 0x08
	SetPrimary = 0x10
	Reset = 0x40000000
	NoReset = 0x10000000
}

function Set-ScreenResolution ([int] $width ,[int] $height, [int] $dpi) {
	# [cds.Helper]::ChangeDisplaySettings($width, $height, $dpi, $displayId)
	setresolution set -w $width -h $height -noprompt

	start-sleep 5

	setresolution set -w $width -h $height -noprompt
}