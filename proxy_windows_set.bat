@echo off
pushd "%~dp0"

:: Add root CA certificate
certutil -user -addstore -f root "%USERPROFILE%\.mitmproxy\mitmproxy-ca-cert.cer"
:: Set Windows proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /d 1 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d 127.0.0.1:8080 /f

echo Don't forget to set your browser to use system proxy ...
timeout 5