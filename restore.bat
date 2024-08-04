@echo off
cd C:\stormbacks
IF EXIST "C:\stormbacks\backup1.zip" (
   SET TOB=1
) ELSE (
   SET TOB=0
)
IF EXIST "C:\stormbacks\backup2.zip" (
     SET TOB=2
)
IF EXIST "C:\stormbacks\backup3.zip" (
      SET TOB=3
)
echo A backup is made every hour,or every startup.
echo Well,the files got corrupted,didn't they?
echo First we need to know which backup you need.
if %TOB% EQU 0 (
    echo There are no backups..?
    timeout 10
    exit
)
if %TOB% EQU 1 (
    echo There is only one backup!
    goto ob
)
if %TOB% EQU 2 (
    echo There is two backups.
    goto tb
)
if %TOB% EQU 3 (
    echo You are in luck!
    goto thb
)
:ob
Echo Would you like to restore this single backup?
echo [1] Yes
echo [2] Exit
choice /c 12 /m "Choice >> "
if %ERRORLEVEL%==1 cls && goto 1r
if %ERRORLEVEL%==2 cls && exit

:tb
echo Well there are two backups,which one do you want to restore?
echo [1] First(latest)
echo [2] Second(oldest)
echo [3] Exit
choice /c 123 /m "Choice >> "
if %ERRORLEVEL%==1 cls && goto 1r
if %ERRORLEVEL%==2 cls && goto 2r
if %ERRORLEVEL%==3 cls && exit

:thb
echo Well there are three freaking backups! Which one do you want to restore?
echo [1] First(latest)
echo [2] Second
echo [3] Third(oldest)
echo [4] Exit
choice /c 1234 /m "Choice >> "
if %ERRORLEVEL%==1 cls && goto 1r
if %ERRORLEVEL%==2 cls && goto 2r
if %ERRORLEVEL%==3 cls && goto 3r
if %ERRORLEVEL%==4 cls && exit

:1r
del %appdata%\Stormworks
7z x backup1.zip -o"%appdata%"
echo Backup xtracted Succesfully!
echo Exiting.
timeout 5
exit

:2r
del %appdata%\Stormworks
7z x backup2.zip -o%appdata%
echo Backup xtracted Succesfully!
echo Exiting.
timeout 5
exit

:3r
del %appdata%\Stormworks
7z x backup3.zip -o%appdata%
echo Backup xtracted Succesfully!
echo Exiting.
timeout 5
exit