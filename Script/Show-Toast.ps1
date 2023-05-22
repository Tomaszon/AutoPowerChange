. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

function Show-Toast ($planName, $imageName) {
	$content = $toastContent.Replace("{0}", $planName)
	
	$icon = "$toastIconFolder\$imageName.png".Replace("{0}", $userName)

	$currentLocation = (Get-Location).Path

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
			<action activationType="protocol" arguments="powershell://$currentLocation\Invoke-PowerPlanRestore.ps1 -guid $previousPlanGuid -planName $previousPlanName" content="Restore plan" />
		</actions>
	</toast>
"@

	$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
	$xml.LoadXml($template)
	$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
	[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}