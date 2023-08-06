$enabled = $true
$triggerDelay = 5000
$executionPolicyAfterExecution = "Restricted"
$acReasonValue = "acChange"

$displayId = "SDC416B0_0B_07E5_71^E0ABBA6C319DE3519B0BCA2F155631F8"
$priorityAppScreenResolution = [PSCustomObject]@{
	width = 1920
	height = 1200
	dpi = -1
}
$standardScreenResolution = [PSCustomObject]@{
	width = 3840
	height = 2400
	dpi = -2
}

$priorityPowerPlan = [PSCustomObject]@{
	name = "Powa"
	imageName = "high"
}
$pluggedInPowerPlan = [PSCustomObject]@{
	name = "Balanced"
	imageName = "med"
}
$batteryPowerPlan = [PSCustomObject]@{
	name = "Balanced"
	imageName = "med"
}

$toast = [PSCustomObject]@{
	header = "Power mode changing..."
	content = "Power mode changed to '{0}' :3"
}

$resourceFolder = "C:\Users\{0}\Documents\GitHub\AutoPowerChange\Resources"

$protocolHandlerCommandTemplate = "C:\Users\{0}\Documents\GitHub\AutoPowerChange\Script\execute.bat %1 %2 %3";

$screenBrightnessChangeDelay = 2000

$acTask = [PSCustomObject]@{
	name = "AutoPowerChangeAC"
	templatePath = "..\Task\PowerPlanAutoChangeACJobTemplate.xml"
}
$psTask = [PSCustomObject]@{
	name = "AutoPowerChangePS"
	templatePath = "..\Task\PowerPlanAutoChangePSJobTemplate.xml"
}

$taskWatchListPath = "..\Resources\processes.json"

$queryWrapper = "*[EventData[Data[@Name=`"NewProcessName`" or @Name=`"ProcessName`"]=`r`n          `"{0}`"]]"

$resolutionButtonTemplate = "<action activationType=`"protocol`" arguments=`"apc://{currentLocation}\Invoke-ScreenResolutionChange.ps1 {planName}`" content=`"Change to {w}x{h}`" imageUri=`"{resourceFolder}\resolution.png`"/>"