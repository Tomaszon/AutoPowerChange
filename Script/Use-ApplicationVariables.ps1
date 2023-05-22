$userName = ((Get-WMIObject -Class "Win32_ComputerSystem").UserName -Split "\\")[1]

$appId = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe"

$previousPlan = Get-CimInstance -Name "root\cimv2\power" -Class "win32_PowerPlan" -Filter "IsActive=True"

$previousPlanName = $previousPlan.ElementName

$previousPlanGuid = $previousPlan.InstanceID.Replace("Microsoft:PowerPlan\{", "").Replace("}", "")