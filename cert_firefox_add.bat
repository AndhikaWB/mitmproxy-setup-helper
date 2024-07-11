@echo off
pushd "%~dp0"

:: Get default Firefox profile directory
pushd "%APPDATA%\Mozilla\Firefox\Profiles\*.default*"
set "PROFILE=%CD%"
:: Add CA certificate to default profile
popd
mar-tools\certutil -A -n "mitmproxy - mitmproxy" -t CT,c, -i "%USERPROFILE%\.mitmproxy\mitmproxy-ca.pem" -d "%PROFILE%"

timeout 5