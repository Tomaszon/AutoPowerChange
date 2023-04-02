$highPowerPlanName = "Powa"
$pluggedInPowerPlanName = "Balanced"
$batteryPowerPlanName = "Balanced"

$highPowerImageName = "fast"
$balancedPowerImageName = "med"
$lowPowerImageName = "slow"

$toastHeader = "Power mode changing..."
$toastContent = "Power mode changed to '{0}' :3"

$defaultNightScreenBrightness = 10
$defaultDayScreenBrightness = 40

$daylightTime = 8, 19

$taskName = "ScriptGeneratedPowerPlanAutoChange"
$taskTemplatePath = "..\Task\PowerPlanAutoChangeJobTemplate.xml"
$taskWatchListPath = "..\Resources\processes.json"

$queryWrapper = "*[EventData[Data[@Name='NewProcessName' or @Name='ProcessName']='{0}']]"