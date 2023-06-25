. (Join-Path $PSScriptRoot .\Get-PriorityPowerPlanProcesses.ps1)

# TODO remove folder support, rework to folder / process name regex
# "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Warframe\\Tools\\Launcher.exe",
# "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Deep Rock Galactic\\FSD.exe",
# "C:\\Program Files (x86)\\Steam\\steamapps\\common\\No Man's Sky\\Binaries\\NMS.exe",
# "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Elite Dangerous\\EDLaunch.exe"

function Get-PriorityPowerPlanProcessNames {
	return Get-PriorityPowerPlanProcesses | foreach { (Get-Item $_).BaseName }
}