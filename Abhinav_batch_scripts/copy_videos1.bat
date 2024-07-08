@echo off
setlocal enabledelayedexpansion

set "source_root=C:\ProgramData\iMotions\Lab_XG\Data"
set "target_root=D:\Original_All"

for /l %%d in (11, 1, 20) do (
    set "source_folder=%source_root%\Driver No.%%d (Ankit's data)\Capture"
    set "target_folder=%target_root%\Driver_%%d_original"
    
    echo Processing Driver %%d
    echo Source folder: "!source_folder!"
    echo Target folder: "!target_folder!"
    
    if not exist "!target_folder!" mkdir "!target_folder!"
    
    if exist "!source_folder!\*.wmv" (
        for %%f in ("!source_folder!\*.wmv") do (
            set "target_file=!target_folder!\%%~nxf"
            
            if exist "!target_file!" (
                echo File "%%~nxf" already exists in %%d folder.
            ) else (
                copy "%%f" "!target_folder!\" > nul
                echo Copied "%%~nxf" to %%d folder.
            )
        )
    ) else (
        echo No .wmv files found in %%d folder.
    )
)

echo Video files copied successfully.
