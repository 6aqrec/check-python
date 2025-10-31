@echo off
setlocal enabledelayedexpansion

for /f "delims=" %%i in ('where python 2^>nul') do (
    echo %%i | findstr /i "WindowsApps" >nul
    if errorlevel 1 (
        set PYTHON_EXE=%%i
    )
)

echo Real Python not found.

PAUSE

