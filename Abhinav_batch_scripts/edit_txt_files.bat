@echo off
setlocal enabledelayedexpansion

set "DIR=E:\downloads\trafik_isik_projesi.v2i.yolov8\valid\labels"

for %%F in ("%DIR%\*.txt") do (

    set "TEMP_FILE=%%~dpnF_temp.txt"
    
    > "!TEMP_FILE!" (
        for /f "delims=" %%L in (%%F) do (
            set "LINE=%%L"
            echo 3!LINE:~1!
        )
    )
    
    move /Y "!TEMP_FILE!" "%%F" >nul
)

endlocal
