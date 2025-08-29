I could not find some builtin MS RDS option to allow users to access only RemoteAPP and not full Remote Desktop Session.\
This ultimate logon script loggs off users running explorer.exe while letting Local Admins in.\
It works for English Windows only. Edit according to your language version otherwise.

Put the script somewhere like c:\windows\
Create a task in schedduler to run "At logon of any user". Set local Users group to run as.
Or use this command:\
```schtasks /create /sc onlogon /ru builtin\users /tn remoteapponly /tr C:\windows\remoteapponly.cmd```
