rem by AccaEmme

@echo off
setlocal && set "pad=000000000000000" && set "NeededSpace=%pad%4294967296" && for /f "delims== tokens=2" %%x in (  'wmic logicaldisk where "DeviceID='C:'" get FreeSpace /format:value' ) do for %%y in (%%x) do set "FreeSpace=%pad%%%y"
setlocal && set "pad=000000000000000" && for /f "delims== tokens=2" %%x in (  'wmic logicaldisk where "DeviceID='C:'" get Size /format:value' ) do for %%y in (%%x) do set "TotalSize=%%y"

set /a TotalSize=%TotalSize:~0,-6% / (1074)

rem minimum percentage free space 10%
set /a NeededSpace=%TotalSize% * (100-10)/100

set /a FreeSpace=%FreeSpace:~0,-6% / (1074)

echo TotalSize: %TotalSize% - NeededSpace: %NeededSpace% GB - FreeSpace: %FreeSpace% GB

if "%FreeSpace%" leq "%NeededSpace%" echo "No enought disk space"
pause

