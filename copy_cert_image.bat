@echo off
echo Copying Java SE 17 certification image...
copy "C:\Users\arunp\.gemini\antigravity\brain\86945d27-060e-4710-a2e5-58243f006f36\media__1780493179545.png" "%~dp0images\cert-java-se-17.png"
if %errorlevel% equ 0 (
    echo Image copied successfully to images\cert-java-se-17.png!
) else (
    echo Copy failed.
)
pause
