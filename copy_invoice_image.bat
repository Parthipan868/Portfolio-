@echo off
echo Copying Invoice Tracker project image...
copy "C:\Users\arunp\.gemini\antigravity-ide\brain\920ae3d9-4415-44d0-9e52-aed0015ae638\media__1780667217881.png" "%~dp0images\invoice_tracker.png"
if %errorlevel% equ 0 (
    echo Image copied successfully to images\invoice_tracker.png!
) else (
    echo Copy failed.
)
pause
