: Intro visuals
@echo off
cls

echo. " _____       _     _             _            "
echo. "|  __ \     | |   | |           | |           "
echo. "| |  | | ___| |__ | | ___   __ _| |_ ___ _ __ "
echo. "| |  | |/ _ \ '_ \| |/ _ \ / _` | __/ _ \ '__|"
echo. "| |__| |  __/ |_) | | (_) | (_| | ||  __/ |   "
echo. "|_____/ \___|_.__/|_|\___/ \__,_|\__\___|_|   "
echo.
echo.
echo github.com/apoc101/win-debloater
echo.
echo.
: Checks if administrator rights are granted
:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        echo.
        pause> nul | set /p "=Press any key to continue: "
    ) else (
        echo Failure: Current permissions inadequate.
        echo.
        pause> nul | set /p "=Press any key to exit: "
        exit
    )


: Disable menu
:dis-menu
cls
echo.
echo Please select and option using number keys:
echo. [1] Disable Cortana
echo. [2] Disable Compatibility Telemetry
echo. [3] Disable History Activity collection
echo. [4] Disable Location Services
echo. [5] Excecute first 4 debloats
echo.
echo. [6] Disable Storage Sense
echo. [7] Disable Enhanced Pointer Precision
echo. [8] Disable Hybernation (not recommended for laptops)
echo.
echo. [9] Excecute all debloats, except Hybernation
echo. [0] Go to Enable menu
choice /C 1234567890 /N
if %errorlevel%==1 goto disable-cortana
if %errorlevel%==2 goto disable-telemetry
if %errorlevel%==3 goto disable-collection
if %errorlevel%==4 goto disable-location
if %errorlevel%==5 goto debloat-1-4
if %errorlevel%==6 goto disable-ss
if %errorlevel%==7 goto disable-ep
if %errorlevel%==8 goto disable-hybernation
if %errorlevel%==9 goto debloat-all
if %errorlevel%==0 goto en-menu


: Enable menu
:en-menu

cls
echo.
echo Please select and option using number keys:
echo. [1] Enable Cortana
echo. [2] Enable Compatibility Telemetry (partially)
echo. [3] Enable History Activity collection
echo. [4] Enable Location Services
echo. [5] Enable first 4 settings
echo.
echo. [6] Enable Storage Sense
echo. [7] Enable Enhanced Pointer Precision
echo. [8] Enable Hybernation
echo.
echo. [9] Enable all, except Hybernation
echo. [0] Go to Disable menu
choice /C 1234567890 /N
if %errorlevel%==1 goto enable-cortana
if %errorlevel%==2 goto enable-telemetry
if %errorlevel%==3 goto enable-collection
if %errorlevel%==4 goto enable-location
if %errorlevel%==5 goto enable-1-4
if %errorlevel%==6 goto enable-ss
if %errorlevel%==7 goto enable-ep
if %errorlevel%==8 goto enable-hybernation
if %errorlevel%==9 goto enable-all
if %errorlevel%==0 goto dis-menu
goto dis-menu

: Disable Functions

:disable-cortana
echo.
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo Cortana disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:disable-telemetry
echo.
sc delete DiagTrack
sc delete dmwappushservice
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemtery" /t REG_DWORD /d 0 /f
echo Compatibility Telemetry disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:disable-collection
echo.
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
echo History Activity collection disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:disable-location
echo.
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
echo Location Services disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:debloat-1-4
: Cortana
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
: Telemetry
sc delete DiagTrack
sc delete dmwappushservice
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemtery" /t REG_DWORD /d 0 /f
: History Activity collection
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
: Location Services
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
echo.
echo. Debloat complete.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:disable-ss
echo.
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d 0 /f
echo Storage Sense disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:disable-ep
echo.
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d 0 /f
echo Enhanced Pointer Precision disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:disable-hybernation
echo.
powercfg.exe /hibernate off
echo Hybernation disabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu


:debloat-all
echo.
: Cortana
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
: Telemetry
sc delete DiagTrack
sc delete dmwappushservice
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-DiagTrack-Listener.etl
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemtery" /t REG_DWORD /d 0 /f
: History Activity collection
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
: Location Services
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
: Storage Sense
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d 0 /f
: Enhanced Pointer Precision
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d 0 /f
echo.
echo. Debloat complete.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto dis-menu





: Enable Functions

:enable-cortana
echo.
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 1 /f
echo Cortana enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-telemetry
echo.
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemtery" /t REG_DWORD /d 1 /f
echo Compatibility Telemetry partially enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-collection
echo.
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 1 /f
echo History Activity collection enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-location
echo.
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Allow" /f
echo Location Services enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-1-4
: Cortana
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 1 /f
: Telemetry
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemtery" /t REG_DWORD /d 1 /f
: History Activity collection
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 1 /f
: Location Services
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Allow" /f
echo 1-4 enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-ss
echo.
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d 1 /f
echo Storage Sense enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-ep
echo.
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d 6 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d 10 /f
echo Enhanced Pointer Precision enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu


:enable-hybernation
echo.
powercfg.exe /hibernate on
echo Hybernation enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu

:enable-all
echo.
: Cortana
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 1 /f
: Telemetry
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemtery" /t REG_DWORD /d 1 /f
: History Activity collection
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 1 /f
: Location Services
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Allow" /f
: Storage Sense
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d 1 /f
: Enhanced Pointer Precision
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d 6 /f
reg.exe add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d 10 /f
echo.
echo All features enabled.
echo.
pause > nul | set /p "=Press any key to continue: "
cls
goto en-menu