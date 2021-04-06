  for %%i in (7z#0 arj#4 bz2#2 bzip2#2 cab#7 cpio#12 deb#11 dmg#17 fat#21 gz#14 gzip#14 hfs#18 iso#8 lha#6 lzh#6 lzma#16 ntfs#22 rar#3 rpm#10 squashfs#24 001#9 swm#15 tar#13 taz#5 tbz#2 tbz2#2 tgz#14 tpz#14 txz#23 vhd#20 wim#15 xar#19 xz#23 z#5 zip#1) do for /f "tokens=1* delims=#" %%a in ("%%i") do call :AssocSetup %%a %%b
    exit /b
:AssocSetup

  reg add "HKCR\.%1" /f /ve /t REG_SZ /d "7-Zip.%1" > nul
  reg add "HKCR\7-Zip.%1" /f /ve /t REG_SZ /d "%1 Archive" > nul
  reg add "HKCR\7-Zip.%1\DefaultIcon" /f /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,%2" > nul
  reg add "HKCR\7-Zip.%1\shell" /f /ve /t REG_SZ /d "" > nul
  reg add "HKCR\7-Zip.%1\shell\open" /f /ve /t REG_SZ /d "" > nul
  reg add "HKCR\7-Zip.%1\shell\open\command" /f /ve /t REG_SZ /d """"C:\Program Files\7-Zip\7zFM.exe""" """%%1"""" > nul 

@pause

exit 