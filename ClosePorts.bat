netsh advfirewall firewall add rule dir=in action=block protocol=UDP localport=135 name="Block1_TCP-135"
netsh advfirewall firewall add rule dir=in action=block protocol=UDP localport=137 name="Block1_TCP-137"
netsh advfirewall firewall add rule dir=in action=block protocol=UDP localport=138 name="Block1_TCP-138"
netsh advfirewall firewall add rule dir=in action=block protocol=UDP localport=139 name="Block_TCP-139" 
netsh advfirewall firewall add rule dir=in action=block protocol=UDP localport=445 name="Block_TCP-445" 
netsh advfirewall firewall add rule dir=in action=block protocol=UDP localport=5000 name="Block_TCP-5000"
pause
