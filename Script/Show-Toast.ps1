. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

function Show-Toast ($planName, $imageName, $previousPlanGuid, $previousPlanName) {
	$content = $toastContent.Replace("{0}", $planName)
	
	$icon = "$toastIconFolder\$imageName.png".Replace("{0}", $userName)

	$currentLocation = (Get-Location).Path

	$template = Get-Content "$toastTemplateFolder\toastTemplate.xml".Replace("{0}", $userName) | Out-String
	$template = $template.Replace("{toastHeader}", $toastHeader).Replace("{content}", $content).Replace("{icon}", $icon).Replace("{currentLocation}", $currentLocation).Replace("{previousPlanGuid}", $previousPlanGuid).Replace("{previousPlanName}", $previousPlanName).Replace("{planName}", $planName)

	$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
	$xml.LoadXml($template)
	$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
	[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}