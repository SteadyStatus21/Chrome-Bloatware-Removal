@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges... Please accept the prompt!
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\RequestAdministrator.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\RequestAdministrator.vbs"

    TIMEOUT /T 3 /NOBREAK
    "%temp%\RequestAdministrator.vbs"
    del "%temp%\RequestAdministrator.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
@echo off
cls
:start
echo.
echo.
echo Created by SteadyStatus21
echo.
echo.
echo.
echo 1 - Remove Bloatware from Chrome
echo 2 - Add Bloatware back to Chrome
echo.
echo. 
set choice=
set /p choice=Select a Option: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto remove
if '%choice%'=='2' goto add
ECHO "%choice%" is not valid, try again
echo.
cls
goto start
:remove
cls
echo.
echo.
echo WARNING: 
echo.
echo WHAT YOU ARE ABOUT TO DO IS MODIFY YOUR REGISTRY TO REMOVE POLICIES. 
echo BY PRESSING ANY KEY, YOU KNOW THAT I AM NOT RESPONSIBLE FOR ANY DAMAGE
echo CAUSED TO YOUR SYSTEM. 
echo.
echo.
pause
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v 1 /t REG_SZ /d eimadpbcbfnmbkopoojfekhnkhdbieeh /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v 2 /t REG_SZ /d eimadpbcbfnmbkopoojfekhnkhdbieeh /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /v 1 /t REG_SZ /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\URLBlocklist" /v 1 /t REG_SZ /d https://www.qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq.com /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v IncognitoModeAvailability /t REG_DWORD /d 1 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v DeveloperToolsAvailability /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v ForceYouTubeRestrict /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v TaskManagerEndProcessEnabled /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs" /v 1 /t REG_SZ /d 1 /f
taskkill /f /im chrome.exe
start chrome --profile-directory="Default"
echo. 
echo.
echo Completed Removing - Press any key to exit. 
pause > nul
exit
:add
cls
echo.
echo.
echo WARNING: 
echo.
echo WHAT YOU ARE ABOUT TO DO IS MODIFY YOUR REGISTRY TO RE-ADD POLICIES. 
echo BY PRESSING ANY KEY, YOU KNOW THAT I AM NOT RESPONSIBLE FOR ANY DAMAGE
echo CAUSED TO YOUR SYSTEM. 
echo.
echo.
pause
cls
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v ForceYouTubeRestrict /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v 1 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" /v 2 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlocklist" /v 1 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\URLBlocklist" /v 1 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v IncognitoModeAvailability /f 
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v DeveloperToolsAvailability /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v ForceYouTubeRestrict /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v TaskManagerEndProcessEnabled /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs" /v 1 /t REG_SZ /d 1 /f
taskkill /f /im chrome.exe
start chrome --profile-directory="Default"
echo.
echo.
echo Completed Adding - Press ay key to exit. 
pause > nul
exit
