$userName = ((Get-WMIObject -Class "Win32_ComputerSystem").UserName -Split "\\")[1]

$appId = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe"