# Folder 3.Personaldaten

## Anforderungen

In diesem Folder entsteht eine neue Husst V3 Version.
Die soll den folgenden Issue lösen: https://github.com/HUSST-de/HUSST/issues/45:

>In Husst 2 waren Personaldaten Bestandteil der Husst Versorgungsdaten.
>
>In Husst 3 sind diese rausgeflogen, da keine Anwendung bekannt war, die diese nutzt.
>
>Nun wurde herangetragen, dass diese Daten doch genutzt werden.
>
>Idee: Eigenen XSDs um Tabellen für Personaldaten von den Tarifdaten zu trennen.

In der anschließenden Diskussion wurde mehrheitlich gewünscht, dass die bestehende HUSST_Versorgungsdaten_3*.xsd aufgeteilt wird in eine Basisdefintion und eine Tarif-/Angebotdefinition und diesen beiden eine dritte Personaldefinition zur Seite gestellt wird. Damit beginnen wir auf Versorungsdatenseite mit der Modularisierung der Datendefinition.

## Modularisierung 

|Modulname|Beschreibung|
|---------|------------|
|HUSST_Basisversorgungsdaten<Versionskennung>.xsd| fachlich unspezifische Datenstrukturen |
|HUSST_Vertriebsversorgungsdaten<Versionskennung>.xsd| Tarif und Angebot |
|HUSST_Personalversorgungsdaten<Versionskennung>.xsd| Personaldaten |
