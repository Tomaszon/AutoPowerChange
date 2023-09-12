@echo off

powershell Set-ExecutionPolicy Bypass CurrentUser

for /f "usebackq delims=" %%i in (`
  powershell -c "'%1'.Replace('apc://', '')"
`) do set filePath=%%i

for /f "usebackq delims=" %%i in (`
  powershell -c "'%2'.Trim('/')"
`) do set planName=%%i

for /f "usebackq delims=" %%i in (`
  powershell -c "'%3'.Trim('/')"
`) do set guid=%%i

for /f "usebackq delims=" %%i in (`
  powershell -c "'%4'.Trim('/')"
`) do set filePath2=%%i

PowerShell -NoLogo -WindowStyle hidden -NoProfile -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -NoLogo -WindowStyle hidden -File """"%filePath%"""" -planName """"%planName%"""" -guid """"%guid%"""" ' -Verb RunAs}";

PowerShell -NoLogo -WindowStyle hidden -NoProfile -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -NoLogo -WindowStyle hidden -File """"%filePath2%"""" -planName """"%planName%"""" ' -Verb RunAs}";