@echo off
setlocal enabledelayedexpansion

:: Define the directory where the folders are located
set "source_dir=C:\Users\Abhinav\Desktop\Original_videos"

:: Change to the source directory
cd /d "%source_dir%"

:: Loop through numbers 1 to 49
for /L %%i in (1,1,10) do (
    :: Define the folder name and ZIP file name
    set "folder_name=Driver_%%i_original"
    set "zip_name=Driver_%%i_original.zip"
    
    :: Check if the folder exists
    if exist "!folder_name!" (
        :: Compress the folder into a ZIP file
        powershell -command "Compress-Archive -Path '!folder_name!' -DestinationPath '!zip_name!'"
        echo Compressed !folder_name! into !zip_name!
    ) else (
        echo Folder !folder_name! does not exist.
    )
)

echo Compression complete!
pause
