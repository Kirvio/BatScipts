pnputil /add-driver "E:\XP and newer\OEMSETUP.inf" /install
(New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\192.168.1.45\FS-1040")
(New-Object -ComObject WScript.Network).SetDefaultPrinter("\\192.168.1.45\FS-1040")