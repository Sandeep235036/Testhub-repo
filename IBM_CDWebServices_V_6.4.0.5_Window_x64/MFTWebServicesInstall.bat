@echo off
rem Copyright (C) Altran ACT S.A.S. 2021,2022. All rights reserved.
@echo off

echo Installing Webservices...

MFTWebServices.exe -i silent -f silentInstall.properties
echo "Exit Code: %ERRORLEVEL%"

IF %ERRORLEVEL% EQU 0 goto success
IF %ERRORLEVEL% EQU 1 goto success
IF %ERRORLEVEL% EQU -1 goto error
IF %ERRORLEVEL% GTR 1 goto error

echo Not found.
goto commonexit

:error
echo Installer didn't install correctly. Please check INSTALLTION_DIRECTORY/logs/failure.txt for more information.
goto commonexit

:success
echo Installer installed/upgraded correctly.
echo Please refer INSTALLTION_DIRECTORY/README.txt for getting started with MFTWebservices.
goto commonexit

:commonexit
pause