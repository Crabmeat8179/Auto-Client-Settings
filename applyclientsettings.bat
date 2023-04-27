@echo off

REM Download the file from the given link
set url=https://cdn.discordapp.com/attachments/709125697460764725/1101204815633190912/ClientAppSettings.json
set filename=ClientAppSettings.json
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%filename%')"

REM Navigate to the most up-to-date Roblox folder
set "versions_folder=%LOCALAPPDATA%\Roblox\Versions"
for /f "delims=" %%a in ('dir /b /ad /o-n "%versions_folder%"') do (
    set "most_recent_folder=%%a"
    goto :break
)
:break

REM Create the ClientSettings folder and move the downloaded file
set "client_settings_folder=%versions_folder%\%most_recent_folder%\ClientSettings"
if not exist "%client_settings_folder%" mkdir "%client_settings_folder%"
move "%filename%" "%client_settings_folder%"
