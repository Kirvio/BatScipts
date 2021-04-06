if "%PROCESSOR_ARCHITECTURE%"=="x86" goto cop
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f
@pause
exit
:cop
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f
@pause
exit