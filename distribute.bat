@echo off
echo.
setlocal
set ROOT=%~dp0
pushd "%ROOT%"

rem ------------------------------------------------------------------------------------
set FOLDER=ItemTemplates\Synergy\Synergex PSG

set NAME=Web API Controller (CRUD)
call :ZIPIT

set NAME=Web API Controller (Empty)
call :ZIPIT

rem ------------------------------------------------------------------------------------
set FOLDER=ProjectTemplates\Synergy\Synergex PSG

set NAME=ASP.NET Web API Service Library
call :ZIPIT

set NAME=Blank App (Universal Windows)
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
  echo Templates were created in the DISTRIBUTE folder but not added to Visual Studio.
)
echo.

goto DONE

:ZIPIT
echo Processing "%FOLDER%\%NAME%"
pushd "%FOLDER%\%NAME%"
"C:\Program Files\7-Zip\7z.exe" a -r "%ROOT%DISTRIBUTE\%FOLDER%\%NAME%.zip" *.* > nul
popd

if exist "%USERPROFILE%\Documents\Visual Studio 2015\Templates\." (
  if not exist "%USERPROFILE%\Documents\Visual Studio 2015\Templates\%FOLDER%\." (
    mkdir "%USERPROFILE%\Documents\Visual Studio 2015\Templates\%FOLDER%"
  )
  copy /y "%ROOT%DISTRIBUTE\%FOLDER%\%NAME%.zip" "%USERPROFILE%\Documents\Visual Studio 2015\Templates\%FOLDER%\%NAME%.zip" > nul
)

exit /b

:DONE
popd
endlocal
pause