/************************************************************************************
* HUSST Versorgungsdaten
*
* automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
* generiert am 2019-09-20
*
* HUSST Cindy (V 3.0 - in Arbeit vom 2019-09-20 )
*
*************************************************************************************/

CREATE TABLE Bearbeitung(
	Bearbeitungsdatum                   datetime NOT NULL, 
	Lieferant                           string NOT NULL, 
	Kommentar                           string,
	PRIMARY KEY(Bearbeitungsdatum ASC, Lieferant ASC));

CREATE TABLE Bediengebiete(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Bediengebiet                     largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Bediengebiet ASC, ID_Zeitraum ASC));

CREATE TABLE DefBundeslaender(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Bundesland                       largeint NOT NULL, 
	Iso                                 string, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Bundesland ASC, ID_Zeitraum ASC));

CREATE TABLE DefFahrgasttypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Fahrgasttyp                      largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Fahrgasttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefKomfortklassen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Komfortklasse                    largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Komfortklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefNachbarhaltestellenbeziehungen(
	Deaktiviert                         bit, 
	ID_Nachbarhaltestellenbeziehung     largeint NOT NULL, 
	ID_Zeitraum                         largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Nachbarhaltestellenbeziehung ASC, ID_Zeitraum ASC));

CREATE TABLE DefOrtspunkttypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Ortspunkttyp                     largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Ortspunkttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefOTPTypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_OTPTyp                           largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_OTPTyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisfindungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Preisfindung                     largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Preisfindung ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisquellen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Preisquelle                      largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisquelle ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisspaltentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Preisspaltentyp                  largeint NOT NULL, 
	Kennung                             string, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisspaltentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefRabattklassen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Rabattklasse                     largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Rabattklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefReisetypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Reisetyp                         largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Reisetyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationenberechnungsregelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relationenberechnungsregelung    largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Relationenberechnungsregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationendruckregelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relationendruckregelung          largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Relationendruckregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationscodegruppentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relcodegruppentyp                largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Relcodegruppentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortenausgaberegelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sortenausgaberegelung            largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Sortenausgaberegelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortendruckregelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sortendruckregelung              largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Sortendruckregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortengruppentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sortengruppentyp                 largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Sortengruppentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortenklassen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sortenklasse                     largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Sortenklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sortentyp                        largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Sortentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefTarifpunkttypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tarifpunkttyp                    largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifpunkttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefVertriebswege(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Vertriebswege                    largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Vertriebswege ASC, ID_Zeitraum ASC));

CREATE TABLE DefWaehrungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Waehrung                         largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Waehrung ASC, ID_Zeitraum ASC));

CREATE TABLE DefZahlungsarten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Zahlungsarten                    largeint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Zahlungsarten ASC, ID_Zeitraum ASC));

CREATE TABLE Feiertage(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Feiertag                         largeint NOT NULL, 
	ID_Bundesland                       largeint NOT NULL, 
	Datum                               datetime NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Feiertag ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Feiertage ON Feiertage(Datum ASC, ID_Bundesland ASC, ID_Zeitraum ASC);

CREATE TABLE Interpretationen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	Interpretationsschluessel           string NOT NULL, 
	Wert                                string,
	PRIMARY KEY(Interpretationsschluessel ASC, ID_Zeitraum ASC));

CREATE TABLE Kalender(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Betriebstag                      datetime NOT NULL, 
	ID_Betriebstagesart                 largeint NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Betriebstag ASC, ID_Zeitraum ASC));

CREATE TABLE Linien(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Linie                            largeint NOT NULL, 
	ID_Weg_Hin                          largeint NOT NULL, 
	ID_Weg_Rueck                        largeint, 
	Bezeichnung                         string, 
	ID_Konzessionaer                    largeint, 
	ID_Bediengebiet                     largeint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Linie ASC, ID_Zeitraum ASC));

CREATE TABLE Mwst(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Mwst                             largeint NOT NULL, 
	MwstSatz                            real, 
	Bezeichnung                         string, 
	ReferenzExtern                      string, 
	KA_Mwst                             largeint,
	PRIMARY KEY(ID_Mwst ASC, ID_Zeitraum ASC));

CREATE TABLE Nachbarhaltestellen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Nachbarhaltestelle               largeint NOT NULL, 
	ID_Bediengebiet                     largeint, 
	ID_Nachbarhaltestellenbeziehung     largeint, 
	ID_OrtspunktVon                     largeint NOT NULL, 
	ID_OrtspunktNach                    largeint NOT NULL, 
	SortOrder                           largeint, 
	ID_Via                              largeint, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	ID_Preisstufe                       largeint NOT NULL, 
	Zahlgrenzen                         largeint NOT NULL,
	PRIMARY KEY(ID_Nachbarhaltestelle ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Nachbarhaltestellen ON Nachbarhaltestellen(ID_OrtspunktVon ASC, ID_OrtspunktNach ASC, ID_Zeitraum ASC);

CREATE TABLE Ortspunkte(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Ortspunkt                        largeint NOT NULL, 
	ID_Ortspunkttyp                     largeint NOT NULL, 
	Ortsnummer                          largeint NOT NULL, 
	ID_Relcode                          largeint NOT NULL, 
	IBISnr                              string, 
	ID_Bundesland                       largeint, 
	Gemeindekennziffer                  string, 
	Bezeichnung                         string, 
	BezeichnungKurz                     string, 
	BezeichnungDruck                    string, 
	ReferenzExtern                      string, 
	ID_Bediengebiet                     largeint, 
	ID_OrtspunktReferenz                largeint, 
	XKoordWgs84                         real, 
	YKoordWgs84                         real,
	PRIMARY KEY(ID_Ortspunkt ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Ortspunkte ON Ortspunkte(Ortsnummer ASC, ID_Ortspunkttyp ASC, ID_Zeitraum ASC);

CREATE TABLE OrtspunkteKA(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Ortspunkt                        largeint NOT NULL, 
	KA_OrtOrgID                         largeint, 
	KA_OrtTyp                           largeint, 
	KA_OrtNummer                        largeint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Ortspunkt ASC, ID_Zeitraum ASC));

CREATE TABLE OrtspunkteTG(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_OrtspunktTG                      largeint NOT NULL, 
	ID_Ortspunkt                        largeint NOT NULL, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	Bezeichnung                         string, 
	BezeichnungKurz                     string, 
	BezeichnungDruck                    string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_OrtspunktTG ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_OrtspunkteTG ON OrtspunkteTG(ID_Ortspunkt ASC, ID_Tarifgebiet ASC, ID_Zeitraum ASC);

CREATE TABLE Preise(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Preis                            largeint NOT NULL, 
	ID_Sorte                            largeint NOT NULL, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	ID_Preisstufe                       largeint NOT NULL, 
	ID_Preisspalte                      largeint NOT NULL, 
	ReferenzExtern                      string, 
	Preis                               largeint, 
	PreisstufenbezeichnungKurz          string, 
	Preisstufenbezeichnung              string, 
	ID_Mwst                             largeint, 
	ID_PreisstufeReferenz               largeint, 
	ID_GueltigkeitszeitRegel            largeint, 
	ID_RaeumlicheGueltigkeit            largeint, 
	KA_ProdOrgID                        largeint, 
	KA_ProdNr                           largeint, 
	KA_Rabatttyp                        largeint, 
	KA_Mitnahme1Typ                     largeint, 
	KA_Mitnahme1MinAnzahl               largeint, 
	KA_Mitnahme1MaxAnzahl               largeint, 
	KA_Mitnahme2Typ                     largeint, 
	KA_Mitnahme2MinAnzahl               largeint, 
	KA_Mitnahme2MaxAnzahl               largeint,
	PRIMARY KEY(ID_Preis ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Preise ON Preise(ID_Preisstufe ASC, ID_Sorte ASC, ID_Preisspalte ASC, ID_Zeitraum ASC);

CREATE TABLE Preisspalten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Preisspalte                      largeint NOT NULL, 
	ID_Waehrung                         largeint NOT NULL, 
	ID_Preisspaltentyp                  largeint, 
	Bezeichnung                         string, 
	BezeichnungKurz                     string, 
	Hinweis                             string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisspalte ASC, ID_Zeitraum ASC));

CREATE TABLE Preisstufen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Preisstufe                       largeint NOT NULL, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	Preisstufennummer                   largeint, 
	ReferenzExtern                      string, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	WegstreckeInMetern                  largeint, 
	ID_Mwst                             largeint, 
	UpgradeStopp                        bit, 
	SortOrder                           largeint NOT NULL, 
	KA_Preisstufe                       largeint NOT NULL,
	PRIMARY KEY(ID_Preisstufe ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Preisstufen ON Preisstufen(Preisstufennummer ASC, ID_Tarifgebiet ASC, ID_Zeitraum ASC);

CREATE TABLE Preisstufendirektwahl(
	Deaktiviert                         bit, 
	ID_Preisstufendirektwahl            largeint NOT NULL, 
	ID_Zeitraum                         largeint NOT NULL, 
	Direktwahlschluessel                string NOT NULL, 
	ID_Tarifart                         largeint NOT NULL, 
	ID_Preisstufe                       largeint NOT NULL, 
	Bezeichnung                         string, 
	BezeichnungDruck                    string, 
	ID_Relation                         largeint, 
	ID_Vertriebswege                    largeint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisstufendirektwahl ASC, ID_Zeitraum ASC));

CREATE TABLE RaeumlicheGueltigkeit(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_RaeumlicheGueltigkeit            largeint NOT NULL, 
	ID_Tarifpunktmenge                  largeint, 
	KA_GueltigkeitsraumOriginaer        string NOT NULL, 
	KA_GueltigkeitsraumAlternativ       string NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_RaeumlicheGueltigkeit ASC, ID_Zeitraum ASC));

CREATE TABLE Relationen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relation                         largeint NOT NULL, 
	ID_RelcodeStart                     largeint NOT NULL, 
	ID_RelcodeZiel                      largeint NOT NULL, 
	SortOrder                           largeint NOT NULL, 
	GegenrichtungLiegtVor               bit, 
	ID_Vertriebswege                    largeint, 
	ID_Via                              largeint, 
	ID_Berechnungsregelung              largeint, 
	ID_Druckregelung                    largeint,
	PRIMARY KEY(ID_Relation ASC, ID_Zeitraum ASC));

CREATE TABLE Relationscodegruppen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relcodegruppentyp                largeint NOT NULL, 
	ID_Relcodegruppe                    largeint NOT NULL, 
	Gruppennummer                       largeint NOT NULL, 
	ID_Relcode                          largeint NOT NULL,
	PRIMARY KEY(ID_Relcodegruppe ASC, ID_Zeitraum ASC));

CREATE TABLE Relationscodes(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relcode                          largeint NOT NULL, 
	ID_Tarifpunkt                       largeint NOT NULL,
	PRIMARY KEY(ID_Relcode ASC, ID_Zeitraum ASC, ID_Tarifpunkt ASC));

CREATE TABLE Relationszuordnungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Relationszuordung                largeint NOT NULL, 
	ID_Relation                         largeint NOT NULL, 
	ID_Teilrelation                     largeint NOT NULL, 
	Sortorder                           largeint NOT NULL,
	PRIMARY KEY(ID_Relationszuordung ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Relationszuordnungen ON Relationszuordnungen(ID_Teilrelation ASC, ID_Relation ASC, ID_Relationszuordung ASC, ID_Zeitraum ASC);

CREATE TABLE Sorten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sorte                            largeint NOT NULL, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	ID_Sortenklasse                     largeint NOT NULL, 
	ReferenzExtern                      string, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	ID_Ausgaberegelung                  largeint, 
	ID_Druckregelung                    largeint, 
	Layout                              string, 
	ID_Vertriebswege                    largeint, 
	ID_Mwst                             largeint, 
	ID_Zahlungsarten                    largeint, 
	ID_Komfortklasse                    largeint, 
	ID_Rabattklasse                     largeint, 
	ID_Fahrgasttyp                      largeint, 
	ID_Sortentyp                        largeint, 
	Mindestpersonenanzahl               largeint, 
	Hoechstpersonenanzahl               largeint, 
	ID_GueltigkeitszeitRegel            largeint, 
	ID_Preisfindung                     largeint, 
	ID_Reisetyp                         largeint, 
	BezeichnungDruck                    string, 
	KA_ProdOrgID                        largeint, 
	KA_ProdNr                           largeint, 
	KA_Infotext                         string, 
	KA_Fahrgasttyp                      largeint, 
	KA_Verkehrsmittel                   largeint, 
	KA_Serviceklasse                    largeint,
	PRIMARY KEY(ID_Sorte ASC, ID_Zeitraum ASC));

CREATE TABLE Sortengruppen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sortengruppe                     largeint NOT NULL, 
	Sortengruppennummer                 largeint NOT NULL, 
	ID_Sortengruppentyp                 largeint NOT NULL, 
	ID_Bediengebiet                     largeint NOT NULL, 
	SortOrder                           largeint NOT NULL, 
	Bezeichnung                         string, 
	TarifInfo                           string, 
	ID_Sorte                            largeint NOT NULL, 
	ID_Preisstufe                       largeint,
	PRIMARY KEY(ID_Sortengruppe ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Sortengruppen ON Sortengruppen(Sortengruppennummer ASC, ID_Sortengruppentyp ASC, ID_Bediengebiet ASC, SortOrder ASC, ID_Zeitraum ASC);

CREATE TABLE SortenTarifarten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Sorte                            largeint NOT NULL, 
	ID_Tarifart                         largeint NOT NULL,
	PRIMARY KEY(ID_Sorte ASC, ID_Tarifart ASC, ID_Zeitraum ASC));

CREATE TABLE Tagesarten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Betriebstagesart                 largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Betriebstagesart ASC, ID_Zeitraum ASC));

CREATE TABLE TagesartMerkmalElemente(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_TagesartMerkmalElement           largeint NOT NULL, 
	ID_Betriebstagesart                 largeint NOT NULL, 
	ID_TagesmerkmalElement              largeint NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_TagesartMerkmalElement ASC, ID_Zeitraum ASC));

CREATE TABLE Tagesmerkmale(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tagesmerkmal                     largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tagesmerkmal ASC, ID_Zeitraum ASC));

CREATE TABLE TagesmerkmalElemente(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_TagesmerkmalElement              largeint NOT NULL, 
	ID_Tagesmerkmal                     largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_TagesmerkmalElement ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_TagesmerkmalElemente ON TagesmerkmalElemente(ID_Tagesmerkmal ASC, Bezeichnung ASC, ID_Zeitraum ASC);

CREATE TABLE Tarifarten(
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tarifart                         largeint NOT NULL, 
	Bezeichnung                         string, 
	ID_Tarifgebiet                      largeint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifart ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifgebiete(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	Erstellungsdatum                    datetime, 
	Version                             string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifgebiet ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifpunkte(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tarifpunkt                       largeint NOT NULL, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	ID_Tarifpunkttyp                    largeint, 
	Bezeichnung                         string, 
	BezeichnungDruck                    string, 
	ID_TarifpunktReferenz               largeint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifpunkt ASC, ID_Zeitraum ASC));

CREATE TABLE TarifpunktmengeElemente(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_TarifpunktmengeElement           largeint NOT NULL, 
	ID_Tarifpunktmenge                  largeint NOT NULL, 
	ID_Tarifpunkt                       largeint NOT NULL, 
	SortOrder                           largeint,
	PRIMARY KEY(ID_TarifpunktmengeElement ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifpunktmengen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tarifpunktmenge                  largeint NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifpunktmenge ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifrelevantepunkte(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Tarifrelevanterpunkt             largeint NOT NULL, 
	ID_OTPTyp                           largeint NOT NULL, 
	ID_Bediengebiet                     largeint NOT NULL, 
	Bezeichnung                         string NOT NULL, 
	SortOrder                           largeint NOT NULL, 
	ID_Relcode                          largeint, 
	ID_Bundesland                       largeint, 
	ID_Ortsnummer                       largeint, 
	ID_Sortengruppe                     largeint, 
	Standortwahl_ID_Bediengebiet        largeint, 
	ID_TarifrelevanterpunktReferenz     largeint,
	PRIMARY KEY(ID_Tarifrelevanterpunkt ASC, ID_Zeitraum ASC));

CREATE TABLE Teilrelationen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Teilrelation                     largeint NOT NULL, 
	ID_Tarifart                         largeint NOT NULL, 
	ID_TarifpunktStart                  largeint NOT NULL, 
	TarifpunktbezeichnungStart          string, 
	ID_TarifpunktZiel                   largeint NOT NULL, 
	TarifpunktbezeichnungZiel           string, 
	ID_Tarifgebiet                      largeint NOT NULL, 
	ID_Preisstufe                       largeint NOT NULL, 
	ID_Preisquelle                      largeint, 
	ID_Komfortklasse                    largeint, 
	AlternativePreisGruppe              largeint, 
	EinnahmeAufteilung                  string, 
	ViabezeichnungDruck                 string, 
	ViabezeichnungRueckDruck            string, 
	ID_RaeumlicheGueltigkeit            largeint, 
	ID_RaeumlicheGueltigkeit_Rueck      largeint, 
	ID_Linie                            largeint, 
	ReferenzExtern                      string NOT NULL,
	PRIMARY KEY(ID_Teilrelation ASC, ID_Zeitraum ASC));

CREATE TABLE Unternehmen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Unternehmen                      largeint NOT NULL, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	Mandant                             bit, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Unternehmen ASC, ID_Zeitraum ASC));

CREATE TABLE Updateinfo(
	Updatetime                          datetime, 
	Filename                            string NOT NULL, 
	Purpose                             string,
	PRIMARY KEY(Updatetime ASC, Filename ASC));

CREATE TABLE VersionInhalt(
	DatenversionInhalt                  string NOT NULL, 
	Testdaten                           bit, 
	Erstellungsdatum                    datetime NOT NULL, 
	Lieferant                           string NOT NULL, 
	Kommentar                           string,
	PRIMARY KEY(DatenversionInhalt ASC, Erstellungsdatum ASC, Lieferant ASC));

CREATE TABLE VersionStruktur(
	VersionMajor                        largeint, 
	VersionMinor                        largeint, 
	Status                              string, 
	Aenderungsdatum                     datetime, 
	Aenderungsautor                     string);

CREATE TABLE Vias(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Via                              largeint NOT NULL, 
	Bezeichnung                         string, 
	BezeichnungDruck                    string, 
	BezeichnungRueck                    string, 
	BezeichnungRueckDruck               string,
	PRIMARY KEY(ID_Via ASC, ID_Zeitraum ASC));

CREATE TABLE Wege(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Weg                              largeint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Weg ASC, ID_Zeitraum ASC));

CREATE TABLE Wegpositionen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Wegposition                      largeint NOT NULL, 
	ID_Weg                              largeint NOT NULL, 
	SortOrder                           largeint NOT NULL, 
	ID_Ortspunkt                        largeint, 
	ID_Bediengebiet                     largeint, 
	Entfernung                          largeint, 
	Fangbereich                         largeint,
	PRIMARY KEY(ID_Wegposition ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Wegpositionen ON Wegpositionen(ID_Weg ASC, SortOrder ASC, ID_Zeitraum ASC);

CREATE TABLE Zeitraeume(
	ID_Zeitraum                         largeint NOT NULL, 
	ZeitraumVon                         datetime, 
	ZeitraumBis                         datetime, 
	DatenversionZeitraum                string NOT NULL, 
	HauptZeitraumNr                     largeint NOT NULL, 
	SubZeitraumNr                       largeint NOT NULL,
	PRIMARY KEY(ID_Zeitraum ASC));

CREATE TABLE Zeitraumoptionen(
	ID_Zeitraum                         largeint NOT NULL, 
	Option                              string NOT NULL, 
	Wert                                string,
	PRIMARY KEY(Option ASC, ID_Zeitraum ASC));

CREATE TABLE Zusatzsorten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         largeint NOT NULL, 
	ID_Zusatzsorte                      largeint NOT NULL, 
	ID_Sorte                            largeint NOT NULL, 
	ZuordnungRelCodeGrp                 Varchar(1) NOT NULL, 
	Anbindung                           Varchar(1), 
	Zusatzsortentyp                     largeint, 
	ID_Preisstufe                       largeint, 
	ID_PreisstufeGrenze                 largeint, 
	Hinweistext                         string, 
	ID_SortengruppeHauptsorten          largeint, 
	ID_RelcodegruppeStart               largeint, 
	ID_RelcodegruppeZiel                largeint, 
	Direktverkauf                       bit NOT NULL,
	PRIMARY KEY(ID_Zusatzsorte ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Zusatzsorten ON Zusatzsorten(ID_Sorte ASC, ZuordnungRelCodeGrp ASC, ID_Zeitraum ASC);

CREATE TABLE DynAttributDef(
	ID_DynAttributDef                   largeint NOT NULL, 
	Name                                string NOT NULL, 
	DynAttributTyp                      string NOT NULL,
	PRIMARY KEY(ID_DynAttributDef ASC));

CREATE TABLE DynAttributWert(
	ID_Zeitraum                         largeint NOT NULL, 
	ID_DynAttributDef                   largeint NOT NULL, 
	Tabellennummer                      largeint NOT NULL, 
	ID_DatensatzRef                     largeint NOT NULL, 
	Wert                                string NOT NULL,
	PRIMARY KEY(ID_Zeitraum ASC, ID_DynAttributDef ASC, Tabellennummer ASC, ID_DatensatzRef ASC));

CREATE TABLE Sprachtexte(
	ID_Sprachtext                       string NOT NULL, 
	Lang                                Varchar(2) NOT NULL, 
	Text                                string,
	PRIMARY KEY(ID_Sprachtext ASC, Lang ASC));

CREATE TABLE Tabelleninfo(
	Tabellenname                        string NOT NULL, 
	Tabellennummer                      largeint NOT NULL, 
	Strukturname                        string,
	PRIMARY KEY(Tabellennummer ASC));

INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Bediengebiete", 1, "Bediengebiete_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefBundeslaender", 2, "DefBundesland_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefFahrgasttypen", 3, "DefFahrgasttyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefKomfortklassen", 4, "DefKomfortklasse_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefOrtspunkttypen", 5, "DefOrtspunkttyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefOTPTypen", 6, "DefOTPTyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefPreisfindungen", 7, "DefPreisfindung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefPreisquellen", 8, "DefPreisquelle_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefPreisspaltentypen", 9, "DefPreisspaltentyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefRabattklassen", 10, "DefRabattklasse_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefReisetypen", 11, "DefReisetyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefRelationenberechnungsregelungen", 12, "DefRelationenberechnungsregelung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefRelationendruckregelungen", 13, "DefRelationendruckregelung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefRelationscodegruppentypen", 14, "DefRelationscodegruppentyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefSortenausgaberegelungen", 15, "DefSortenausgaberegelung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefSortendruckregelungen", 16, "DefSortendruckregelung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefSortengruppentypen", 17, "DefSortengruppentyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefSortenklassen", 18, "DefSortenklasse_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefSortentypen", 19, "DefSortentyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefTarifpunkttypen", 20, "DefTarifpunkttyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefVertriebswege", 21, "DefVertriebswege_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefWaehrungen", 22, "DefWaehrung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefZahlungsarten", 23, "DefZahlungsarten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Feiertage", 24, "Feiertage_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Kalender", 25, "Kalender_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Linien", 26, "Linien_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Mwst", 27, "Mwst_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Nachbarhaltestellen", 28, "Nachbarhaltestellen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Ortspunkte", 29, "Ortspunkte_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("OrtspunkteKA", 30, "OrtspunkteKA_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("OrtspunkteTG", 31, "OrtspunkteTG_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preise", 32, "Preise_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preisspalten", 33, "Preisspalten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preisstufen", 34, "Preisstufen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preisstufendirektwahl", 35, "Preisstufendirektwahl_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("RaeumlicheGueltigkeit", 36, "RaeumlicheGueltigkeit_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Relationen", 37, "Relationen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Relationscodegruppen", 38, "Relationscodegruppen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Relationszuordnungen", 39, "Relationszuordnungen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Sorten", 40, "Sorten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Sortengruppen", 41, "Sortengruppen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tagesarten", 42, "Tagesarten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("TagesartMerkmalElemente", 43, "TagesartMerkmalElemente_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tagesmerkmale", 44, "Tagesmerkmale_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("TagesmerkmalElemente", 45, "TagesmerkmalElemente_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tarifarten", 46, "Tarifarten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tarifgebiete", 47, "Tarifgebiete_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tarifpunkte", 48, "Tarifpunkte_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tarifpunktmengen", 49, "Tarifpunktmengen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tarifrelevantepunkte", 50, "Tarifrelevantepunkte_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Teilrelationen", 51, "Teilrelationen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Unternehmen", 52, "Unternehmen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Vias", 53, "Vias_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Wege", 54, "Wege_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Wegpositionen", 55, "Wegpositionen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Zusatzsorten", 56, "Zusatzsorten_Type"); 
INSERT INTO VersionStruktur (VersionMajor, VersionMinor, Status, Aenderungsdatum) VALUES (3, 0, "in Arbeit", "2019-09-20"); 
