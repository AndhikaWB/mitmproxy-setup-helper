@echo off
pushd "%~dp0"

:: Get default Firefox profile directory
pushd "%APPDATA%\Mozilla\Firefox\Profiles\*.default*"
set "PROFILE=%CD%"
:: Reset Firefox proxy settings
copy /Y prefs.js "%TEMP%\prefs.js"
findstr /V network.proxy.type "%TEMP%\prefs.js" > prefs.js
del /Q "%TEMP%\prefs.js"
:: Delete CA certificate from default profile
popd
mar-tools\certutil -D -n "mitmproxy - mitmproxy" -d "%PROFILE%"

timeout 5