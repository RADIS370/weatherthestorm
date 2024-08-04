SETLOCAL ENABLEDELAYEDEXPANSION
IF "%STARTED%"=="" SET STARTED=0
IF "%started%"=="0" (
   SET STARTED=1
   powershell -ExecutionPolicy Bypass -command "Start-Process C:\stormbacks\script.bat -WindowStyle Hidden"
   exit
  ) ELSE (
  goto ok
  )


:ok
SET STARTED=0
cd C:\stormbacks
del C:\stormbacks\Stormworks /Q
mkdir C:\stormbacks\Stormworks
robocopy %appdata%\Stormworks C:\stormbacks\Stormworks /s
del backup3.zip
ren backup2.zip backup3.zip
ren backup1.zip backup2.zip
7z a backup1.zip C:\stormbacks\Stormworks
del /S C:\stormbacks\Stormworks /Q

timeout 3600
goto ok