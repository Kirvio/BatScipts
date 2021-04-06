for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden') do set "AppPath=%%~b"
echo %AppPath%
@pause