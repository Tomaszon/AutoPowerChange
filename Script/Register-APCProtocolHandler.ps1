. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationVariables.ps1)

function Register-APCProtocolHandler {
	New-PSDrive -PSProvider Registry -Name HKCR -Root HKEY_CLASSES_ROOT

	$regPath = "HKCR:\APC\shell\open\command"
	$command = $protocolHandlerCommandTemplate.Replace('{0}', $userName)

	New-Item $regPath -Force
	New-ItemProperty -Path HKCR:\APC -Name "URL Protocol" -Force
	Set-ItemProperty -Path $regPath -Name '(Default)' -Value $command -Force
	Set-ItemProperty -Path HKCR:\APC -Name '(Default)' -Value 'URL:APC Protocol' -Force

	Write-Host "Registry keys registered"
}