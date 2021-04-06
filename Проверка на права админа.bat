WHOAMI /PRIV | find /i "SeRemoteShutdownPrivilege"
if %ERRORLEVEL% == 0 goto admin
echo NOT have admin rights!
@pause
exit
:admin
ECHO !!! ADMIN !!!
@pause