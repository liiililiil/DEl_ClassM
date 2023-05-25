
@echo off
color 02
title Mclass통합 프로그램
mode con cols=80 lines=3

set "target_program=hscagent.exe"
set "netclass=client32.exe"


================================== netclass 감지

tasklist | findstr /i "%netclass%"
if  "%errorlevel%" == "0" goto neterror

rem ================== 차단우회

pushd "C:\Program Files (x86)\ClassM"

ren hscagent.exe no.exe

popd 

rem ================================================================== 유저 감지

tasklist | findstr /i "%target_program%"
if  "%errorlevel%" == "1" goto open
goto try


rem ================================================================== 프로그램 열기
:open

pushd "C:\Program Files (x86)\ClassM"
ren no.exe hscagent.exe
if  "%errorlevel%" == "1" goto nonerror
start hscagent.exe
popd

color 2f
mode con cols=80 lines=30
echo Mclass 실행을 완료하였습니다. 잠시후 통합 프로그램이 종료됩니다.
timeout 7
exit

rem ================================================================== 프로그램 삭제 시도

:try

mode con cols=80 lines=1

taskkill /t /f /im hscagent.exe
if NOT "%errorlevel%" == "128" goto no
goto find



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

color 2f
mode con cols=80 lines=30
echo Mclass 종료를 완료하였습니다. 잠시후 통합 프로그램이 종료됩니다.
timeout 7
exit

rem ==================================================================Mclass 없음
:nonerror
color 40
mode con cols=80 lines=30
echo 이 컴퓨터 혹은 환경은 Mclass가 없는거 같습니다.
timeout 3
exit

rem ==================================================================Netclass 환경
:neterror
color fc
mode con cols=80 lines=30
echo Netclass가 있는 컴퓨터 혹은 환경은 동작하지 않습니다.
timeout 3
exit
