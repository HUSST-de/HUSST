/************************************************************************************
* HUSST Versorgungsdaten
*
* automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
* generiert am 2023-02-14
*
* HUSST Datenversorgung (V 3.2.0 - in Arbeit vom 2023-02-14 )
*
*************************************************************************************/

CREATE TABLE Bearbeitung(
	Bearbeitungsdatum                   datetime, 
	Lieferant                           text, 
	Kommentar                           text);

CREATE TABLE Bediengebiete(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Bediengebiet                     bigint, 
	Bezeichnung                         text);

CREATE TABLE DefBundeslaender(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Bundesland                       bigint, 
	Iso                                 text, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefErmittlungseinheit(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ermittlungseinheit               bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefFahrgasttypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Fahrgasttyp                      bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefKomfortklassen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Komfortklasse                    bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefNachbarhaltestellenbeziehungen(
	Deaktiviert                         integer, 
	ID_Nachbarhaltestellenbeziehung     bigint, 
	ID_Zeitraum                         bigint, 
	Bezeichnung                         text);

CREATE TABLE DefOTPTypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_OTPTyp                           bigint, 
	Bezeichnung                         text);

CREATE TABLE DefOrtspunkttypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ortspunkttyp                     bigint, 
	Bezeichnung                         text);

CREATE TABLE DefPreisfindungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisfindung                     bigint, 
	Bezeichnung                         text);

CREATE TABLE DefPreisquellen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisquelle                      bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefPreisspaltentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Preisspaltentyp                  bigint, 
	Kennung                             text, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefRabattklassen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Rabattklasse                     bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefReisetypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Reisetyp                         bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefRelationenberechnungsregelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relationenberechnungsregelung    bigint, 
	Bezeichnung                         text);

CREATE TABLE DefRelationendruckregelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relationendruckregelung          bigint, 
	Bezeichnung                         text);

CREATE TABLE DefRelationscodegruppentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relcodegruppentyp                bigint, 
	Bezeichnung                         text);

CREATE TABLE DefSortenausgaberegelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortenausgaberegelung            bigint, 
	Bezeichnung                         text);

CREATE TABLE DefSortendruckregelungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortendruckregelung              bigint, 
	Bezeichnung                         text);

CREATE TABLE DefSortengruppentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortengruppentyp                 bigint, 
	Bezeichnung                         text);

CREATE TABLE DefSortentypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortentyp                        bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefStreckenart(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Streckenart                      bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefStreckencodetyp(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Streckencodetyp                  bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefTarifpunkttypen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifpunkttyp                    bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefVertriebswege(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Vertriebswege                    bigint, 
	Bezeichnung                         text);

CREATE TABLE DefWaehrungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Waehrung                         bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE DefZahlungsarten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Zahlungsarten                    bigint, 
	Bezeichnung                         text);

CREATE TABLE Feiertage(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Feiertag                         bigint, 
	ID_Bundesland                       bigint, 
	Datum                               datetime, 
	Bezeichnung                         text);

CREATE TABLE Gleichstellung(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Gleichstellung                   bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Streckencode                     bigint, 
	ID_StreckencodeGleichstellung       bigint, 
	ID_Gleichstellungstyp               bigint, 
	EntfernungAb                        bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE GleichstellungTarifart(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Gleichstellungstyp               bigint, 
	ID_Tarifart                         bigint, 
	ID_Tarifgebiet                      bigint, 
	ReferenzExtern                      text);

CREATE TABLE Gleichstellungstyp(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Gleichstellungstyp               bigint, 
	ID_Tarifgebiet                      bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE GueltigkeitszeitRegeln(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_GueltigkeitszeitRegel            bigint, 
	GueltigkeitszeitRegelNr             bigint, 
	ID_Tarifgebiet                      bigint, 
	Param                               text);

CREATE TABLE Interpretationen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	Interpretationsschluessel           text, 
	Wert                                text);

CREATE TABLE Kalender(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Betriebstag                      datetime, 
	ID_Betriebstagesart                 bigint, 
	ReferenzExtern                      text);

CREATE TABLE Linien(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Linie                            bigint, 
	ID_Weg_Hin                          bigint, 
	ID_Weg_Rueck                        bigint, 
	Bezeichnung                         text, 
	ID_Konzessionaer                    bigint, 
	ID_Bediengebiet                     bigint, 
	ReferenzExtern                      text);

CREATE TABLE Mwst(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Mwst                             bigint, 
	MwstSatz                            numeric, 
	Bezeichnung                         text, 
	ReferenzExtern                      text, 
	KA_Mwst                             bigint);

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
	Zahlgrenzen                         bigint);

CREATE TABLE OrtspunktStreckencode(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ortspunkt                        bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Streckencode                     bigint, 
	ID_Streckencodetyp                  bigint, 
	ReferenzExtern                      text);

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
	YKoordWgs84                         real);

CREATE TABLE OrtspunkteKA(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Ortspunkt                        bigint, 
	KA_OrtOrgID                         bigint, 
	KA_OrtTyp                           bigint, 
	KA_OrtNummer                        bigint, 
	ReferenzExtern                      text);

CREATE TABLE OrtspunkteTG(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_OrtspunktTG                      bigint, 
	ID_Ortspunkt                        bigint, 
	ID_Tarifgebiet                      bigint, 
	Bezeichnung                         text, 
	BezeichnungKurz                     text, 
	BezeichnungDruck                    text, 
	ReferenzExtern                      text);

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
	KA_Mitnahme2MaxAnzahl               bigint);

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
	ReferenzExtern                      text);

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
	KA_Preisstufe                       bigint);

CREATE TABLE PreisstufenErmittlungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_PreisstufenErmittlung            bigint, 
	ID_Preisstufe                       bigint, 
	ID_Ermittlungseinheit               bigint, 
	Von                                 bigint, 
	Bis                                 bigint, 
	Schritt                             bigint, 
	Bezeichnung                         text);

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
	ReferenzExtern                      text);

CREATE TABLE RaeumlicheGueltigkeit(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_RaeumlicheGueltigkeit            bigint, 
	ID_Tarifpunktmenge                  bigint, 
	KA_GueltigkeitsraumOriginaer        text, 
	KA_GueltigkeitsraumAlternativ       text, 
	ReferenzExtern                      text);

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
	ID_Druckregelung                    bigint);

CREATE TABLE Relationscodegruppen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relcodegruppentyp                bigint, 
	ID_Relcodegruppe                    bigint, 
	Gruppennummer                       bigint, 
	ID_Relcode                          bigint);

CREATE TABLE Relationscodes(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relcode                          bigint, 
	ID_Tarifpunkt                       bigint);

CREATE TABLE Relationszuordnungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Relationszuordung                bigint, 
	ID_Relation                         bigint, 
	ID_Teilrelation                     bigint, 
	SortOrder                           bigint);

CREATE TABLE Sorten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sorte                            bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Sortentyp                        bigint, 
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
	KA_Serviceklasse                    bigint);

CREATE TABLE SortenTarifarten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sorte                            bigint, 
	ID_Tarifart                         bigint);

CREATE TABLE Sortengruppen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Sortengruppe                     bigint, 
	ID_Sortengruppentyp                 bigint, 
	ID_Bediengebiet                     bigint, 
	SortOrder                           bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE SortengruppenElemente(
	Deaktiviert                         integer, 
	ID_SortengruppenElement             bigint, 
	ID_Zeitraum                         bigint, 
	ID_Sortengruppe                     bigint, 
	SortOrder                           bigint, 
	ID_Sorte                            bigint, 
	ID_Preisstufe                       bigint);

CREATE TABLE SortengruppenErmittlungen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_SortengruppenErmittlung          bigint, 
	ID_Sortengruppe                     bigint, 
	ID_Tarifpunktmenge                  bigint, 
	ID_TagesartVon                      bigint, 
	StartVon                            , 
	StartBis                            , 
	DauerMax                            , 
	Ueberhang                           , 
	SortOrder                           bigint, 
	Bezeichnung                         text);

CREATE TABLE Strecke(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Strecke                          bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_StreckencodeStart                bigint, 
	ID_StreckencodeZiel                 bigint, 
	Entfernung                          bigint, 
	ID_Streckenvia                      bigint, 
	ID_Streckenart                      bigint, 
	ReferenzExtern                      text);

CREATE TABLE Streckencode(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Streckencode                     bigint, 
	ID_Tarifpunkt                       bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Streckencodetyp                  bigint, 
	ReferenzExtern                      text);

CREATE TABLE Streckenvias(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Streckenvia                      bigint, 
	ID_Tarifgebiet                      bigint, 
	Anzeigetext                         text, 
	ReferenzExtern                      text);

CREATE TABLE Streckenzuordnung(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Strecke                          bigint, 
	ID_Teilrelation                     bigint, 
	ID_Tarifgebiet                      bigint, 
	ReferenzExtern                      text);

CREATE TABLE TagesartMerkmalElemente(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_TagesartMerkmalElement           bigint, 
	ID_Betriebstagesart                 bigint, 
	ID_TagesmerkmalElement              bigint, 
	ReferenzExtern                      text);

CREATE TABLE Tagesarten(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Betriebstagesart                 bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE TagesmerkmalElemente(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_TagesmerkmalElement              bigint, 
	ID_Tagesmerkmal                     bigint, 
	Bezeichnung                         varchar(250), 
	ReferenzExtern                      text);

CREATE TABLE Tagesmerkmale(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tagesmerkmal                     bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE Tarifarten(
	ID_Zeitraum                         bigint, 
	ID_Tarifart                         bigint, 
	Bezeichnung                         text, 
	ID_Tarifgebiet                      bigint, 
	ReferenzExtern                      text);

CREATE TABLE Tarifgebiete(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifgebiet                      bigint, 
	BezeichnungKurz                     text, 
	Bezeichnung                         text, 
	Erstellungsdatum                    datetime, 
	Version                             text, 
	ReferenzExtern                      text);

CREATE TABLE Tarifpunkte(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifpunkt                       bigint, 
	ID_Tarifgebiet                      bigint, 
	ID_Tarifpunkttyp                    bigint, 
	Bezeichnung                         text, 
	BezeichnungDruck                    text, 
	ID_TarifpunktReferenz               bigint, 
	ReferenzExtern                      text);

CREATE TABLE TarifpunktmengeElemente(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_TarifpunktmengeElement           bigint, 
	ID_Tarifpunktmenge                  bigint, 
	ID_Tarifpunkt                       bigint, 
	SortOrder                           bigint);

CREATE TABLE Tarifpunktmengen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Tarifpunktmenge                  bigint, 
	ReferenzExtern                      text);

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
	ID_Ortspunkt                        bigint, 
	ID_Sortengruppe                     bigint, 
	Standortwahl_ID_Bediengebiet        bigint, 
	ID_TarifrelevanterpunktReferenz     bigint);

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
	ReferenzExtern                      text);

CREATE TABLE Unternehmen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Unternehmen                      bigint, 
	BezeichnungKurz                     text, 
	Bezeichnung                         text, 
	Mandant                             integer, 
	ReferenzExtern                      text);

CREATE TABLE Updateinfo(
	Updatetime                          datetime, 
	Filename                            text, 
	Purpose                             text);

CREATE TABLE VersionInhalt(
	DatenversionInhalt                  text, 
	Testdaten                           integer, 
	Erstellungsdatum                    datetime, 
	Lieferant                           text, 
	Kommentar                           text);

CREATE TABLE VersionStruktur(
	VersionMajor                        bigint, 
	VersionMinor                        bigint, 
	VersionPatch                        bigint, 
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
	BezeichnungRueckDruck               text);

CREATE TABLE Wege(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Weg                              bigint, 
	Bezeichnung                         text, 
	ReferenzExtern                      text);

CREATE TABLE Wegpositionen(
	Deaktiviert                         integer, 
	ID_Zeitraum                         bigint, 
	ID_Wegposition                      bigint, 
	ID_Weg                              bigint, 
	SortOrder                           bigint, 
	ID_Ortspunkt                        bigint, 
	ID_Bediengebiet                     bigint, 
	Entfernung                          bigint, 
	Fangbereich                         bigint);

CREATE TABLE Zeitraeume(
	ID_Zeitraum                         bigint, 
	ZeitraumVon                         datetime, 
	ZeitraumBis                         datetime, 
	DatenversionZeitraum                text, 
	HauptZeitraumNr                     bigint, 
	SubZeitraumNr                       bigint);

CREATE TABLE Zeitraumoptionen(
	ID_Zeitraum                         bigint, 
	Option                              varchar(250), 
	Wert                                text);

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
	Direktverkauf                       integer);

CREATE TABLE DynAttributDef(
	ID_DynAttributDef                   bigint, 
	Name                                text, 
	DynAttributTyp                      text);

CREATE TABLE DynAttributWert(
	ID_Zeitraum                         bigint, 
	ID_DynAttributDef                   bigint, 
	Tabellennummer                      bigint, 
	ID_DatensatzRef                     bigint, 
	Lang                                varchar(2), 
	Wert                                text);

CREATE TABLE Sprachtexte(
	ID_Sprachtext                       text, 
	Lang                                varchar(2), 
	Text                                text);

CREATE TABLE Tabelleninfo(
	Tabellenname                        text, 
	Tabellennummer                      bigint, 
	Strukturname                        text);

INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Bediengebiete", 1, "Bediengebiete_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefBundeslaender", 2, "DefBundesland_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefErmittlungseinheit", 59, "DefErmittlungseinheit_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefFahrgasttypen", 3, "DefFahrgasttyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefKomfortklassen", 4, "DefKomfortklasse_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefOTPTypen", 6, "DefOTPTyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefOrtspunkttypen", 5, "DefOrtspunkttyp_Type"); 
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
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefSortentypen", 19, "DefSortentyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefStreckenart", 62, "DefStreckenart_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefStreckencodetyp", 63, "DefStreckencodetyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefTarifpunkttypen", 20, "DefTarifpunkttyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefVertriebswege", 21, "DefVertriebswege_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefWaehrungen", 22, "DefWaehrung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("DefZahlungsarten", 23, "DefZahlungsarten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Feiertage", 24, "Feiertage_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Gleichstellung", 70, "Gleichstellung_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Gleichstellungstyp", 68, "Gleichstellungstyp_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("GueltigkeitszeitRegeln", 57, "GueltigkeitszeitRegeln_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Kalender", 25, "Kalender_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Linien", 26, "Linien_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Mwst", 27, "Mwst_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Nachbarhaltestellen", 28, "Nachbarhaltestellen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("OrtspunkteKA", 30, "OrtspunkteKA_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("OrtspunkteTG", 31, "OrtspunkteTG_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Ortspunkte", 29, "Ortspunkte_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preise", 32, "Preise_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preisspalten", 33, "Preisspalten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("PreisstufenErmittlungen", 60, "PreisstufenErmittlungen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preisstufen", 34, "Preisstufen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Preisstufendirektwahl", 35, "Preisstufendirektwahl_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("RaeumlicheGueltigkeit", 36, "RaeumlicheGueltigkeit_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Relationen", 37, "Relationen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Relationscodegruppen", 38, "Relationscodegruppen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Relationszuordnungen", 39, "Relationszuordnungen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Sorten", 40, "Sorten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("SortengruppenElemente", 58, "SortengruppenElemente_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("SortengruppenErmittlungen", 61, "SortengruppenErmittlungen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Sortengruppen", 41, "Sortengruppen_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Strecke", 66, "Strecke_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Streckenvias", 71, "Streckenvias_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("TagesartMerkmalElemente", 43, "TagesartMerkmalElemente_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tagesarten", 42, "Tagesarten_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("TagesmerkmalElemente", 45, "TagesmerkmalElemente_Type"); 
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname) VALUES ("Tagesmerkmale", 44, "Tagesmerkmale_Type"); 
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
INSERT INTO VersionStruktur (VersionMajor, VersionMinor, VersionPatch, Status, Aenderungsdatum) VALUES (3, 2, 0, "in Arbeit", "2023-02-14"); 
