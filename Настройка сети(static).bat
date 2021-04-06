for /f "tokens=2,3* delims= " %%a in ('netsh interface show interface ^| more +3') do (
        set "NameOfConnection=%%c"
)

netsh interface ip set address name="%NameOfConnection%" source=static addr=192.168.1.74 mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0

netsh interface ip set dns name="%NameOfConnection%" source=static addr=194.158.196.141 register=PRIMARY

@pause

exit