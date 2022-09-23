:: Get current path where batch file exists
set frompath=%cd%\me_352_lessons
set dk=%USERPROFILE%\Desktop

::check if repo exists
if exist me_352_lessons ( rmdir /s /q me_352_lessons )
pause
:: Clone git repo into local directory
call git clone https://github.com/mgiglia92/me_352_lessons.git
pause
:: Make sure that this batch file is in the PURGE SOURCE directory
if exist ..\QUBE_PURGE_SOURCE ( echo "PURGE SOURCE EXISTS")

:: get current datetime remove all characters that can't be a dir name
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
set datetime=%mydate%:"_":%mytime%
set datetime=%datetime:/=%
set datetime=%datetime:\=%
set datetime=%datetime::=%

:: Archive the destination folder before purging
robocopy /E %dk%\QUBE_STUDENT\ %dk%\QUBE_ARCHIVE\%datetime%

rmdir /s /q %dk%\QUBE_STUDENT
mkdir %dk%\QUBE_STUDENT

:: Copy files to destination folder
robocopy /E %frompath% %dk%\QUBE_STUDENT /XD *.git
