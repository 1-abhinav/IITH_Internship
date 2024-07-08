@echo off

REM Set the path to your Python interpreter
set PYTHON=C:\Users\Jahnavi\AppData\Local\Programs\Python\Python312\python.exe

for %%i in (9,10,11,12,13,14,15,16) do (
   
    %PYTHON% detect_saccades.py "F:\Downloads\Driver_%%i_FSG.mp4" "F:\Downloads\Driver_%%i_saccades.csv"
)

echo All videos processed.
pause
