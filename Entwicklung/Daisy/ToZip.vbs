' (c) 2018 Krauth Technology, Eberbach
'
' Packt alle Dateien mit 7z.exe in ein .zip-Archiv mit dem aktuellen Zeitpunkt im Dateinamen
'
' Autor: Horst P.W. Neubauer
'
' Liefert den String Wert zurück, 
' ggf. um eine führende Null ergänzt, wenn der Wert nur ein Zeichen lang ist
function Null10er(Wert)
  if len(Wert) = 1 then 
    Null10er = "0" & Wert
  else
    Null10er = Wert
  end if
end function

' Shell einrichten
Set wshshell = WScript.CreateObject ("wscript.shell")

' Dateiname erzeugen
' HUSST3.0-yyyy-mm-dd-hh-nn.zip
FN = "HUSST3.0-" & year(now) & "-" & Null10er(month(now)) & "-" & Null10er(day(now)) & "-" & Null10er(hour(now)) & "-" & Null10er(minute(now)) & ".zip"

' Archiv erstellen
' -tzip: als .zip Archiv
' -r: rekursiv
' -x!*.zip ohne herumliegende .zip Archive
cmd = "7z.exe -tzip -r -x!*.zip a " & FN & " *.*"
wshshell.Run cmd, 7, True