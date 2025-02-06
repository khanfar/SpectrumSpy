@echo off

mkdir tmp

echo Downloading RTLSDR Driver
httpget http://osmocom.org/attachments/download/2242/RelWithDebInfo.zip tmp\RelWithDebInfo.zip

echo Downloading Zadig
set zadig_exe=v1.3.0/zadig-2.3.exe
ver | findstr /l "5.1." > NUL
if %errorlevel% equ 0 set zadig_exe=v1.2.5/zadig_xp-2.2.exe
httpget http://github.com/pbatard/libwdi/releases/download/%zadig_exe% zadig.exe

unzip -o tmp\RelWithDebInfo.zip -d tmp
move tmp\rtl-sdr-release\x32\rtlsdr.dll .

rmdir tmp /S /Q
