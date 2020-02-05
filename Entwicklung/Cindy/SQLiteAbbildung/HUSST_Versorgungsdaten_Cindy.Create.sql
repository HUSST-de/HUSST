/************************************************************************************
* HUSST Versorgungsdaten
*
* automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
* generiert am 2020-02-05
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
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Bediengebiet                     bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Bediengebiet ASC, ID_Zeitraum ASC));

CREATE TABLE DefBundeslaender(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Bundesland                       bigint NOT NULL, 
	Iso                                 string, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Bundesland ASC, ID_Zeitraum ASC));

CREATE TABLE DefFahrgasttypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Fahrgasttyp                      bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Fahrgasttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefKomfortklassen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Komfortklasse                    bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Komfortklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefNachbarhaltestellenbeziehungen(
	Deaktiviert                         bit, 
	ID_Nachbarhaltestellenbeziehung     bigint NOT NULL, 
	ID_Zeitraum                         bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Nachbarhaltestellenbeziehung ASC, ID_Zeitraum ASC));

CREATE TABLE DefOrtspunkttypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Ortspunkttyp                     bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Ortspunkttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefOTPTypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_OTPTyp                           bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_OTPTyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisfindungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Preisfindung                     bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Preisfindung ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisquellen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Preisquelle                      bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisquelle ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisspaltentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Preisspaltentyp                  bigint NOT NULL, 
	Kennung                             string, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisspaltentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefRabattklassen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Rabattklasse                     bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Rabattklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefReisetypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Reisetyp                         bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Reisetyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationenberechnungsregelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relationenberechnungsregelung    bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Relationenberechnungsregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationendruckregelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relationendruckregelung          bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Relationendruckregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationscodegruppentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relcodegruppentyp                bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Relcodegruppentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortenausgaberegelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sortenausgaberegelung            bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Sortenausgaberegelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortendruckregelungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sortendruckregelung              bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Sortendruckregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortengruppentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sortengruppentyp                 bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Sortengruppentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortenklassen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sortenklasse                     bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Sortenklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortentypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sortentyp                        bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Sortentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefTarifpunkttypen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tarifpunkttyp                    bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifpunkttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefVertriebswege(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Vertriebswege                    bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Vertriebswege ASC, ID_Zeitraum ASC));

CREATE TABLE DefWaehrungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Waehrung                         bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Waehrung ASC, ID_Zeitraum ASC));

CREATE TABLE DefZahlungsarten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Zahlungsarten                    bigint NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Zahlungsarten ASC, ID_Zeitraum ASC));

CREATE TABLE Feiertage(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Feiertag                         bigint NOT NULL, 
	ID_Bundesland                       bigint NOT NULL, 
	Datum                               datetime NOT NULL, 
	Bezeichnung                         string,
	PRIMARY KEY(ID_Feiertag ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Feiertage ON Feiertage(Datum ASC, ID_Bundesland ASC, ID_Zeitraum ASC);

CREATE TABLE Interpretationen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	Interpretationsschluessel           string NOT NULL, 
	Wert                                string,
	PRIMARY KEY(Interpretationsschluessel ASC, ID_Zeitraum ASC));

CREATE TABLE Kalender(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Betriebstag                      datetime NOT NULL, 
	ID_Betriebstagesart                 bigint NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Betriebstag ASC, ID_Zeitraum ASC));

CREATE TABLE Linien(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Linie                            bigint NOT NULL, 
	ID_Weg_Hin                          bigint NOT NULL, 
	ID_Weg_Rueck                        bigint, 
	Bezeichnung                         string, 
	ID_Konzessionaer                    bigint, 
	ID_Bediengebiet                     bigint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Linie ASC, ID_Zeitraum ASC));

CREATE TABLE Mwst(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Mwst                             bigint NOT NULL, 
	MwstSatz                            real, 
	Bezeichnung                         string, 
	ReferenzExtern                      string, 
	KA_Mwst                             bigint,
	PRIMARY KEY(ID_Mwst ASC, ID_Zeitraum ASC));

CREATE TABLE Nachbarhaltestellen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Nachbarhaltestelle               bigint NOT NULL, 
	ID_Bediengebiet                     bigint, 
	ID_Nachbarhaltestellenbeziehung     bigint, 
	ID_OrtspunktVon                     bigint NOT NULL, 
	ID_OrtspunktNach                    bigint NOT NULL, 
	SortOrder                           bigint, 
	ID_Via                              bigint, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	ID_Preisstufe                       bigint NOT NULL, 
	Zahlgrenzen                         bigint NOT NULL,
	PRIMARY KEY(ID_Nachbarhaltestelle ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Nachbarhaltestellen ON Nachbarhaltestellen(ID_OrtspunktVon ASC, ID_OrtspunktNach ASC, ID_Zeitraum ASC);

CREATE TABLE Ortspunkte(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Ortspunkt                        bigint NOT NULL, 
	ID_Ortspunkttyp                     bigint NOT NULL, 
	Ortsnummer                          bigint NOT NULL, 
	ID_Relcode                          bigint NOT NULL, 
	IBISnr                              string, 
	ID_Bundesland                       bigint, 
	Gemeindekennziffer                  string, 
	Bezeichnung                         string, 
	BezeichnungKurz                     string, 
	BezeichnungDruck                    string, 
	ReferenzExtern                      string, 
	ID_Bediengebiet                     bigint, 
	ID_OrtspunktReferenz                bigint, 
	XKoordWgs84                         real, 
	YKoordWgs84                         real,
	PRIMARY KEY(ID_Ortspunkt ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Ortspunkte ON Ortspunkte(Ortsnummer ASC, ID_Ortspunkttyp ASC, ID_Zeitraum ASC);

CREATE TABLE OrtspunkteKA(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Ortspunkt                        bigint NOT NULL, 
	KA_OrtOrgID                         bigint, 
	KA_OrtTyp                           bigint, 
	KA_OrtNummer                        bigint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Ortspunkt ASC, ID_Zeitraum ASC));

CREATE TABLE OrtspunkteTG(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_OrtspunktTG                      bigint NOT NULL, 
	ID_Ortspunkt                        bigint NOT NULL, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	Bezeichnung                         string, 
	BezeichnungKurz                     string, 
	BezeichnungDruck                    string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_OrtspunktTG ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_OrtspunkteTG ON OrtspunkteTG(ID_Ortspunkt ASC, ID_Tarifgebiet ASC, ID_Zeitraum ASC);

CREATE TABLE Preise(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Preis                            bigint NOT NULL, 
	ID_Sorte                            bigint NOT NULL, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	ID_Preisstufe                       bigint NOT NULL, 
	ID_Preisspalte                      bigint NOT NULL, 
	ReferenzExtern                      string, 
	Preis                               bigint, 
	PreisstufenbezeichnungKurz          string, 
	Preisstufenbezeichnung              string, 
	ID_Mwst                             bigint, 
	ID_PreisstufeReferenz               bigint, 
	ID_GueltigkeitszeitRegel            bigint, 
	ID_RaeumlicheGueltigkeit            bigint, 
	KA_ProdOrgID                        bigint, 
	KA_ProdNr                           bigint, 
	KA_Rabatttyp                        bigint, 
	KA_Mitnahme1Typ                     bigint, 
	KA_Mitnahme1MinAnzahl               bigint, 
	KA_Mitnahme1MaxAnzahl               bigint, 
	KA_Mitnahme2Typ                     bigint, 
	KA_Mitnahme2MinAnzahl               bigint, 
	KA_Mitnahme2MaxAnzahl               bigint,
	PRIMARY KEY(ID_Preis ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Preise ON Preise(ID_Preisstufe ASC, ID_Sorte ASC, ID_Preisspalte ASC, ID_Zeitraum ASC);

CREATE TABLE Preisspalten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Preisspalte                      bigint NOT NULL, 
	ID_Waehrung                         bigint NOT NULL, 
	ID_Preisspaltentyp                  bigint, 
	Bezeichnung                         string, 
	BezeichnungKurz                     string, 
	Hinweis                             string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisspalte ASC, ID_Zeitraum ASC));

CREATE TABLE Preisstufen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Preisstufe                       bigint NOT NULL, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	Preisstufennummer                   bigint, 
	ReferenzExtern                      string, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	WegstreckeInMetern                  bigint, 
	ID_Mwst                             bigint, 
	UpgradeStopp                        bit, 
	SortOrder                           bigint NOT NULL, 
	KA_Preisstufe                       bigint NOT NULL,
	PRIMARY KEY(ID_Preisstufe ASC, ID_Zeitraum ASC));

CREATE TABLE Preisstufendirektwahl(
	Deaktiviert                         bit, 
	ID_Preisstufendirektwahl            bigint NOT NULL, 
	ID_Zeitraum                         bigint NOT NULL, 
	Direktwahlschluessel                string NOT NULL, 
	ID_Tarifart                         bigint NOT NULL, 
	ID_Preisstufe                       bigint NOT NULL, 
	Bezeichnung                         string, 
	BezeichnungDruck                    string, 
	ID_Relation                         bigint, 
	ID_Vertriebswege                    bigint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Preisstufendirektwahl ASC, ID_Zeitraum ASC));

CREATE TABLE RaeumlicheGueltigkeit(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_RaeumlicheGueltigkeit            bigint NOT NULL, 
	ID_Tarifpunktmenge                  bigint, 
	KA_GueltigkeitsraumOriginaer        string NOT NULL, 
	KA_GueltigkeitsraumAlternativ       string NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_RaeumlicheGueltigkeit ASC, ID_Zeitraum ASC));

CREATE TABLE Relationen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relation                         bigint NOT NULL, 
	ID_RelcodeStart                     bigint NOT NULL, 
	ID_RelcodeZiel                      bigint NOT NULL, 
	SortOrder                           bigint NOT NULL, 
	GegenrichtungLiegtVor               bit, 
	ID_Vertriebswege                    bigint, 
	ID_Via                              bigint, 
	ID_Berechnungsregelung              bigint, 
	ID_Druckregelung                    bigint,
	PRIMARY KEY(ID_Relation ASC, ID_Zeitraum ASC));

CREATE TABLE Relationscodegruppen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relcodegruppentyp                bigint NOT NULL, 
	ID_Relcodegruppe                    bigint NOT NULL, 
	Gruppennummer                       bigint NOT NULL, 
	ID_Relcode                          bigint NOT NULL,
	PRIMARY KEY(ID_Relcodegruppe ASC, ID_Zeitraum ASC));

CREATE TABLE Relationscodes(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relcode                          bigint NOT NULL, 
	ID_Tarifpunkt                       bigint NOT NULL,
	PRIMARY KEY(ID_Relcode ASC, ID_Zeitraum ASC, ID_Tarifpunkt ASC));

CREATE TABLE Relationszuordnungen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Relationszuordung                bigint NOT NULL, 
	ID_Relation                         bigint NOT NULL, 
	ID_Teilrelation                     bigint NOT NULL, 
	Sortorder                           bigint NOT NULL,
	PRIMARY KEY(ID_Relationszuordung ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Relationszuordnungen ON Relationszuordnungen(ID_Teilrelation ASC, ID_Relation ASC, ID_Relationszuordung ASC, ID_Zeitraum ASC);

CREATE TABLE Sorten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sorte                            bigint NOT NULL, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	ID_Sortenklasse                     bigint NOT NULL, 
	ReferenzExtern                      string, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	ID_Ausgaberegelung                  bigint, 
	ID_Druckregelung                    bigint, 
	Layout                              string, 
	ID_Vertriebswege                    bigint, 
	ID_Mwst                             bigint, 
	ID_Zahlungsarten                    bigint, 
	ID_Komfortklasse                    bigint, 
	ID_Rabattklasse                     bigint, 
	ID_Fahrgasttyp                      bigint, 
	ID_Sortentyp                        bigint, 
	Mindestpersonenanzahl               bigint, 
	Hoechstpersonenanzahl               bigint, 
	ID_GueltigkeitszeitRegel            bigint, 
	ID_Preisfindung                     bigint, 
	ID_Reisetyp                         bigint, 
	BezeichnungDruck                    string, 
	KA_ProdOrgID                        bigint, 
	KA_ProdNr                           bigint, 
	KA_Infotext                         string, 
	KA_Fahrgasttyp                      bigint, 
	KA_Verkehrsmittel                   bigint, 
	KA_Serviceklasse                    bigint,
	PRIMARY KEY(ID_Sorte ASC, ID_Zeitraum ASC));

CREATE TABLE Sortengruppen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sortengruppe                     bigint NOT NULL, 
	Sortengruppennummer                 bigint NOT NULL, 
	ID_Sortengruppentyp                 bigint NOT NULL, 
	ID_Bediengebiet                     bigint NOT NULL, 
	SortOrder                           bigint NOT NULL, 
	Bezeichnung                         string, 
	TarifInfo                           string, 
	ID_Sorte                            bigint NOT NULL, 
	ID_Preisstufe                       bigint,
	PRIMARY KEY(ID_Sortengruppe ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Sortengruppen ON Sortengruppen(Sortengruppennummer ASC, ID_Sortengruppentyp ASC, ID_Bediengebiet ASC, SortOrder ASC, ID_Zeitraum ASC);

CREATE TABLE SortenTarifarten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Sorte                            bigint NOT NULL, 
	ID_Tarifart                         bigint NOT NULL,
	PRIMARY KEY(ID_Sorte ASC, ID_Tarifart ASC, ID_Zeitraum ASC));

CREATE TABLE Tagesarten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Betriebstagesart                 bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Betriebstagesart ASC, ID_Zeitraum ASC));

CREATE TABLE TagesartMerkmalElemente(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_TagesartMerkmalElement           bigint NOT NULL, 
	ID_Betriebstagesart                 bigint NOT NULL, 
	ID_TagesmerkmalElement              bigint NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_TagesartMerkmalElement ASC, ID_Zeitraum ASC));

CREATE TABLE Tagesmerkmale(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tagesmerkmal                     bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tagesmerkmal ASC, ID_Zeitraum ASC));

CREATE TABLE TagesmerkmalElemente(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_TagesmerkmalElement              bigint NOT NULL, 
	ID_Tagesmerkmal                     bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_TagesmerkmalElement ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_TagesmerkmalElemente ON TagesmerkmalElemente(ID_Tagesmerkmal ASC, Bezeichnung ASC, ID_Zeitraum ASC);

CREATE TABLE Tarifarten(
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tarifart                         bigint NOT NULL, 
	Bezeichnung                         string, 
	ID_Tarifgebiet                      bigint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifart ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifgebiete(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	BezeichnungKurz                     string, 
	Bezeichnung                         string, 
	Erstellungsdatum                    datetime, 
	Version                             string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifgebiet ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifpunkte(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tarifpunkt                       bigint NOT NULL, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	ID_Tarifpunkttyp                    bigint, 
	Bezeichnung                         string, 
	BezeichnungDruck                    string, 
	ID_TarifpunktReferenz               bigint, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifpunkt ASC, ID_Zeitraum ASC));

CREATE TABLE TarifpunktmengeElemente(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_TarifpunktmengeElement           bigint NOT NULL, 
	ID_Tarifpunktmenge                  bigint NOT NULL, 
	ID_Tarifpunkt                       bigint NOT NULL, 
	SortOrder                           bigint,
	PRIMARY KEY(ID_TarifpunktmengeElement ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifpunktmengen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tarifpunktmenge                  bigint NOT NULL, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Tarifpunktmenge ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifrelevantepunkte(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Tarifrelevanterpunkt             bigint NOT NULL, 
	ID_OTPTyp                           bigint NOT NULL, 
	ID_Bediengebiet                     bigint NOT NULL, 
	Bezeichnung                         string NOT NULL, 
	SortOrder                           bigint NOT NULL, 
	ID_Relcode                          bigint, 
	ID_Bundesland                       bigint, 
	ID_Ortsnummer                       bigint, 
	ID_Sortengruppe                     bigint, 
	Standortwahl_ID_Bediengebiet        bigint, 
	ID_TarifrelevanterpunktReferenz     bigint,
	PRIMARY KEY(ID_Tarifrelevanterpunkt ASC, ID_Zeitraum ASC));

CREATE TABLE Teilrelationen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Teilrelation                     bigint NOT NULL, 
	ID_Tarifart                         bigint NOT NULL, 
	ID_TarifpunktStart                  bigint NOT NULL, 
	TarifpunktbezeichnungStart          string, 
	ID_TarifpunktZiel                   bigint NOT NULL, 
	TarifpunktbezeichnungZiel           string, 
	ID_Tarifgebiet                      bigint NOT NULL, 
	ID_Preisstufe                       bigint NOT NULL, 
	ID_Preisquelle                      bigint, 
	ID_Komfortklasse                    bigint, 
	AlternativePreisGruppe              bigint, 
	EinnahmeAufteilung                  string, 
	ViabezeichnungDruck                 string, 
	ViabezeichnungRueckDruck            string, 
	ID_RaeumlicheGueltigkeit            bigint, 
	ID_RaeumlicheGueltigkeit_Rueck      bigint, 
	ID_Linie                            bigint, 
	ReferenzExtern                      string NOT NULL,
	PRIMARY KEY(ID_Teilrelation ASC, ID_Zeitraum ASC));

CREATE TABLE Unternehmen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Unternehmen                      bigint NOT NULL, 
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
	VersionMajor                        bigint, 
	VersionMinor                        bigint, 
	Status                              string, 
	Aenderungsdatum                     datetime, 
	Aenderungsautor                     string);

CREATE TABLE Vias(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Via                              bigint NOT NULL, 
	Bezeichnung                         string, 
	BezeichnungDruck                    string, 
	BezeichnungRueck                    string, 
	BezeichnungRueckDruck               string,
	PRIMARY KEY(ID_Via ASC, ID_Zeitraum ASC));

CREATE TABLE Wege(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Weg                              bigint NOT NULL, 
	Bezeichnung                         string, 
	ReferenzExtern                      string,
	PRIMARY KEY(ID_Weg ASC, ID_Zeitraum ASC));

CREATE TABLE Wegpositionen(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Wegposition                      bigint NOT NULL, 
	ID_Weg                              bigint NOT NULL, 
	SortOrder                           bigint NOT NULL, 
	ID_Ortspunkt                        bigint, 
	ID_Bediengebiet                     bigint, 
	Entfernung                          bigint, 
	Fangbereich                         bigint,
	PRIMARY KEY(ID_Wegposition ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Wegpositionen ON Wegpositionen(ID_Weg ASC, SortOrder ASC, ID_Zeitraum ASC);

CREATE TABLE Zeitraeume(
	ID_Zeitraum                         bigint NOT NULL, 
	ZeitraumVon                         datetime, 
	ZeitraumBis                         datetime, 
	DatenversionZeitraum                string NOT NULL, 
	HauptZeitraumNr                     bigint NOT NULL, 
	SubZeitraumNr                       bigint NOT NULL,
	PRIMARY KEY(ID_Zeitraum ASC));

CREATE TABLE Zeitraumoptionen(
	ID_Zeitraum                         bigint NOT NULL, 
	Option                              string NOT NULL, 
	Wert                                string,
	PRIMARY KEY(Option ASC, ID_Zeitraum ASC));

CREATE TABLE Zusatzsorten(
	Deaktiviert                         bit, 
	ID_Zeitraum                         bigint NOT NULL, 
	ID_Zusatzsorte                      bigint NOT NULL, 
	ID_Sorte                            bigint NOT NULL, 
	ZuordnungRelCodeGrp                 varchar(1) NOT NULL, 
	Anbindung                           varchar(1), 
	Zusatzsortentyp                     bigint, 
	ID_Preisstufe                       bigint, 
	ID_PreisstufeGrenze                 bigint, 
	Hinweistext                         string, 
	ID_SortengruppeHauptsorten          bigint, 
	ID_RelcodegruppeStart               bigint, 
	ID_RelcodegruppeZiel                bigint, 
	Direktverkauf                       bit NOT NULL,
	PRIMARY KEY(ID_Zusatzsorte ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Zusatzsorten ON Zusatzsorten(ID_Sorte ASC, ZuordnungRelCodeGrp ASC, ID_Zeitraum ASC);

CREATE TABLE DynAttributDef(
	ID_DynAttributDef                   bigint NOT NULL, 
	Name                                string NOT NULL, 
	DynAttributTyp                      string NOT NULL,
	PRIMARY KEY(ID_DynAttributDef ASC));

CREATE TABLE DynAttributWert(
	ID_Zeitraum                         bigint NOT NULL, 
	ID_DynAttributDef                   bigint NOT NULL, 
	Tabellennummer                      bigint NOT NULL, 
	ID_DatensatzRef                     bigint NOT NULL, 
	Wert                                string NOT NULL,
	PRIMARY KEY(ID_Zeitraum ASC, ID_DynAttributDef ASC, Tabellennummer ASC, ID_DatensatzRef ASC));

CREATE TABLE Sprachtexte(
	ID_Sprachtext                       string NOT NULL, 
	Lang                                varchar(2) NOT NULL, 
	Text                                string,
	PRIMARY KEY(ID_Sprachtext ASC, Lang ASC));

CREATE TABLE Tabelleninfo(
	Tabellenname                        string NOT NULL, 
	Tabellennummer                      bigint NOT NULL, 
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
