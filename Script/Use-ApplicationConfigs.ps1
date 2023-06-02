$enabled = $true
$triggerDelay = 5000
$executionPolicyAfterExecution = "Restricted"
$acReasonValue = "acChange"

$priorityAppScreenResolution = [PSCustomObject]@{ 
	width = 1920
	height = 1200 
}
$standardScreenResolution = [PSCustomObject]@{ 
	width = 3840
	height = 2400 
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

$protocolHandlerCommandTemplate = "C:\Users\{0}\Documents\GitHub\AutoPowerChange\Script\restore.bat %1 %2 %3";

$screenBrightnessChangeDelay = 2000

$acTaskName = "AutoPowerChangeAC"
$acTaskTemplatePath = "..\Task\PowerPlanAutoChangeACJobTemplate.xml"

$psTaskName = "AutoPowerChangePS"
$psTaskTemplatePath = "..\Task\PowerPlanAutoChangePSJobTemplate.xml"
$taskWatchListPath = "..\Resources\processes.json"

$queryWrapper = "*[EventData[Data[@Name=`"NewProcessName`" or @Name=`"ProcessName`"]=`r`n          `"{0}`"]]"