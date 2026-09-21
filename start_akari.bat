@echo off
title Akari AI Launcher
echo AKARI AI - Windows Start Script
echo ==========================================================
echo.

:: Ensure we are in the project root directory
cd /d "%~dp0"

echo [1/2] Launching Python Desktop Agent...
:: Check if virtual environment exists and use its python, otherwise fallback to global python
if exist "venv\Scripts\python.exe" (
    start "Akari Desktop Agent (Python)" cmd /k "venv\Scripts\python.exe run_agent.py"
) else (
    start "Akari Desktop Agent (Python)" cmd /k "python run_agent.py"
)

:: Wait 2 seconds for Python to initialize
timeout /t 2 /nobreak >nul

echo [2/2] Launching Node.js Server ^& Vite Frontend...
start "Akari Web Server (Node)" cmd /k "npm run dev"

echo.
echo ==========================================================
echo AKARI AI IS RUNNING!
echo.
echo 🎙️ SYSTEM-WIDE VOICE ACTIVATION IS ACTIVE:
echo    Speak aloud "Wakeup Akari" from ANY screen or desktop
echo    and Akari will immediately unminimize and activate!
echo.
echo Open your browser to: http://localhost:3000
echo Launching default browser...
start http://localhost:3000
echo.
echo Note: The Python agent and Node server are running in the
echo two newly opened command prompt windows.
echo ==========================================================
echo.
pause
