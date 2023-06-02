# Source code from https://github.com/lust4life/display-resolution
# CDS.cs modified to be compiled
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

function Set-ScreenResolution ([int] $width ,[int] $height, [CDSFlags] $flag = [CDSFlags]::Dynamically) {
	[cds.Helper]::ChangeDisplaySettings($width, $height, $flag)
}