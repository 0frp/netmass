@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "POWERSHELL_EXE=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

if not exist "%POWERSHELL_EXE%" (
    echo PowerShell was not found. This installer requires Windows PowerShell.
    exit /b 1
)

"%POWERSHELL_EXE%" -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%install-all-dotnet.ps1" -InstallAspNetRuntime -InstallDotnetRuntime
set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
    echo.
    echo DotNet mass install failed with exit code %EXIT_CODE%.
    exit /b %EXIT_CODE%
)

echo.
echo DotNet mass install finished successfully.
endlocal
