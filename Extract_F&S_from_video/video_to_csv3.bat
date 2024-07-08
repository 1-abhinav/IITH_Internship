@echo off

REM Set the path to your Python interpreter
set PYTHON=C:\Users\Jahnavi\AppData\Local\Programs\Python\Python312\python.exe

for %%i in (17,18,19,20,21,22,23,24) do (
   
    %PYTHON% detect_saccades.py "F:\Downloads\Driver_%%i_FSG.mp4" "F:\Downloads\Driver_%%i_saccades.csv"
)

echo All videos processed.
pause
