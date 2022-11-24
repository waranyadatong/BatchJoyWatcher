@if (@CodeSection == @Batch) @then

@echo off

set "$process=putty.exe"
for %%a in (%$process%) do taskkill /f /im %%a 2>nul

rem Use %SendKeys% to send keys to the keyboard buffer
set SendKeys=CScript //nologo //E:JScript "%~F0"

rem Start the putty window with the user name only
start C:\PuTTY\putty.exe -ssh fujikura@192.168.75.45 -pw 1234

rem Send the password to putty window
%SendKeys% "cd /home/fujikura/Desktop/Product{ENTER}"

%SendKeys% "python CAUZ-175MS-0A.py{ENTER}"
goto :EOF

@end

WScript.CreateObject("WScript.Shell").SendKeys(WScript.Arguments(0));
