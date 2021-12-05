@echo off
title SmallHost Backup
echo You will be asked to enter your SmallHost username and password. Ensure you are not sharing your screen and that no one can see your username and password.
echo.
echo Enter your SmallHost username.
set /p smallhostuser=
echo.
echo Enter your SmallHost password. THIS WILL NOT APPEAR AS DOTS OR DASHES ON YOUR SCREEN, MAKE SURE YOU DO NOT SHARE THIS!
set /p smallhostpass=
goto ftpconn

:ftpconn
cls
echo.
title Downloading Backup
echo Deleting old backup folder (if exists)...
IF EXIST C:\Users\%USERNAME%\Downloads\smallhostbackup RMDIR /S /Q C:\Users\%USERNAME%\Downloads\smallhostbackup
echo Making backup folder...
mkdir "C:\Users\%USERNAME%\Downloads\smallhostbackup"
echo Contacting SmallHost FTP Server via WinSCP...
cd C:\Program Files (x86)\WinSCP
winscp.com /command ^
    "open ftp://"%smallhostuser%":"%smallhostpass%"@ftp.smallhost.us.to" ^
    "lcd C:\Users\%USERNAME%\Downloads\smallhostbackup" ^
    "get *" ^
    "exit"
echo.
title Transfer complete
echo The transfer has been completed. Feel free to read the log above.
echo Your backup is located at C:\Users\%USERNAME%\Downloads\smallhostbackup on your computer.
echo.
echo Thank you for choosing SmallHost!
pause
exit
