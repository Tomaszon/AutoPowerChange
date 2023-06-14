. (Join-Path $PSScriptRoot .\Register-Task.ps1)
. (Join-Path $PSScriptRoot .\Register-APCProtocolHandler.ps1)
. (Join-Path $PSScriptRoot .\Use-ApplicationConfigs.ps1)

Write-Host "Init started"

Register-Task $acTask.name $acTask.templatePath $acReasonValue

Register-Task $psTask.name $psTask.templatePath

Register-APCProtocolHandler

Set-ExecutionPolicy $executionPolicyAfterExecution CurrentUser

Write-Host "Init ended"