## HUSST Datenversorgung SQLite Abbildung

Transformationen der Strukturdefinition in SQLScripte zur Abbildung von HusstDv Daten in eine SQLite Datenbank.

### HUSST_Versorgungsdaten_\<Version>.CreateDBSql.xsl

  Erzeugt ein SQL Script zum Erstellen einer leeren HUSST_Versorgungsdaten_3_5_0.db3 Datenbank 

Xsl Transformations Parameter

|Parameter | Wert / Eclipse Variable | Hinweise|
|---------|---------|---------|
| current_date | ```${current_date}```| aktuelle Datum als Datum der Umsetzung |
| optionals | ```[<OptionalItem> ..]```| Leerzeichen getrennte Liste optionaler Umsetzungen. Zur Zeit nur: husstEnum |


###  HUSST_Versorgungsdaten_\<Version>.CreateDB.sql
- automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank

###  HUSST_Versorgungsdaten_\<Version>.db3
- automatisch generiertes SQLite Datenbank

###  HUSST_Versorgungsdaten_\<Version>.CreateDB.optionals.husstEnum.sql
- automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
  incl. eines Dummy-Zeitraums mit ID_Zeitraum=1 und aller Husst definierter Enumerationen in den DefXxxx Tabellen.

###  HUSST_Versorgungsdaten_\<Version>.db3
- automatisch generiertes SQLite Datenbank incl. eines Dummy-Zeitraums mit ID_Zeitraum=1 und aller Husst definierter Enumerationen in den DefXxxx Tabellen.


Stand: 2024-03-12
Autor: Neubauer(kt)