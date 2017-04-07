@echo off
echo.

setlocal

set ROOT=%~dp0
pushd "%ROOT%"

rem ------------------------------------------------------------------------------------
rem Check that we have 7-Zip installed

set ZIPEXE=%ProgramFiles%\7-Zip\7z.exe
if not exist "%ZIPEXE%" set ZIPEXE=%ProgramFiles(x86)%\7-Zip\7z.exe
if not exist "%ZIPEXE%" (echo Please install 7-zip from http://7-zip.org/download.html & exit/b)

rem ------------------------------------------------------------------------------------
rem Make sure we have a ZIP folder

if not exist ZIP\. (
  echo Creating ZIP folder
  echo.
  mkdir ZIP
)

rem ------------------------------------------------------------------------------------
rem Process Synergy item templates

set FOLDER=ItemTemplates\Synergy\Synergex PSG

set NAME=Web API Controller (CRUD)
call :ZIPIT

set NAME=Web API Controller (Empty)
call :ZIPIT

rem ------------------------------------------------------------------------------------
rem Process Synergy project templates

set FOLDER=ProjectTemplates\Synergy\Synergex PSG

set NAME=ASP.NET Web API Self Hosting App
call :ZIPIT

set NAME=ASP.NET Web API Service Library
call :ZIPIT

set NAME=Blank App (Universal Windows)
call :ZIPIT

set NAME=BOT Library
call :ZIPIT

set NAME=BOT Library and Web API Host
call :ZIPIT

set NAME=Device Licensing App (Universal Windows)
call :ZIPIT

rem ------------------------------------------------------------------------------------
rem Process C# project templates

set FOLDER=ProjectTemplates\Visual C#\Synergex PSG

set NAME=Navigation App (Universal Windows)
call :ZIPIT

rem ------------------------------------------------------------------------------------

echo.
if exist "%USERPROFILE%\Documents\Visual Studio 2015\Templates\." (
  echo Templates were copied to %USERPROFILE%\Documents\Visual Studio 2015\Templates
) else (
  echo Folder %USERPROFILE%\Documents\Visual Studio 2015\Templates does not exist.
)
if exist "%USERPROFILE%\Documents\Visual Studio 2017\Templates\." (
  echo Templates were copied to %USERPROFILE%\Documents\Visual Studio 2017\Templates
) else (
  echo Folder %USERPROFILE%\Documents\Visual Studio 2017\Templates does not exist.
)
echo.

rem ------------------------------------------------------------------------------------
rem All done, clean up

popd
endlocal
pause

exit/b

rem ------------------------------------------------------------------------------------
rem ZIPIT subroutine

:ZIPIT

echo Creating ZIP\%FOLDER%\%NAME%.zip

pushd "%FOLDER%\%NAME%"

"%ZIPEXE%" a -r "%ROOT%ZIP\%FOLDER%\%NAME%.zip" *.* > nul

popd

if exist "%USERPROFILE%\Documents\Visual Studio 2015\Templates\." (
  if not exist "%USERPROFILE%\Documents\Visual Studio 2015\Templates\%FOLDER%\." (
    mkdir "%USERPROFILE%\Documents\Visual Studio 2015\Templates\%FOLDER%"
  )
  copy /y "%ROOT%ZIP\%FOLDER%\%NAME%.zip" "%USERPROFILE%\Documents\Visual Studio 2015\Templates\%FOLDER%\%NAME%.zip" > nul
)

if exist "%USERPROFILE%\Documents\Visual Studio 2017\Templates\." (
  if not exist "%USERPROFILE%\Documents\Visual Studio 2017\Templates\%FOLDER%\." (
    mkdir "%USERPROFILE%\Documents\Visual Studio 2017\Templates\%FOLDER%"
  )
  copy /y "%ROOT%ZIP\%FOLDER%\%NAME%.zip" "%USERPROFILE%\Documents\Visual Studio 2017\Templates\%FOLDER%\%NAME%.zip" > nul
)

exit /b

rem ------------------------------------------------------------------------------------
