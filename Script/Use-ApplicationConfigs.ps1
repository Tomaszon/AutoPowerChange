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

$priorityPowerPlanName = "Powa"
$pluggedInPowerPlanName = "Balanced"
$batteryPowerPlanName = "Balanced"

$priorityPowerPlanImageName = "high"
$pluggedInPowerPlanImageName = "med"
$batteryPowerPlanImageName = "med"

$toastHeader = "Power mode changing..."
$toastContent = "Power mode changed to '{0}' :3"
$toastIconFolder = "C:\Users\{0}\Documents\GitHub\AutoPowerChange\Resources"
$toastTemplateFolder = "C:\Users\{0}\Documents\GitHub\AutoPowerChange\Resources"

$protocolHandlerCommandTemplate = "C:\Users\{0}\Documents\GitHub\AutoPowerChange\Script\execute.bat %1 %2 %3";

$screenBrightnessChangeDelay = 2000

$acTaskName = "AutoPowerChangeAC"
$acTaskTemplatePath = "..\Task\PowerPlanAutoChangeACJobTemplate.xml"

$psTaskName = "AutoPowerChangePS"
$psTaskTemplatePath = "..\Task\PowerPlanAutoChangePSJobTemplate.xml"
$taskWatchListPath = "..\Resources\processes.json"

$queryWrapper = "*[EventData[Data[@Name=`"NewProcessName`" or @Name=`"ProcessName`"]=`r`n          `"{0}`"]]"