@echo off

powershell Set-ExecutionPolicy Bypass -Scope CurrentUser

for /f "usebackq delims=" %%i in (`
  powershell -c "'%1'.Replace('apc://', '')"
`) do set filePath=%%i

for /f "usebackq delims=" %%i in (`
  powershell -c "'%3'.Trim('/')"
`) do set planName=%%i

PowerShell -NoLogo -WindowStyle hidden -NoProfile -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -NoLogo -WindowStyle hidden -File """"%filePath%"""" -guid """"%2"""" -planName """"%planName%"""" ' -Verb RunAs}";