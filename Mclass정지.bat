@echo off
color 02
title Mclass차단프로그램
mode con cols=80 lines=3

rem ================================================================== 유저 안내

echo 지금부터 Mclass 삭제를 시작합니다. 삭제를 성공하면 자동으로 종료됩니다.
timeout 3


rem ================================================================== 프로그램 감지


taskkill /t /f /im hscagent.exe> nul
if NOT "%errorlevel%" == "128" goto try

taskkill /t /f /im mvnc.exe> nul
if NOT "%errorlevel%" == "128" goto try

taskkill /t /f /im hscrelay.exe> nul
if NOT "%errorlevel%" == "128" goto try

taskkill /t /f /im hscdm.exe> nul
if NOT "%errorlevel%" == "128" goto try

taskkill /t /f /im hscfm.exe> nul
if NOT "%errorlevel%" == "128" goto try
if "%errorlevel%" == "128" goto fdone

rem ================================================================== 프로그램 삭제 시도

:try
mode con cols=80 lines=1

taskkill /t /f /im hscagent.exe> nul
if NOT "%errorlevel%" == "128" goto no

taskkill /t /f /im mvnc.exe> nul
if NOT "%errorlevel%" == "128" goto no

taskkill /t /f /im hscrelay.exe> nul
if NOT "%errorlevel%" == "128" goto no

taskkill /t /f /im hscdm.exe> nul
if NOT "%errorlevel%" == "128" goto no

taskkill /t /f /im hscfm.exe> nul
if NOT "%errorlevel%" == "128" goto no
if "%errorlevel%" == "128" goto find
goto try


rem ================================================================== 한 프로그램이라도 꺼진것이 감지되면 시도수 초기화후 다시 실행

:no
set /a n = 0
goto try

rem ==================================================================시도수 카운트, 100회 시도 감지문

:find
set /a n = n+1
if "%n%" == "100" goto done
goto try

rem ==================================================================100회 시도후 종료

:done 
color 4f
mode con cols=80 lines=30
echo 종료를 완료하였습니다. 잠시후 종료됩니다.
timeout 7
exit


rem ==================================================================선제 완료

:fdone
mode con cols=80 lines=30
color 4f
echo 이미 모든 Mclass 관련 프로그램이 종료된 상태입니다. 프로그램을 종료합니다.
timeout 7
exit

rem ================================================================== 혹시모를 오류 처리
color 42
mode con cols=80 lines=30
echo 이유를 알수없는 애러가 발생한거같습니다! 잠시후 복귀합니다..
timeout 5
goto try
