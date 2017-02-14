@echo off
setlocal
set ROOT=%~dp0
pushd "%ROOT%"

rem ------------------------------------------------------------------------------------
set FOLDER=ProjectTemplates\Synergy\Synergex PSG

set NAME=Blank App (Universal Windows)
call :ZIPIT

set NAME=Device Licensing App (Universal Windows)
call :ZIPIT

rem ------------------------------------------------------------------------------------

set FOLDER=ProjectTemplates\Visual C#\Synergex PSG

set NAME=Navigation App (Universal Windows)
call :ZIPIT

rem ------------------------------------------------------------------------------------

goto DONE

:ZIPIT
pushd "%FOLDER%\%NAME%"
"C:\Program Files\7-Zip\7z.exe" a -r "%ROOT%DISTRIBUTE\%FOLDER%\%NAME%.zip" *.*
popd
exit /b

:DONE
popd
endlocal
pause