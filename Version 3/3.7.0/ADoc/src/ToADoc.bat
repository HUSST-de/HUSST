@REM @echo off
@REM 
@echo on
@REM generiert die technische Dokumentation aus den .xsd Dateien
@REM via Ascii-Doc
@REM 
@REM Voraussetzung:
@REM   Java               im Pfad erreichbar
@REM   saxon-he-12.5.jar  im CLASSPATH erreichbar - Quelle: https://github.com/Saxonica/Saxon-HE
@REM 
REM == Start: Hauptroutine =============================================
  setlocal enabledelayedexpansion
  call :Setup

  @echo --- transformiere die DV Xsds zu AsciiDoc ---
  @rem 
  call :DvTransXsd Basis
  @rem 
  call :DvTransXsd TarifAngebot
  @rem 
  call :DvTransXsd Vertrieb
  
  
:EarlyExit
  call :TearDown
  endlocal
exit /b
REM == Ende: Hauptroutine =========

REM wandelt eine Husst_DvXxx.xsd in eine DvXxx.adoc Dokumentation
REM %1 = Dv Schema: Basis, TarifAngebot, Vertrieb
:DvTransXsd
  set "Schema=%~1"
  
  @rem 
  %cmdJava% %cmdSaxTrans% -s:%dirXsd%\HUSST_Dv%Schema%_%verHusst_%.xsd  -xsl:%fnXsl% -o:%dirDocDv%\Dv%Schema%.adoc einstiegsebene=3 schema=%Schema% verHusst=%verHusst%
goto :eof

:Setup
  @REM @echo on
  REM Aktuelle Codepage speichern
  for /f "tokens=2 delims=:" %%C in ('chcp') do set OldCP=%%C
  set OldCP=%OldCP: =%
  set OldCP=%OldCP:.=%
  chcp 1252 > nul

  set "dirScript=%~dp0"
  set "cmdJava=java"
  set "cmdSaxTrans=net.sf.saxon.Transform"
  set "fnXsl=Xsl\DvToADoc.xsl"
  REM dirScript = d:\HN\dev\code\git\Husst\Version 3\3.7.0\ADoc\src\
  REM Extrahiere die Versionsnummer aus dem Pfad
  set "dirXsd=..\.."
  set "dirDocDv=Dv"
  for %%A in ("%dirXsd%") do set "verHusst=%%~nxA"
  set "verHusst_=%verHusst:.=_%"

  @REM @echo off  
goto :eof

:TearDown
  REM Ursprüngliche Codepage wiederherstellen
  chcp %OldCP% >nul
goto :eof
