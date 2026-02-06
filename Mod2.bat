@echo off
set /p Current=< active.txt
echo %Current%


set "BATCH_DIR=%~dp0"

for /F "skip=1 delims=" %%i in (filepath.txt) do set "ModPath=%%i"&goto nextline
:nextline
echo %ModPath%

for /F "skip=2 delims=" %%i in (filepath.txt) do set "EmuPath=%%i"&goto nextline
:nextline
echo %EmuPath%

for /F "skip=3 delims=" %%i in (filepath.txt) do set "RomPath=%%i"&goto nextline
:nextline
echo %RomPath%


RENAME "%ModPath%\Active" "%Current%"

echo Mod2 > active.txt

RENAME "%ModPath%\Mod2" "Active"

start "" "%EmuPath%" "%RomPath%"