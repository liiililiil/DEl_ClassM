@echo off
color 02
title Mclass�������α׷�
mode con cols=80 lines=3

rem ================================================================== ���� �ȳ�

echo ���ݺ��� Mclass ������ �����մϴ�. ������ �����ϸ� �ڵ����� ����˴ϴ�.
timeout 3


rem ================================================================== ���α׷� ����


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

rem ================================================================== ���α׷� ���� �õ�

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


rem ================================================================== �� ���α׷��̶� �������� �����Ǹ� �õ��� �ʱ�ȭ�� �ٽ� ����

:no
set /a n = 0
goto try

rem ==================================================================�õ��� ī��Ʈ, 100ȸ �õ� ������

:find
set /a n = n+1
if "%n%" == "100" goto done
goto try

rem ==================================================================100ȸ �õ��� ����

:done 
color 4f
mode con cols=80 lines=30
echo ���Ḧ �Ϸ��Ͽ����ϴ�. ����� ����˴ϴ�.
timeout 7
exit


rem ==================================================================���� �Ϸ�

:fdone
mode con cols=80 lines=30
color 4f
echo �̹� ��� Mclass ���� ���α׷��� ����� �����Դϴ�. ���α׷��� �����մϴ�.
timeout 7
exit

rem ================================================================== Ȥ�ø� ���� ó��
color 42
mode con cols=80 lines=30
echo ������ �˼����� �ַ��� �߻��ѰŰ����ϴ�! ����� �����մϴ�..
timeout 5
goto try
