if "%PROCESSOR_ARCHITECTURE%"=="x86" goto cop
"%cd%\Scripts\jre-8u201-windows-i586.exe" /s
"%cd%\Scripts\jre-8u201-windows-x64.exe" /s
"%cd%\Scripts\Firefox Setup 52.0esr.exe" /s
xcopy /y /o /e /r "%cd%\Scripts\prefs.js" "%APPDATA%\Mozilla\Firefox\Profiles\*.default\*.*"
xcopy /y /o /e "%cd%\Scripts\AvCIS\*.*" "C:\Program Files (x86)\AvCIS\*.*"
xcopy /y /o /e "%cd%\Scripts\exception.sites" "C:\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security\*.*"
icacls "C:\Program Files (x86)\AvCIS" /grant:r *S-1-5-32-545:(OI)(CI)(F)
@pause
exit
:cop
"%cd%\Scripts\jre-8u201-windows-i586.exe" /s
"%cd%\Scripts\Firefox Setup 52.0esr.exe" /s
xcopy /y /o /e /r "%cd%\Scripts\prefs.js" "%APPDATA%\Mozilla\Firefox\Profiles\*.default\*.*"
xcopy /y /o /e "%cd%\Scripts\AvCIS\*.*" "C:\Program Files\AvCIS\*.*"
xcopy /y /o /e "%cd%\Scripts\exception.sites" "C:\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security\*.*"
icacls "C:\Program Files\AvCIS" /grant:r *S-1-5-32-545:(OI)(CI)(F) 
@pause
exit