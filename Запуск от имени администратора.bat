REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse | Find "0x0"
IF %ERRORLEVEL% == 1 goto turnoff
If %ERRORLEVEL% == 0 goto turnon

:turnoff
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LimitBlankPasswordUse /t REG_DWORD /d 0 /f
runas /user:S-1-5-32-544 notepad.exe

:turnon
runas /noprofile /user:S-1-5-32-544 notepad.exe

@pause
exit