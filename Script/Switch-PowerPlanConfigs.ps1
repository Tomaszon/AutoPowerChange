$userName = ((Get-WMIObject -Class "Win32_ComputerSystem").UserName -Split "\\")[1]

$enabled = $true
$executionPolicyAfterExecution = "Restricted"

$highPowerPlanName = "Powa"
$pluggedInPowerPlanName = "Balanced"
$batteryPowerPlanName = "Balanced"

$highPowerPlanImageName = "high"
$pluggedInPowerPlanImageName = "med"
$batteryPowerPlanImageName = "med"

$toastHeader = "Power mode changing..."
$toastContent = "Power mode changed to '{0}' :3"
$toastIconFolder = "C:\Users\$userName\Documents\GitHub\AutoPowerChange\Resources"

$taskName = "ScriptGeneratedPowerPlanAutoChange"
$taskTemplatePath = "..\Task\PowerPlanAutoChangeJobTemplate.xml"
$taskWatchListPath = "..\Resources\processes.json"

$queryWrapper = "*[EventData[Data[@Name=`"NewProcessName`" or @Name=`"ProcessName`"]=`r`n          `"{0}`"]]"