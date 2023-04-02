. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

$appId = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe"

function Show-Toast ($planName, $imageName) {
	$content = $toastContent.Replace("{0}", $planName)
	
	$icon = "$toastIconFolder\$imageName.png"

	$template = @"
	<toast>
		<visual>
			<binding template="ToastGeneric">
				<text hint-maxLines="1">$toastHeader</text>
				<text>$content</text>
				<image placement="appLogoOverride" hint-crop="circle" src="$icon"/>
			</binding>
		</visual>

		<actions>
			<action activationType="background" arguments="dismiss" content="Dismiss" />
		</actions>
	</toast>
"@

	$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
	$xml.LoadXml($template)
	$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
	[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}