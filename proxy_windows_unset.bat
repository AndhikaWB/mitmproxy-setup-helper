@echo off
pushd "%~dp0"

:: Delete root CA certificate
certutil -user -delstore -f root mitmproxy
:: Unset Windows proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /d 0 /t REG_DWORD /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f

timeout 5