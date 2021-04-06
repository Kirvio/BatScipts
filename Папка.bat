set "fromDir=%cd%\Scripts"
set "destDir=%APPDATA%\Mozilla\Firefox\Profiles"
  for /f %%d in ('dir /B /A:D "%destDir%"') do set "copyto=%%~d"
  xcopy /y /o /e /r "%cd%\prefs.js" "%destDir%\%copyto%\*.*"
  @pause
exit