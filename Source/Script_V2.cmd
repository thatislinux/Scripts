@echo off
setlocal enabledelayedexpansion

set CURRENT_PATH=C:\Arduino\Script
set SRC_FOLDER=%CURRENT_PATH%\Source
set LOG_FILE_PATH=%CURRENT_PATH%\Logs\log.log
set FILE_NAME_DATETIME=_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.csv

echo ++++++++++++Script Starts : %DATE%: %TIME%  >> %LOG_FILE_PATH%

for /f "tokens=1,2 delims=;" %%a in ('type "%CURRENT_PATH%\config.txt"') do (
for /f "delims=" %%c in ('dir /b /a-d ^find %%a') do (
echo Directory:%%b, FilePattern:%%a, MatchedFile:%%c >> %LOG_FILE_PATH%
md "%%b" 2>>%LOG_FILE_PATH%
set FileName=%%~nc
set newFi=%%b\!FileName!_%FILE_NAME_DATETIME%
echo NewFileName : !newFi! >> %LOG_FILE_PATH%
move /y %%~nfc !newFi! 2>>%LOG_FILE_PATH%
echo FileMoved... >> %LOG_FILE_PATH%
)
)
echo -------------Script Ends : %DATE%: %TIME% >> %LOG_FILE_PATH%



