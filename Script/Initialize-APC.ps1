. (Join-Path $PSScriptRoot .\Register-Task.ps1)
. (Join-Path $PSScriptRoot .\Register-APCProtocolHandler.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

Write-Host "Init started"

Register-Task $acTaskName $acTaskTemplatePath $acReasonValue

Register-Task $psTaskName $psTaskTemplatePath

Register-APCProtocolHandler

Set-ExecutionPolicy $executionPolicyAfterExecution CurrentUser

Write-Host "Init ended"