cd %SRC_DIR%
rem C:\cygwin\bin\unzip Blitz-VS2005.NET.zip
rem powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('Blitz-VS2005.NET.zip', ''); }"
rem cd Blitz-VS2005.NET

7z x Blitz-VS2010.zip -oBlitz-VS2010 -aoa

set SLN_FILE=Blitz-Library.sln
set SLN_CFG=Release
if "%ARCH%"=="32" (set SLN_PLAT=Win32) else (set SLN_PLAT=x64)

REM Build step
msbuild "%SLN_FILE%"
rem devenv "%SLN_FILE%" /Build "%SLN_CFG%|%SLN_PLAT%"
if errorlevel 1 exit 1
