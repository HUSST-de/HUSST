/************************************************************************************
* HUSST Versorgungsdaten
*
* automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
* generiert am 2021-03-29
*
* HUSST 3_00 (V 3.0 - stabil vom 2020-03-29 )
*
*************************************************************************************/

CREATE TABLE Bearbeitung(
	Bearbeitungsdatum                   datetime, 
	Lieferant                           text, 
	Kommentar                           text,
	PRIMARY KEY(Bearbeitungsdatum ASC, Lieferant ASC));

CREATE TABLE Bediengebiete(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Bediengebiet                     bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Bediengebiet ASC, ID_Zeitraum ASC));

CREATE TABLE DefBundeslaender(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Bundesland                       bigint, 
	Iso                                 text, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Bundesland ASC, ID_Zeitraum ASC));

CREATE TABLE DefFahrgasttypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Fahrgasttyp                      bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Fahrgasttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefKomfortklassen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Komfortklasse                    bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Komfortklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefNachbarhaltestellenbeziehungen(
	Deaktiviert                         integer, 
	ID_Nachbarhaltestellenbeziehung     bigint, 
	ID_Zeitraum                         bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Nachbarhaltestellenbeziehung ASC, ID_Zeitraum ASC));

CREATE TABLE DefOrtspunkttypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ortspunkttyp                     bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Ortspunkttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefOTPTypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_OTPTyp                           bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_OTPTyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisfindungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisfindung                     bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Preisfindung ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisquellen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisquelle                      bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Preisquelle ASC, ID_Zeitraum ASC));

CREATE TABLE DefPreisspaltentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisspaltentyp                  bigint, 
	Kennung                             text, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Preisspaltentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefRabattklassen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Rabattklasse                     bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Rabattklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefReisetypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Reisetyp                         bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Reisetyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationenberechnungsregelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relationenberechnungsregelung    bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Relationenberechnungsregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationendruckregelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relationendruckregelung          bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Relationendruckregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefRelationscodegruppentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relcodegruppentyp                bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Relcodegruppentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortenausgaberegelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortenausgaberegelung            bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Sortenausgaberegelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortendruckregelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortendruckregelung              bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Sortendruckregelung ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortengruppentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortengruppentyp                 bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Sortengruppentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortenklassen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortenklasse                     bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Sortenklasse ASC, ID_Zeitraum ASC));

CREATE TABLE DefSortentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortentyp                        bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Sortentyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefTarifpunkttypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifpunkttyp                    bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Tarifpunkttyp ASC, ID_Zeitraum ASC));

CREATE TABLE DefVertriebswege(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Vertriebswege                    bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Vertriebswege ASC, ID_Zeitraum ASC));

CREATE TABLE DefWaehrungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Waehrung                         bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Waehrung ASC, ID_Zeitraum ASC));

CREATE TABLE DefZahlungsarten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Zahlungsarten                    bigint, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Zahlungsarten ASC, ID_Zeitraum ASC));

CREATE TABLE Feiertage(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Feiertag                         bigint, 
	ID_Bundesland                       bigint, 
	Datum                               datetime, 
	Bezeichnung                         text,
	PRIMARY KEY(ID_Feiertag ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Feiertage ON Feiertage(Datum ASC, ID_Bundesland ASC, ID_Zeitraum ASC);

CREATE TABLE GueltigkeitszeitRegel(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_GueltigkeitszeitRegel            bigint, 
	GueltigkeitszeitRegelNr             bigint, 
	ID_Tarifgebiet                      bigint, 
	Param                               text,
	PRIMARY KEY(ID_GueltigkeitszeitRegel ASC, ID_Zeitraum ASC));

CREATE TABLE Interpretationen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	Interpretationsschluessel           text, 
	Wert                                text,
	PRIMARY KEY(Interpretationsschluessel ASC, ID_Zeitraum ASC));

CREATE TABLE Kalender(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Betriebstag                      datetime, 
	ID_Betriebstagesart                 bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Betriebstag ASC, ID_Zeitraum ASC));

CREATE TABLE Linien(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Linie                            bigint, 
	ID_Weg_Hin                          bigint, 
	ID_Weg_Rueck                        bigint, 
	Bezeichnung                         text, 
	ID_Konzessionaer                    bigint, 
	ID_Bediengebiet                     bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Linie ASC, ID_Zeitraum ASC));

CREATE TABLE Mwst(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Mwst                             bigint, 
	MwstSatz                            numeric, 
	Bezeichnung                         text, 
	ReferenzExtern                      text, 
	KA_Mwst                             bigint,
	PRIMARY KEY(ID_Mwst ASC, ID_Zeitraum ASC));

CREATE TABLE Nachbarhaltestellen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Nachbarhaltestelle               bigint, 
	ID_Bediengebiet                     bigint, 
	ID_Nachbarhaltestellenbeziehung     bigint, 
	ID_OrtspunktVon                     bigint, 
	ID_OrtspunktNach                    bigint, 
	SortOrder                           bigint, 
	ID_Via                              bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Preisstufe                       bigint, 
	Zahlgrenzen                         bigint,
	PRIMARY KEY(ID_Nachbarhaltestelle ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Nachbarhaltestellen ON Nachbarhaltestellen(ID_OrtspunktVon ASC, ID_OrtspunktNach ASC, ID_Zeitraum ASC);

CREATE TABLE Ortspunkte(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ortspunkt                        bigint, 
	ID_Ortspunkttyp                     bigint, 
	Ortsnummer                          bigint, 
	ID_Relcode                          bigint, 
	IBISnr                              text, 
	ID_Bundesland                       bigint, 
	Gemeindekennziffer                  text, 
	Bezeichnung                         text, 
	BezeichnungKurz                     text, 
	BezeichnungDruck                    text, 
	ReferenzExtern                      text, 
	ID_Bediengebiet                     bigint, 
	ID_OrtspunktReferenz                bigint, 
	XKoordWgs84                         real, 
	YKoordWgs84                         real,
	PRIMARY KEY(ID_Ortspunkt ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Ortspunkte ON Ortspunkte(Ortsnummer ASC, ID_Ortspunkttyp ASC, ID_Zeitraum ASC);

CREATE TABLE OrtspunkteKA(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ortspunkt                        bigint, 
	KA_OrtOrgID                         bigint, 
	KA_OrtTyp                           bigint, 
	KA_OrtNummer                        bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Ortspunkt ASC, ID_Zeitraum ASC));

CREATE TABLE OrtspunkteTG(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_OrtspunktTG                      bigint, 
	ID_Ortspunkt                        bigint, 
	ID_Tarifgebiet                      bigint, 
	Bezeichnung                         text, 
	BezeichnungKurz                     text, 
	BezeichnungDruck                    text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_OrtspunktTG ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_OrtspunkteTG ON OrtspunkteTG(ID_Ortspunkt ASC, ID_Tarifgebiet ASC, ID_Zeitraum ASC);

CREATE TABLE Preise(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preis                            bigint, 
	ID_Sorte                            bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Preisstufe                       bigint, 
	ID_Preisspalte                      bigint, 
	ReferenzExtern                      text, 
	Preis                               bigint, 
	PreisstufenbezeichnungKurz          text, 
	Preisstufenbezeichnung              text, 
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
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisspalte                      bigint, 
	ID_Waehrung                         bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Preisspaltentyp                  bigint, 
	Bezeichnung                         text, 
	BezeichnungKurz                     text, 
	Hinweis                             text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Preisspalte ASC, ID_Zeitraum ASC));

CREATE TABLE Preisstufen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisstufe                       bigint, 
	ID_Tarifgebiet                      bigint, 
	Preisstufennummer                   bigint, 
	ReferenzExtern                      text, 
	BezeichnungKurz                     text, 
	Bezeichnung                         text, 
	WegstreckeInMetern                  bigint, 
	ID_Mwst                             bigint, 
	UpgradeStopp                        integer, 
	SortOrder                           bigint, 
	KA_Preisstufe                       bigint,
	PRIMARY KEY(ID_Preisstufe ASC, ID_Zeitraum ASC));

CREATE TABLE Preisstufendirektwahl(
	Deaktiviert                         integer, 
	ID_Preisstufendirektwahl            bigint, 
	ID_Zeitraum                         bigint, 
	Direktwahlschluessel                text, 
	ID_Tarifart                         bigint, 
	ID_Preisstufe                       bigint, 
	Bezeichnung                         text, 
	BezeichnungDruck                    text, 
	ID_Relation                         bigint, 
	ID_Vertriebswege                    bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Preisstufendirektwahl ASC, ID_Zeitraum ASC));

CREATE TABLE RaeumlicheGueltigkeit(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_RaeumlicheGueltigkeit            bigint, 
	ID_Tarifpunktmenge                  bigint, 
	KA_GueltigkeitsraumOriginaer        text, 
	KA_GueltigkeitsraumAlternativ       text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_RaeumlicheGueltigkeit ASC, ID_Zeitraum ASC));

CREATE TABLE Relationen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relation                         bigint, 
	ID_RelcodeStart                     bigint, 
	ID_RelcodeZiel                      bigint, 
	SortOrder                           bigint, 
	GegenrichtungLiegtVor               integer, 
	ID_Vertriebswege                    bigint, 
	ID_Via                              bigint, 
	ID_Berechnungsregelung              bigint, 
	ID_Druckregelung                    bigint,
	PRIMARY KEY(ID_Relation ASC, ID_Zeitraum ASC));

CREATE TABLE Relationscodegruppen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relcodegruppentyp                bigint, 
	ID_Relcodegruppe                    bigint, 
	Gruppennummer                       bigint, 
	ID_Relcode                          bigint,
	PRIMARY KEY(ID_Relcodegruppe ASC, ID_Zeitraum ASC));

CREATE TABLE Relationscodes(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relcode                          bigint, 
	ID_Tarifpunkt                       bigint,
	PRIMARY KEY(ID_Relcode ASC, ID_Zeitraum ASC, ID_Tarifpunkt ASC));

CREATE TABLE Relationszuordnungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relationszuordung                bigint, 
	ID_Relation                         bigint, 
	ID_Teilrelation                     bigint, 
	Sortorder                           bigint,
	PRIMARY KEY(ID_Relationszuordung ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Relationszuordnungen ON Relationszuordnungen(ID_Teilrelation ASC, ID_Relation ASC, ID_Relationszuordung ASC, ID_Zeitraum ASC);

CREATE TABLE Sorten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sorte                            bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Sortenklasse                     bigint, 
	ReferenzExtern                      text, 
	BezeichnungKurz                     text, 
	Bezeichnung                         text, 
	ID_Ausgaberegelung                  bigint, 
	ID_Druckregelung                    bigint, 
	Layout                              text, 
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
	BezeichnungDruck                    text, 
	KA_ProdOrgID                        bigint, 
	KA_ProdNr                           bigint, 
	KA_Infotext                         text, 
	KA_Fahrgasttyp                      bigint, 
	KA_Verkehrsmittel                   bigint, 
	KA_Serviceklasse                    bigint,
	PRIMARY KEY(ID_Sorte ASC, ID_Zeitraum ASC));

CREATE TABLE Sortengruppen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortengruppe                     bigint, 
	Sortengruppennummer                 bigint, 
	ID_Sortengruppentyp                 bigint, 
	ID_Bediengebiet                     bigint, 
	SortOrder                           bigint, 
	Bezeichnung                         text, 
	TarifInfo                           text, 
	ID_Sorte                            bigint, 
	ID_Preisstufe                       bigint,
	PRIMARY KEY(ID_Sortengruppe ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Sortengruppen ON Sortengruppen(Sortengruppennummer ASC, ID_Sortengruppentyp ASC, ID_Bediengebiet ASC, SortOrder ASC, ID_Zeitraum ASC);

CREATE TABLE SortenTarifarten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sorte                            bigint, 
	ID_Tarifart                         bigint,
	PRIMARY KEY(ID_Sorte ASC, ID_Tarifart ASC, ID_Zeitraum ASC));

CREATE TABLE Tagesarten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Betriebstagesart                 bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Betriebstagesart ASC, ID_Zeitraum ASC));

CREATE TABLE TagesartMerkmalElemente(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_TagesartMerkmalElement           bigint, 
	ID_Betriebstagesart                 bigint, 
	ID_TagesmerkmalElement              bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_TagesartMerkmalElement ASC, ID_Zeitraum ASC));

CREATE TABLE Tagesmerkmale(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tagesmerkmal                     bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Tagesmerkmal ASC, ID_Zeitraum ASC));

CREATE TABLE TagesmerkmalElemente(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_TagesmerkmalElement              bigint, 
	ID_Tagesmerkmal                     bigint, 
	Bezeichnung                         varchar(250), 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_TagesmerkmalElement ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_TagesmerkmalElemente ON TagesmerkmalElemente(ID_Tagesmerkmal ASC, Bezeichnung ASC, ID_Zeitraum ASC);

CREATE TABLE Tarifarten(
	ID_Zeitraum                         bigint, 
	ID_Tarifart                         bigint, 
	Bezeichnung                         text, 
	ID_Tarifgebiet                      bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Tarifart ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifgebiete(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifgebiet                      bigint, 
	BezeichnungKurz                     text, 
	Bezeichnung                         text, 
	Erstellungsdatum                    datetime, 
	Version                             text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Tarifgebiet ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifpunkte(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifpunkt                       bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Tarifpunkttyp                    bigint, 
	Bezeichnung                         text, 
	BezeichnungDruck                    text, 
	ID_TarifpunktReferenz               bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Tarifpunkt ASC, ID_Zeitraum ASC));

CREATE TABLE TarifpunktmengeElemente(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_TarifpunktmengeElement           bigint, 
	ID_Tarifpunktmenge                  bigint, 
	ID_Tarifpunkt                       bigint, 
	SortOrder                           bigint,
	PRIMARY KEY(ID_TarifpunktmengeElement ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifpunktmengen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifpunktmenge                  bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Tarifpunktmenge ASC, ID_Zeitraum ASC));

CREATE TABLE Tarifrelevantepunkte(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifrelevanterpunkt             bigint, 
	ID_OTPTyp                           bigint, 
	ID_Bediengebiet                     bigint, 
	Bezeichnung                         text, 
	SortOrder                           bigint, 
	ID_Relcode                          bigint, 
	ID_Bundesland                       bigint, 
	ID_Ortsnummer                       bigint, 
	ID_Sortengruppe                     bigint, 
	Standortwahl_ID_Bediengebiet        bigint, 
	ID_TarifrelevanterpunktReferenz     bigint,
	PRIMARY KEY(ID_Tarifrelevanterpunkt ASC, ID_Zeitraum ASC));

CREATE TABLE Teilrelationen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Teilrelation                     bigint, 
	ID_Tarifart                         bigint, 
	ID_TarifpunktStart                  bigint, 
	TarifpunktbezeichnungStart          text, 
	ID_TarifpunktZiel                   bigint, 
	TarifpunktbezeichnungZiel           text, 
	ID_Tarifgebiet                      bigint, 
	ID_Preisstufe                       bigint, 
	ID_Preisquelle                      bigint, 
	ID_Komfortklasse                    bigint, 
	AlternativePreisGruppe              bigint, 
	EinnahmeAufteilung                  text, 
	ViabezeichnungDruck                 text, 
	ViabezeichnungRueckDruck            text, 
	ID_RaeumlicheGueltigkeit            bigint, 
	ID_RaeumlicheGueltigkeit_Rueck      bigint, 
	ID_Linie                            bigint, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Teilrelation ASC, ID_Zeitraum ASC));

CREATE TABLE Unternehmen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Unternehmen                      bigint, 
	BezeichnungKurz                     text, 
	Bezeichnung                         text, 
	Mandant                             integer, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Unternehmen ASC, ID_Zeitraum ASC));

CREATE TABLE Updateinfo(
	Updatetime                          datetime, 
	Filename                            text, 
	Purpose                             text,
	PRIMARY KEY(Updatetime ASC, Filename ASC));

CREATE TABLE VersionInhalt(
	DatenversionInhalt                  text, 
	Testdaten                           integer, 
	Erstellungsdatum                    datetime, 
	Lieferant                           text, 
	Kommentar                           text,
	PRIMARY KEY(DatenversionInhalt ASC, Erstellungsdatum ASC, Lieferant ASC));

CREATE TABLE VersionStruktur(
	VersionMajor                        bigint, 
	VersionMinor                        bigint, 
	Status                              text, 
	Aenderungsdatum                     datetime, 
	Aenderungsautor                     text);

CREATE TABLE Vias(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Via                              bigint, 
	Bezeichnung                         text, 
	BezeichnungDruck                    text, 
	BezeichnungRueck                    text, 
	BezeichnungRueckDruck               text,
	PRIMARY KEY(ID_Via ASC, ID_Zeitraum ASC));

CREATE TABLE Wege(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Weg                              bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text,
	PRIMARY KEY(ID_Weg ASC, ID_Zeitraum ASC));

CREATE TABLE Wegpositionen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Wegposition                      bigint, 
	ID_Weg                              bigint, 
	SortOrder                           bigint, 
	ID_Ortspunkt                        bigint, 
	ID_Bediengebiet                     bigint, 
	Entfernung                          bigint, 
	Fangbereich                         bigint,
	PRIMARY KEY(ID_Wegposition ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Wegpositionen ON Wegpositionen(ID_Weg ASC, SortOrder ASC, ID_Zeitraum ASC);

CREATE TABLE Zeitraeume(
	ID_Zeitraum                         bigint, 
	ZeitraumVon                         datetime, 
	ZeitraumBis                         datetime, 
	DatenversionZeitraum                text, 
	HauptZeitraumNr                     bigint, 
	SubZeitraumNr                       bigint,
	PRIMARY KEY(ID_Zeitraum ASC));

CREATE TABLE Zeitraumoptionen(
	ID_Zeitraum                         bigint, 
	Option                              varchar(250), 
	Wert                                text,
	PRIMARY KEY(Option ASC, ID_Zeitraum ASC));

CREATE TABLE Zusatzsorten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Zusatzsorte                      bigint, 
	ID_Sorte                            bigint, 
	ZuordnungRelCodeGrp                 varchar(1), 
	Anbindung                           varchar(1), 
	Zusatzsortentyp                     bigint, 
	ID_Preisstufe                       bigint, 
	ID_PreisstufeGrenze                 bigint, 
	Hinweistext                         text, 
	ID_SortengruppeHauptsorten          bigint, 
	ID_RelcodegruppeStart               bigint, 
	ID_RelcodegruppeZiel                bigint, 
	Direktverkauf                       integer,
	PRIMARY KEY(ID_Zusatzsorte ASC, ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Zusatzsorten ON Zusatzsorten(ID_Sorte ASC, ZuordnungRelCodeGrp ASC, ID_Zeitraum ASC);

CREATE TABLE DynAttributDef(
	ID_DynAttributDef                   bigint, 
	Name                                text, 
	DynAttributTyp                      text,
	PRIMARY KEY(ID_DynAttributDef ASC));

CREATE TABLE DynAttributWert(
	ID_Zeitraum                         bigint, 
	ID_DynAttributDef                   bigint, 
	Tabellennummer                      bigint, 
	ID_DatensatzRef                     bigint, 
	Wert                                text,
	PRIMARY KEY(ID_Zeitraum ASC, ID_DynAttributDef ASC, Tabellennummer ASC, ID_DatensatzRef ASC));

CREATE TABLE Sprachtexte(
	ID_Sprachtext                       text, 
	Lang                                varchar(2), 
	Text                                text,
	PRIMARY KEY(ID_Sprachtext ASC, Lang ASC));

CREATE TABLE Tabelleninfo(
	Tabellenname                        text, 
	Tabellennummer                      bigint, 
	Strukturname                        text,
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
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("GueltigkeitszeitRegel", 57, "GueltigkeitszeitRegel_Type"); 
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
INSERT INTO VersionStruktur (VersionMajor, VersionMinor, Status, Aenderungsdatum) VALUES (3, 0, "stabil", "2020-03-29"); 
