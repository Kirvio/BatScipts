REM �������� ���������� �� ��������� ������ ��������
wmic pagefile list /format:list

REM �������������� ���������� ����� ��� ����� ��������
wmic computersystem set AutomaticManagedPagefile=True

REM ������ ������ ����� ��������
wmic pagefileset where name="C:\pagefile.sys" set InitialSize=1024,MaximumSize=4096

@pause
exit