@echo off
setlocal EnableDelayedExpansion

set "original_path=D:\Original_All"
set "grayscale_path=D:\grayscale_All"

for /L %%i in (41,1,48) do (
    set "driver=Driver_%%i"

   

    set "original_driver_folder=%original_path%\!driver!_original"
    set "grayscale_driver_folder=%grayscale_path%\!driver!_grayscale"

    if not exist "!grayscale_driver_folder!" (
        mkdir "!grayscale_driver_folder!"
    )

    for %%f in ("!original_driver_folder!\*.wmv") do (
        set "original_video=%%f"
        set "video_name=%%~nf"
        set "grayscale_video=!grayscale_driver_folder!\!video_name!.wmv"

        ffmpeg -i "!original_video!" -vf format=gray -c:v wmv2 -b:v 5000k "!grayscale_video!"
    )
)

endlocal
echo Conversion complete!
pause
