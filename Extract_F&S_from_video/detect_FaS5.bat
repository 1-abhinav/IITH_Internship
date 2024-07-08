@echo off

REM Set the path to your Python interpreter
set PYTHON=C:\Users\Jahnavi\AppData\Local\Programs\Python\Python312\python.exe


for %%i in (33,34,35,36,37,38,39,40) do (
   
    %PYTHON% detect_all.py "F:\Downloads\Driver_%%i_FSG.mp4" "F:\Downloads\Driver_%%i_all_circles.csv"
)

echo All videos processed.
pause