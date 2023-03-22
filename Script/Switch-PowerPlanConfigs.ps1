$highPowerPlanName = "Powa"
$balancedPowerPlanName = "Balanced"
$lowPowerPlanName = "Saver"

$highPowerImageName = "fast"
$balancedPowerImageName = "med"
$lowPowerImageName = "slow"

$toastHeader = "AC/DC change detected"
$toastContent = "Power mode changed to '{0}' :3"

$lowPowerTickInterval = 300
$balancedPowerTickInterval = 60
$highPowerTickInterval = 15

#TODO get real process names
$highPowerPlanProcessRegexes = "Minecraft", "WoT"
$balancedPowerPlanProcessRegexes = "devenv", "code"
$defaultNightScreenBrightness = 10
$defaultDayScreenBrightness = 50
$daylightTime = 8, 17