. (Join-Path $PSScriptRoot .\Switch-PowerPlanConfigs.ps1)

$appId = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe"

function Show-Toast ($planName, $imageName) {
	$content = $toastContent.Replace("{0}", $planName)
	
	$template = @"
	<toast>
		<visual>
			<binding template="ToastGeneric">
				<text hint-maxLines="1">$toastHeader</text>
				<text>$content</text>
				<image placement="appLogoOverride" hint-crop="circle" src="C:\Users\offic\OneDrive\Documents\PowerPlanChange\$imageName.png"/>
			</binding>
		</visual>

		<actions>
			<action activationType="background" arguments="dismiss" content="Dismiss" />
		</actions>
	</toast>
"@

	$xml = New-Object System.Xml.XmlDocument
	$xml.LoadXml($template)
	$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
	[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}