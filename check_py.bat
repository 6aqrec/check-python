@echo off
setlocal enabledelayedexpansion

for /f "delims=" %%i in ('where python 2^>nul') do (
    echo %%i | findstr /i "WindowsApps" >nul
    if errorlevel 1 (
        set PYTHON_EXE=%%i
        goto found_python
    )
)

echo Real Python not found.


for /f "delims=" %%i in ('where python 2^>nul') do (
    echo %%i | findstr /i "WindowsApps" >nul
    if errorlevel 1 (
        set PYTHON_EXE=%%i
        goto found_python
    )
)

echo Failed to locate Python executable. Exiting.
exit /b 1

:found_python
echo Found Python at: %PYTHON_EXE%

%PYTHON_EXE% -m pip --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo pip not found.
    
) ELSE (
    echo pip is installed.
)

echo Python and pip are ready. Continuing script...
%PYTHON_EXE% -m pip install requests
