@echo off
pushd "%~dp0"

:: Get default Firefox profile directory
pushd "%APPDATA%\Mozilla\Firefox\Profiles\*.default*"
set "PROFILE=%CD%"
:: Delete CA certificate from default profile
popd
mar-tools\certutil -D -n "mitmproxy - mitmproxy" -d "%PROFILE%"

timeout 5