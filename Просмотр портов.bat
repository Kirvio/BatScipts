for /f "tokens=1,2,3,4,5*" %%i in ('netstat -aon ^| findstr ":%1" ^| findstr /i listening') do echo %%j %%l & @tasklist | findstr %%m
@pause