@echo off
REM Тут нужно прописать полный путь
  set "fromDir=F:\Progs\Scripts"
  set "AvestDir=D:\AvestSoft"

if "%PROCESSOR_ARCHITECTURE%"=="x86" goto cop

REM Установка ПО

  "%fromDir%\jre-8u201-windows-i586.exe" /s
  "%fromDir%\jre-8u201-windows-x64.exe" /s
  "%fromDir%\Firefox Setup 52.0esr.exe" /s

     IF %ERRORLEVEL% NEQ 0 echo  Failed to install software.
     If %ERRORLEVEL% == 0 echo  Installation of Software succesfull.

REM Копируем папку AvCIS в C:\Program Files (x86)\

       xcopy /s /y "%fromDir%\AvCIS\*.*" "C:\Program Files\AvCIS\*.*"
       xcopy /s /y /i "%fromDir%\AvPKISetup(bel_base).zip" "%AvestDir%\*.*" 

         IF %ERRORLEVEL% NEQ 0 echo Failed to copy files.
         If %ERRORLEVEL% == 0 echo Files copyed succesfully.

REM Копируем список исключений для сайтов в Java Security

       xcopy /s /y "%fromDir%\exception.sites" "C:\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security\*.*"
         reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f

         IF %ERRORLEVEL% NEQ 0 echo  Failed with Java.
         If %ERRORLEVEL% == 0 echo  Succesfull Java operations.
 
REM Назначаем/меняем права группе пользователи на папку 

       icacls "C:\Program Files (x86)\AvCIS" /grant:r *S-1-5-32-545:(OI)(CI)(F)

          IF %ERRORLEVEL% NEQ 0 echo  Rights not granted.
          If %ERRORLEVEL% == 0 echo  Rights granted.

REM Запускаем браузер firefox

:there

  start firefox
  timeout /t 30 

  call "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" -silent -setDefaultBrowser

     IF %ERRORLEVEL% NEQ 0 echo Firefox error
     If %ERRORLEVEL% == 0 echo Operations with firefox complete!

REM Копируем настройки браузера Firefox

IF EXIST "%APPDATA%\Mozilla\Firefox\Profiles\*.*" (goto here) else (goto there) 

  :here
  set "destDir=%APPDATA%\Mozilla\Firefox\Profiles"

    for /f %%d in ('dir /B /A:D "%destDir%"') do set "copyto=%%~d"

    xcopy /s /y "%fromDir%\prefs.js" "%destDir%\%copyto%\*.*"

     IF %ERRORLEVEL% NEQ 0 echo  Firefox defaults error.
     If %ERRORLEVEL% == 0 echo  Firefox defaults set up.

       unzip "%AvestDir%\AvPKISetup(bel_base).zip" 
       "%AvestDir%\AvPKISetup(bel_base)\AvPKISetup(bel_base)\AvPKISetup2.exe"

@pause

exit

:cop

REM Все тоже самое что и выше, только для x32 архитектуры

  "%fromDir%\jre-8u201-windows-i586.exe" /s
  "%fromDir%\Firefox Setup 52.0esr.exe" /s

     IF %ERRORLEVEL% NEQ 0 echo  Failed to install software.
     If %ERRORLEVEL% == 0 echo  Installation of Software succesfull.

    xcopy /s /y "%fromDir%\AvCIS\*.*" "C:\Program Files\AvCIS\*.*"
    xcopy /s /y /i "%fromDir%\AvPKISetup(bel_base).zip" "D:\AvestSoft\*.*"

      IF %ERRORLEVEL% NEQ 0 echo Failed to copy files.
      If %ERRORLEVEL% == 0 echo Files copyed succesfully.

    xcopy /s /y "%fromDir%\exception.sites" "C:\Users\%username%\AppData\LocalLow\Sun\Java\Deployment\security\*.*"

      reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f

        IF %ERRORLEVEL% NEQ 0 echo Failed with Java.
        If %ERRORLEVEL% == 0 echo Succesfull Java operations.

        icacls "C:\Program Files\AvCIS" /grant:r *S-1-5-32-545:(OI)(CI)(F) 

          IF %ERRORLEVEL% NEQ 0 echo Rights not granted.
          If %ERRORLEVEL% == 0 echo Rights granted.

IF EXIST "%APPDATA%\Mozilla\Firefox\Profiles\*.*" (goto here) else (goto there) 

there:

  start firefox
  timeout /t 40 

  call "C:\Program Files\Mozilla Firefox\firefox.exe" -silent -setDefaultBrowser

     IF %ERRORLEVEL% NEQ 0 echo Firefox error
     If %ERRORLEVEL% == 0 echo Operations with firefox complete!

:here

  set "destDir=%APPDATA%\Mozilla\Firefox\Profiles"

    for /f %%d in ('dir /B /A:D "%destDir%"') do set "copyto=%%~d"

    xcopy /s /y "%fromDir%\prefs.js" "%destDir%\%copyto%\*.*"

      IF %ERRORLEVEL% NEQ 0 echo Firefox defaults error.
      If %ERRORLEVEL% == 0 echo Firefox defaults set up.

        unzip "%AvestDir%\AvPKISetup(bel_base).zip" 
        "%AvestDir%\AvPKISetup(bel_base)\AvPKISetup(bel_base)\AvPKISetup2.exe"

@pause

exit