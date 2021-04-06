for /f "tokens=2,3* delims= " %%a in ('netsh interface show interface ^| more +3') do (
        set "NameOfConnection=%%c"
)
echo %NameOfConnection%
@pause
exit