@echo off
setlocal enabledelayedexpansion

set "folder1=E:\downloads\detected_frames (1)"
set "folder2=E:\downloads\not_detected_frames (1)"

for %%f in ("%folder1%\*.png") do (
    set "file=%%~nxf"
    if exist "%folder2%\!file!" (
        del "%folder2%\!file!"
        echo Deleted "%folder2%\!file!"
    )
)

endlocal
