. (Join-Path $PSScriptRoot .\Register-Task.ps1)
. (Join-Path $PSScriptRoot .\Register-APCProtocolHandler.ps1)

Write-Host "Init started"

Register-Task

Register-APCProtocolHandler

Write-Host "Init ended"