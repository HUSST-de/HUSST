REM 
REM importiert aus einer Husst-Version 3.x.y alle .xsd Dateien nach resources
REM und bereitet sie für die Überarbeitung als _Personal.... Daten vor
REM 
REM === START MAIN ===========================================
:Main
setlocal EnableDelayedExpansion EnableExtensions
  chcp 1252 >nul & REM Ausgabe in Ansi Zeichen
  SET "vMajor=3"
  SET "vMinor=5"
  SET "vFixit=0"
  SET "vUl=%vMajor%_%vMinor%_%vFixit%"
  SET "vDot=%vMajor%.%vMinor%.%vFixit%"
  
  SET "pUl=%vMajor%_Personal"
  SET "pDot=%vMajor%_Personal"
  
  SET "pDirRes=..\resources"
  SET "pDirWork=..\work"
  
  
  SET "vDir=..\..\%vDot%"
  SET "vfnApi=HUSST_Appinfo_%vUl%.xsd"
  SET "vfnDv=HUSST_Versorgungsdaten_%vUl%.xsd"
  SET "vfnErg=HUSST_Ergebnisdaten_%vUl%.xsd"
  SET "vfnDv2=HUSST_Versorgungsdaten_2_47.xsd"
  
  SET "pfnDvBasis=HUSST_DvBasis_%pUl%.xsd"
  SET "pfnDvTarif=HUSST_DvTarifAngebot_%pUl%.xsd"
  SET "pfnDvPers=HUSST_DvVetriebsakteure_%pUl%.xsd"
  
  SET "fnDvSed=addHUSST_Versorgungsdaten_Base.sed"
  SET "fnSplitXsl=SplitHusst_Versorgungsdaten.xsl"
  
  
  sed -r -e"s/%vUl%/%pUl%/;s/%vDot%/%pDot%/" "%vDir%\%vfnApi%"                       >"%pDirRes%\%vfnApi%"
  sed -r -e"s/%vUl%/%pUl%/;s/%vDot%/%pDot%/" "%vDir%\%vfnErg%"                       >"%pDirRes%\%vfnErg%"
  sed -r -e"s/%vUl%/%pUl%/;s/%vDot%/%pDot%/" "%vDir%\%vfnDv%"  | sed -r -f%fnDvSed%  >"%pDirRes%\%vfnDv%"

  call :transform "%pDirRes%\%vfnDv%"  "%fnSplitXsl%" "%pDirWork%\%pfnDvBasis%"
  call :transform "%pDirRes%\%vfnDv%"  "%fnSplitXsl%" "%pDirWork%\%pfnDvTarif%" Versorgung
  call :transform "%pDirRes%\%vfnDv2%" "%fnSplitXsl%" "%pDirWork%\%pfnDvPers%" Personal
  
  REM sed -r -faddHUSST_Versorgungsdaten_Base.sed ..\resources\%vfnDv% >test.xsd

  REM Zeile 7634
  
:EarlyExit
endlocal
goto :eof
REM === Ende MAIN ===========================================


:transform
setlocal EnableDelayedExpansion EnableExtensions
  SET "fnSource=%~1"
  SET "fnXsl=%~2"
  SET "fnDest=%~3"
  SET "param=xsd=Basis"
  IF NOT "%4"=="" SET "param=xsd=%~4"
  
  java net.sf.saxon.Transform -s:"%fnSource%" -xsl:"%fnXsl%" "%param%" | sed -r -e":l;s/(<xs:schema[^\n]*) +([^\s\n]+)/\1\n  \2/;tl;s/ +(<\/xs:schema>)/\1/" >"%fnDest%"
endlocal
goto :eof