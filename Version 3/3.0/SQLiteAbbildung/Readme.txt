HUSST Datenversorgung
Transformationen der Strukturdefinition in SQLScripte und andere Hilfen zur Abbildung von HusstDV Daten in eine SQLite Datenbank.

HUSST_Cindy2CreateSql.xsl
      Erzeugt ein SQL Script um eine leere HUSST_Versorgungsdaten_Cindy Datenbank 
      zu erstellen.
		globaler Parameter mit dem aktuellen Datum des Aufrufs der Transformation
		wird erwartet im Format YYYYMMDD 

		in Eclipse z.B. in der Run Configuration
		In Transformation Parameters einen Parameter hinzufügen (Add Parameter)
		Name: current_date
		Value: ${current_date} 		

HUSST_Versorgungsdaten_Cindy.Create.sql 
         * automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
         * generiert am 2019-09-20


Stand: 2019-09-20
Autor: Neubauer(kt)