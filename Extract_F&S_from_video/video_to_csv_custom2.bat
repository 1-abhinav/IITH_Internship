@echo off

REM Set the path to your Python interpreter
set PYTHON=C:\Users\Jahnavi\AppData\Local\Programs\Python\Python312\python.exe

for %%i in (42) do (
	for %%j in (1,2,3,4,5,6,7,8) do (
		%PYTHON% detect_saccades.py "F:\Downloads\Driver_%%i_FSG_%%j.mp4" "F:\Downloads\Driver_%%i_saccades_%%j.csv"
	)
)

echo All videos processed.
pause
