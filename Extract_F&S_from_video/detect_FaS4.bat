@echo off

REM Set the path to your Python interpreter
set PYTHON=C:\Users\Jahnavi\AppData\Local\Programs\Python\Python312\python.exe


for %%i in (25,26,27,28,29,30,31,32) do (
   
    %PYTHON% detect_all.py "F:\Downloads\Driver_%%i_FSG.mp4" "F:\Downloads\Driver_%%i_all_circles.csv"
)

echo All videos processed.
pause