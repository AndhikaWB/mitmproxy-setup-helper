@echo off
pushd "%~dp0"

:: Get default Firefox profile directory
pushd "%APPDATA%\Mozilla\Firefox\Profiles\*.default*"
set "PROFILE=%CD%"
:: Set Firefox proxy settings
copy /Y prefs.js "%TEMP%\prefs.js"
findstr /V network.proxy.type "%TEMP%\prefs.js" > prefs.js
echo user_pref("network.proxy.type", 5); >> prefs.js
del /Q "%TEMP%\prefs.js"
:: Add CA certificate to default profile
popd
mar-tools\certutil -A -n "mitmproxy - mitmproxy" -t CT,c, -i "%USERPROFILE%\.mitmproxy\mitmproxy-ca.pem" -d "%PROFILE%"

echo Firefox is set to use the system proxy ...
timeout 5