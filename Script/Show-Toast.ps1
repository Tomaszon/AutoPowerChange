. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)
. (Join-Path $PSScriptRoot .\Get-ScreenResolution.ps1)

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

function Show-Toast ($reason, $planName, $imageName, $previousPlanGuid, $previousPlanName) {
	$content = $toast.content.Replace("{0}", $planName)
	
	$resourceFolder = $resourceFolder.Replace("{0}", $userName)
	$image = "$resourceFolder\$imageName.png"

	$currentLocation = (Get-Location).Path

	$template = Get-Content "$resourceFolder\toastTemplate.xml".Replace("{0}", $userName) | Out-String

	if ($planName -eq $priorityPowerPlan.name) {
		$width = $priorityAppScreenResolution.width
		$height = $priorityAppScreenResolution.height
	}
	else {
		$width = $standardScreenResolution.width
		$height = $standardScreenResolution.height
	}

	$resolutionButton = $resolutionButtonTemplate.Replace("{w}", $width).Replace("{h}", $height)

	$resolution = Get-ScreenResolution

	if ($reason -eq $acReasonValue -or $resolution.width -eq $width -and $resolution.height -eq $height) {
		$template = $template.Replace("{resolutionButton}", $null)
	}
	else {
		$template = $template.Replace("{resolutionButton}", $resolutionButton)
	}

	$template = $template.Replace("{toastHeader}", $toast.header).Replace("{content}", $content).Replace("{image}", $image).Replace("{currentLocation}", $currentLocation).Replace("{previousPlanGuid}", $previousPlanGuid).Replace("{previousPlanName}", $previousPlanName).Replace("{planName}", $planName).Replace("{resourceFolder}", $resourceFolder)

	$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
	$xml.LoadXml($template)
	$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
	[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}