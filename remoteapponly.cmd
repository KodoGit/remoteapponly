@echo off
REM Create a scheduled task to run at logon for anyone. Set up this task run as "Users" group.
REM schtasks /create /sc onlogon /ru builtin\users /tn remoteapponly /tr C:\windows\remoteapponly.cmd

REM Local Administrators can pass
net user %USERNAME% | findstr /C:"Local Group Memberships" | findstr /I "Administrators" >nul
if %ERRORLEVEL%==0 goto :EOF

REM Non admin users running explorer.exe will not pass
REM Using findstr.exe is needed as tasklist.exe wont return the correct ERRORLEVEL
tasklist /V /FI "IMAGENAME eq explorer.exe" /fi "username eq %userdomain%\%username%"|findstr %username% >nul
if %ERRORLEVEL%==0 logoff
