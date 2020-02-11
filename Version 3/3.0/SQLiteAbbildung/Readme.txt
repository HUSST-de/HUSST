HUSST Datenversorgung
Transformationen der Strukturdefinition in SQLScripte und andere Hilfen zur Abbildung von HusstDV Daten in eine SQLite Datenbank.

HUSST_3_00_ToCreateSql.xsl
      Erzeugt ein SQL Script um eine leere HUSST_Versorgungsdaten_3_00 Datenbank 
      zu erstellen.
		globaler Parameter mit dem aktuellen Datum des Aufrufs der Transformation
		wird erwartet im Format YYYYMMDD 

		in Eclipse z.B. in der Run Configuration
		In Transformation Parameters einen Parameter hinzufügen (Add Parameter)
		Name: current_date
		Value: ${current_date} 		

HUSST_Versorgungsdaten_3_00.Create.sql 
         * automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
         * generiert am 2019-09-20


Stand: 2020-02-11
Autor: Neubauer(kt)