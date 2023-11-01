@echo off
:downloadfile
set /p URL=The URL of the file that you want to download: 
curl %URL% -O