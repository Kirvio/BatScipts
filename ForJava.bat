reg add "HKCR\7-Zip.%1\shell\open\command" /f /ve /t REG_SZ /d """"C:\Program Files\7-Zip\7zFM.exe""" """%%1""" >nul*" 

@pause

exit 