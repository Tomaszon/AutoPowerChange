$userName = ((Get-WMIObject -Class "Win32_ComputerSystem").UserName -Split "\\")[1]

$enabled = $true

$highPowerPlanName = "Powa"
$pluggedInPowerPlanName = "Balanced"
$batteryPowerPlanName = "Balanced"

$highPowerPlanImageName = "high"
$pluggedInPowerPlanImageName = "med"
$batteryPowerPlanImageName = "med"

$toastHeader = "Power mode changing..."
$toastContent = "Power mode changed to '{0}' :3"
$toastIconFolder = "C:\Users\$userName\Documents\GitHub\AutoPowerChange\Resources"

$defaultNightScreenBrightness = 10
$defaultDayScreenBrightness = 40

$daylightTime = 8, 18

$taskName = "ScriptGeneratedPowerPlanAutoChange"
$taskTemplatePath = "..\Task\PowerPlanAutoChangeJobTemplate.xml"
$taskWatchListPath = "..\Resources\processes.json"

$queryWrapper = "*[EventData[Data[@Name='NewProcessName' or @Name='ProcessName']='{0}']]"