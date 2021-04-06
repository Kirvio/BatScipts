REM просмотр информации об имеющихся файлах подкачки
wmic pagefile list /format:list

REM автоматическое назначение места для файла подкачки
wmic computersystem set AutomaticManagedPagefile=True

REM задать размер файла подкачки
wmic pagefileset where name="C:\pagefile.sys" set InitialSize=1024,MaximumSize=4096

@pause
exit