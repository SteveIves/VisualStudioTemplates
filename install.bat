@echo off
echo.
setlocal
set ROOT=%~dp0
pushd "%ROOT%"

rem Make sure we have a ZIP folder
if not exist ZIP\. (
  echo Creating ZIP folder
  echo.
  mkdir ZIP
)

rem ------------------------------------------------------------------------------------
set FOLDER=ItemTemplates\Synergy\Synergex PSG

set NAME=Web API Controller (CRUD)
call :ZIPIT

set NAME=Web API Controller (Empty)
call :ZIPIT

rem ------------------------------------------------------------------------------------
set FOLDER=ProjectTemplates\Synergy\Synergex PSG

set NAME=ASP.NET Web API Self Hosting App
call :ZIPIT

set NAME=ASP.NET Web API Service Library
call :ZIPIT

set NAME=Blank App (Universal Windows)
call :ZIPIT

set name=BOT
call :ZIPIT

set NAME=Device Licensing App (Universal Windows)
call :ZIPIT

rem ------------------------------------------------------------------------------------

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

goto DONE

:ZIPIT
echo Creating ZIP\%FOLDER%\%NAME%.zip
pushd "%FOLDER%\%NAME%"
"C:\Program Files\7-Zip\7z.exe" a -r "%ROOT%ZIP\%FOLDER%\%NAME%.zip" *.* > nul
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

:DONE
popd
endlocal
pause