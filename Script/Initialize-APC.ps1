. (Join-Path $PSScriptRoot .\Register-Task.ps1)
. (Join-Path $PSScriptRoot .\Register-APCProtocolHandler.ps1)

Write-Host "Init started"

Register-Task

Register-APCProtocolHandler

Set-ExecutionPolicy $executionPolicyAfterExecution -Scope CurrentUser

Write-Host "Init ended"