set dk=%USERPROFILE%\Desktop

if exist %dk%\QUBE_ARCHIVE\ (echo "QUBE_ARCHIVE EXISTS!" ) else (mkdir %dk%\QUBE_ARCHIVE )
if exist %dk%\QUBE_STUDENT\ (echo "QUBE_STUDENT EXISTS!" ) else ( mkdir %dk%\QUBE_STUDENT)

robocopy /S /E QUBE_F22 %dk%\QUBE_STUDENT

"archive_and_purge_qube_files.bat"