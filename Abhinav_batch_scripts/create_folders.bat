@echo off


for /l %%i in (1, 1, 48) do (
    mkdir "Driver_%%i_grayscale"
)

echo Folders created successfully.
