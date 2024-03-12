/************************************************************************************
* HUSST Versorgungsdaten
*
* automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank
* generiert am 2024-03-12
*
* HUSST Datenversorgung (V3.5.0-Release vom 2024-03-08)
*
*************************************************************************************/

CREATE TABLE Bearbeitung(
Bearbeitungsdatum                  datetime NOT NULL,
Lieferant                          text NOT NULL,
Kommentar                          text,
PRIMARY KEY(Bearbeitungsdatum ASC,Lieferant ASC));

CREATE TABLE Bediengebiete(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Bediengebiet                    bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Bediengebiet ASC,ID_Zeitraum ASC));

CREATE TABLE DefBundeslaender(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Bundesland                      bigint NOT NULL,
Iso                                text,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Bundesland ASC,ID_Zeitraum ASC));

CREATE TABLE DefErmittlungseinheit(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Ermittlungseinheit              bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Ermittlungseinheit ASC,ID_Zeitraum ASC));

CREATE TABLE DefFahrgasttypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Fahrgasttyp                     bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Fahrgasttyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefKomfortklassen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Komfortklasse                   bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Komfortklasse ASC,ID_Zeitraum ASC));

CREATE TABLE DefNachbarhaltestellenbeziehungen(
Deaktiviert                        integer,
ID_Nachbarhaltestellenbeziehung    bigint NOT NULL,
ID_Zeitraum                        bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Nachbarhaltestellenbeziehung ASC,ID_Zeitraum ASC));

CREATE TABLE DefOTPTypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_OTPTyp                          bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_OTPTyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefOrtspunkttypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Ortspunkttyp                    bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Ortspunkttyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefPreisfindungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Preisfindung                    bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Preisfindung ASC,ID_Zeitraum ASC));

CREATE TABLE DefPreisquellen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Preisquelle                     bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Preisquelle ASC,ID_Zeitraum ASC));

CREATE TABLE DefPreisspaltentypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Preisspaltentyp                 bigint NOT NULL,
Kennung                            text,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Preisspaltentyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefRabattklassen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Rabattklasse                    bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Rabattklasse ASC,ID_Zeitraum ASC));

CREATE TABLE DefReisetypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Reisetyp                        bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Reisetyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefRelationenberechnungsregelungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relationenberechnungsregelung   bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Relationenberechnungsregelung ASC,ID_Zeitraum ASC));

CREATE TABLE DefRelationendruckregelungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relationendruckregelung         bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Relationendruckregelung ASC,ID_Zeitraum ASC));

CREATE TABLE DefRelationscodegruppentypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relcodegruppentyp               bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Relcodegruppentyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefSortenausgaberegelungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sortenausgaberegelung           bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Sortenausgaberegelung ASC,ID_Zeitraum ASC));

CREATE TABLE DefSortendruckregelungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sortendruckregelung             bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Sortendruckregelung ASC,ID_Zeitraum ASC));

CREATE TABLE DefSortengruppentypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sortengruppentyp                bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Sortengruppentyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefSortentypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sortentyp                       bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Sortentyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefStreckenart(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Streckenart                     bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Streckenart ASC,ID_Zeitraum ASC));

CREATE TABLE DefStreckencodetyp(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Streckencodetyp                 bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Streckencodetyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefTarifpunkttypen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Tarifpunkttyp                   bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Tarifpunkttyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefVertriebswege(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Vertriebswege                   bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Vertriebswege ASC,ID_Zeitraum ASC));

CREATE TABLE DefWaehrungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Waehrung                        bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Waehrung ASC,ID_Zeitraum ASC));

CREATE TABLE DefZahlgrenzentyp(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Zahlgrenzentyp                  bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Zahlgrenzentyp ASC,ID_Zeitraum ASC));

CREATE TABLE DefZahlungsarten(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Zahlungsarten                   bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Zahlungsarten ASC,ID_Zeitraum ASC));

CREATE TABLE Feiertage(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Feiertag                        bigint NOT NULL,
ID_Bundesland                      bigint NOT NULL,
Datum                              datetime NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_Feiertag ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Feiertage ON Feiertage(Datum ASC,ID_Bundesland ASC,ID_Zeitraum ASC);

CREATE TABLE Gleichstellung(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Gleichstellung                  bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Streckencode                    bigint NOT NULL,
ID_StreckencodeGleichstellung      bigint NOT NULL,
ID_Gleichstellungstyp              bigint NOT NULL,
EntfernungAb                       bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Gleichstellung ASC,ID_Zeitraum ASC));

CREATE TABLE GleichstellungTarifart(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Gleichstellungstyp              bigint NOT NULL,
ID_Tarifart                        bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ReferenzExtern                     text,
PRIMARY KEY(ID_Gleichstellungstyp ASC,ID_Tarifart ASC,ID_Zeitraum ASC));

CREATE TABLE Gleichstellungstyp(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Gleichstellungstyp              bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Gleichstellungstyp ASC,ID_Zeitraum ASC));

CREATE TABLE GueltigkeitszeitRegeln(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_GueltigkeitszeitRegel           bigint NOT NULL,
GueltigkeitszeitRegelNr            bigint NOT NULL,
ID_Tarifgebiet                     bigint,
Param                              text,
PRIMARY KEY(ID_GueltigkeitszeitRegel ASC,ID_Zeitraum ASC));

CREATE TABLE Interpretationen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
Interpretationsschluessel          text NOT NULL,
Wert                               text,
PRIMARY KEY(Interpretationsschluessel ASC,ID_Zeitraum ASC));

CREATE TABLE Kalender(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Betriebstag                     datetime NOT NULL,
ID_Betriebstagesart                bigint NOT NULL,
ReferenzExtern                     text,
PRIMARY KEY(ID_Betriebstag ASC,ID_Zeitraum ASC));

CREATE TABLE Linien(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Linie                           bigint NOT NULL,
ID_Weg_Hin                         bigint,
ID_Weg_Rueck                       bigint,
Bezeichnung                        text,
ID_Konzessionaer                   bigint,
ID_Bediengebiet                    bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Linie ASC,ID_Zeitraum ASC));

CREATE TABLE Mwst(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Mwst                            bigint NOT NULL,
MwstSatz                           numeric,
Bezeichnung                        text,
ReferenzExtern                     text,
KA_Mwst                            bigint,
PRIMARY KEY(ID_Mwst ASC,ID_Zeitraum ASC));

CREATE TABLE Nachbarhaltestellen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Nachbarhaltestelle              bigint NOT NULL,
ID_Bediengebiet                    bigint,
ID_Nachbarhaltestellenbeziehung    bigint,
ID_OrtspunktVon                    bigint NOT NULL,
ID_OrtspunktNach                   bigint,
SortOrder                          bigint,
ID_Via                             bigint,
ID_Tarifart                        bigint,
ID_Tarifgebiet                     bigint,
ID_Preisstufe                      bigint,
Zahlgrenzen                        bigint,
ID_Zahlgrenzentyp                  bigint,
PRIMARY KEY(ID_Nachbarhaltestelle ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Nachbarhaltestellen ON Nachbarhaltestellen(ID_OrtspunktVon ASC,ID_OrtspunktNach ASC,ID_Zeitraum ASC,ID_Bediengebiet ASC,ID_Nachbarhaltestellenbeziehung ASC,ID_Via ASC,ID_Tarifart ASC,Zahlgrenzen ASC,ID_Zahlgrenzentyp ASC);

CREATE TABLE OrtspunktStreckencode(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Ortspunkt                       bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Streckencode                    bigint NOT NULL,
ID_Streckencodetyp                 bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Ortspunkt ASC,ID_Tarifgebiet ASC,ID_Zeitraum ASC));

CREATE TABLE Ortspunkte(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Ortspunkt                       bigint NOT NULL,
ID_Ortspunkttyp                    bigint NOT NULL,
Ortsnummer                         bigint NOT NULL,
ID_Relcode                         bigint,
IBISnr                             text,
ID_Bundesland                      bigint,
Gemeindekennziffer                 text,
Bezeichnung                        text,
BezeichnungKurz                    text,
BezeichnungDruck                   text,
ReferenzExtern                     text,
ID_Bediengebiet                    bigint,
ID_OrtspunktReferenz               bigint,
XKoordWgs84                        real,
YKoordWgs84                        real,
PRIMARY KEY(ID_Ortspunkt ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Ortspunkte ON Ortspunkte(Ortsnummer ASC,ID_Ortspunkttyp ASC,ID_Zeitraum ASC);

CREATE TABLE OrtspunkteKA(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_OrtspunktKA                     bigint NOT NULL,
ID_Ortspunkt                       bigint NOT NULL,
KA_OrtOrgID                        bigint,
KA_OrtTyp                          bigint,
KA_OrtNummer                       bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_OrtspunktKA ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_OrtspunkteKA ON OrtspunkteKA(ID_Ortspunkt ASC,KA_OrtOrgID ASC,ID_Zeitraum ASC);

CREATE TABLE OrtspunkteTG(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_OrtspunktTG                     bigint NOT NULL,
ID_Ortspunkt                       bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
Bezeichnung                        text,
BezeichnungKurz                    text,
BezeichnungDruck                   text,
ReferenzExtern                     text,
PRIMARY KEY(ID_OrtspunktTG ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_OrtspunkteTG ON OrtspunkteTG(ID_Ortspunkt ASC,ID_Tarifgebiet ASC,ID_Zeitraum ASC);

CREATE TABLE Preise(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Preis                           bigint NOT NULL,
ID_Sorte                           bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Preisstufe                      bigint NOT NULL,
ID_Preisspalte                     bigint NOT NULL,
ReferenzExtern                     text,
Preis                              bigint,
PreisstufenbezeichnungKurz         text,
Preisstufenbezeichnung             text,
ID_Mwst                            bigint,
ID_PreisstufeReferenz              bigint,
ID_GueltigkeitszeitRegel           bigint,
ID_RaeumlicheGueltigkeit           bigint,
KA_ProdOrgID                       bigint,
KA_ProdNr                          bigint,
KA_Rabatttyp                       bigint,
KA_Mitnahme1Typ                    bigint,
KA_Mitnahme1MinAnzahl              bigint,
KA_Mitnahme1MaxAnzahl              bigint,
KA_Mitnahme2Typ                    bigint,
KA_Mitnahme2MinAnzahl              bigint,
KA_Mitnahme2MaxAnzahl              bigint,
PRIMARY KEY(ID_Preis ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Preise ON Preise(ID_Preisstufe ASC,ID_Sorte ASC,ID_Preisspalte ASC,ID_Zeitraum ASC);

CREATE TABLE Preisspalten(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Preisspalte                     bigint NOT NULL,
ID_Waehrung                        bigint NOT NULL,
ID_Tarifgebiet                     bigint,
ID_Preisspaltentyp                 bigint,
Bezeichnung                        text,
BezeichnungKurz                    text,
Hinweis                            text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Preisspalte ASC,ID_Zeitraum ASC));

CREATE TABLE Preisstufen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Preisstufe                      bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
Preisstufennummer                  bigint,
ReferenzExtern                     text,
BezeichnungKurz                    text,
Bezeichnung                        text,
WegstreckeInMetern                 bigint,
ID_Mwst                            bigint,
UpgradeStopp                       integer,
SortOrder                          bigint,
KA_Preisstufe                      bigint,
PRIMARY KEY(ID_Preisstufe ASC,ID_Zeitraum ASC));

CREATE TABLE PreisstufenErmittlungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_PreisstufenErmittlung           bigint NOT NULL,
ID_Preisstufe                      bigint NOT NULL,
ID_Ermittlungseinheit              bigint NOT NULL,
Von                                bigint NOT NULL,
Bis                                bigint,
Schritt                            bigint NOT NULL,
Bezeichnung                        text,
PRIMARY KEY(ID_PreisstufenErmittlung ASC,ID_Zeitraum ASC));

CREATE TABLE Preisstufendirektwahl(
Deaktiviert                        integer,
ID_Preisstufendirektwahl           bigint NOT NULL,
ID_Zeitraum                        bigint NOT NULL,
Direktwahlschluessel               text NOT NULL,
ID_Tarifart                        bigint NOT NULL,
ID_Preisstufe                      bigint NOT NULL,
Bezeichnung                        text,
BezeichnungDruck                   text,
ID_Relation                        bigint,
ID_Vertriebswege                   bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Preisstufendirektwahl ASC,ID_Zeitraum ASC));

CREATE TABLE RaeumlicheGueltigkeit(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_RaeumlicheGueltigkeit           bigint NOT NULL,
ID_Tarifpunktmenge                 bigint,
KA_GueltigkeitsraumOriginaer       text,
KA_GueltigkeitsraumAlternativ      text,
ReferenzExtern                     text,
PRIMARY KEY(ID_RaeumlicheGueltigkeit ASC,ID_Zeitraum ASC));

CREATE TABLE Relationen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relation                        bigint NOT NULL,
ID_RelcodeStart                    bigint NOT NULL,
ID_RelcodeZiel                     bigint NOT NULL,
SortOrder                          bigint NOT NULL,
GegenrichtungLiegtVor              integer,
ID_Vertriebswege                   bigint,
ID_Via                             bigint,
ID_Berechnungsregelung             bigint,
ID_Druckregelung                   bigint,
PRIMARY KEY(ID_Relation ASC,ID_Zeitraum ASC));

CREATE TABLE Relationscodegruppen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relcodegruppentyp               bigint NOT NULL,
ID_Relcodegruppe                   bigint NOT NULL,
Gruppennummer                      bigint NOT NULL,
ID_Relcode                         bigint NOT NULL,
PRIMARY KEY(ID_Relcodegruppe ASC,ID_Zeitraum ASC));

CREATE TABLE Relationscodes(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relcode                         bigint NOT NULL,
ID_Tarifpunkt                      bigint NOT NULL,
PRIMARY KEY(ID_Relcode ASC,ID_Zeitraum ASC,ID_Tarifpunkt ASC));

CREATE TABLE Relationszuordnungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Relationszuordung               bigint NOT NULL,
ID_Relation                        bigint NOT NULL,
ID_Teilrelation                    bigint NOT NULL,
SortOrder                          bigint NOT NULL,
PRIMARY KEY(ID_Relationszuordung ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Relationszuordnungen ON Relationszuordnungen(ID_Teilrelation ASC,ID_Relation ASC,ID_Relationszuordung ASC,ID_Zeitraum ASC);

CREATE TABLE Sorten(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sorte                           bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Sortentyp                       bigint NOT NULL,
ReferenzExtern                     text,
BezeichnungKurz                    text,
Bezeichnung                        text,
ID_Ausgaberegelung                 bigint,
ID_Druckregelung                   bigint,
Layout                             text,
ID_Vertriebswege                   bigint,
ID_Mwst                            bigint,
ID_Zahlungsarten                   bigint,
ID_Komfortklasse                   bigint,
ID_Rabattklasse                    bigint,
ID_Fahrgasttyp                     bigint,
Mindestpersonenanzahl              bigint,
Hoechstpersonenanzahl              bigint,
ID_GueltigkeitszeitRegel           bigint,
ID_Preisfindung                    bigint,
ID_Reisetyp                        bigint,
BezeichnungDruck                   text,
KA_ProdOrgID                       bigint,
KA_ProdNr                          bigint,
KA_Infotext                        text,
KA_Fahrgasttyp                     bigint,
KA_Verkehrsmittel                  bigint,
KA_Serviceklasse                   bigint,
PRIMARY KEY(ID_Sorte ASC,ID_Zeitraum ASC));

CREATE TABLE SortenTarifarten(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sorte                           bigint NOT NULL,
ID_Tarifart                        bigint NOT NULL,
PRIMARY KEY(ID_Sorte ASC,ID_Tarifart ASC,ID_Zeitraum ASC));

CREATE TABLE Sortengruppen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Sortengruppe                    bigint NOT NULL,
ID_Sortengruppentyp                bigint NOT NULL,
ID_Bediengebiet                    bigint NOT NULL,
SortOrder                          bigint,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Sortengruppe ASC,ID_Zeitraum ASC));

CREATE TABLE SortengruppenElemente(
Deaktiviert                        integer,
ID_SortengruppenElement            bigint NOT NULL,
ID_Zeitraum                        bigint NOT NULL,
ID_Sortengruppe                    bigint NOT NULL,
SortOrder                          bigint,
ID_Sorte                           bigint NOT NULL,
ID_Preisstufe                      bigint,
PRIMARY KEY(ID_SortengruppenElement ASC,ID_Zeitraum ASC));

CREATE TABLE SortengruppenErmittlungen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_SortengruppenErmittlung         bigint NOT NULL,
ID_Sortengruppe                    bigint NOT NULL,
ID_Tarifpunktmenge                 bigint,
ID_TagesartVon                     bigint,
StartVon                            NOT NULL,
StartBis                            NOT NULL,
DauerMax                            NOT NULL,
Ueberhang                          ,
SortOrder                          bigint,
Bezeichnung                        text,
PRIMARY KEY(ID_SortengruppenErmittlung ASC,ID_Zeitraum ASC));

CREATE TABLE Strecke(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Strecke                         bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_StreckencodeStart               bigint NOT NULL,
ID_StreckencodeZiel                bigint NOT NULL,
Entfernung                         bigint NOT NULL,
SortOrder                          bigint,
ID_Via                             bigint,
ID_Streckenart                     bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Strecke ASC,ID_Zeitraum ASC));

CREATE TABLE Streckencode(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Streckencode                    bigint NOT NULL,
ID_Tarifpunkt                      bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Streckencodetyp                 bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Streckencode ASC,ID_Tarifpunkt ASC,ID_Zeitraum ASC));

CREATE TABLE Streckenzuordnung(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Strecke                         bigint NOT NULL,
ID_Teilrelation                    bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ReferenzExtern                     text,
PRIMARY KEY(ID_Strecke ASC,ID_Teilrelation ASC,ID_Zeitraum ASC));

CREATE TABLE TagesartMerkmalElemente(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_TagesartMerkmalElement          bigint NOT NULL,
ID_Betriebstagesart                bigint NOT NULL,
ID_TagesmerkmalElement             bigint NOT NULL,
ReferenzExtern                     text,
PRIMARY KEY(ID_TagesartMerkmalElement ASC,ID_Zeitraum ASC));

CREATE TABLE Tagesarten(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Betriebstagesart                bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Betriebstagesart ASC,ID_Zeitraum ASC));

CREATE TABLE TagesmerkmalElemente(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_TagesmerkmalElement             bigint NOT NULL,
ID_Tagesmerkmal                    bigint NOT NULL,
Bezeichnung                        varchar(250) NOT NULL,
ReferenzExtern                     text,
PRIMARY KEY(ID_TagesmerkmalElement ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_TagesmerkmalElemente ON TagesmerkmalElemente(ID_Tagesmerkmal ASC,Bezeichnung ASC,ID_Zeitraum ASC);

CREATE TABLE Tagesmerkmale(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Tagesmerkmal                    bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Tagesmerkmal ASC,ID_Zeitraum ASC));

CREATE TABLE Tarifarten(
ID_Zeitraum                        bigint NOT NULL,
ID_Tarifart                        bigint NOT NULL,
Bezeichnung                        text,
ID_Tarifgebiet                     bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Tarifart ASC,ID_Zeitraum ASC));

CREATE TABLE Tarifgebiete(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
BezeichnungKurz                    text,
Bezeichnung                        text,
Erstellungsdatum                   datetime,
Version                            text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Tarifgebiet ASC,ID_Zeitraum ASC));

CREATE TABLE Tarifpunkte(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Tarifpunkt                      bigint NOT NULL,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Tarifpunkttyp                   bigint,
Bezeichnung                        text,
BezeichnungDruck                   text,
ID_TarifpunktReferenz              bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Tarifpunkt ASC,ID_Zeitraum ASC));

CREATE TABLE TarifpunktmengeElemente(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_TarifpunktmengeElement          bigint NOT NULL,
ID_Tarifpunktmenge                 bigint NOT NULL,
ID_Tarifpunkt                      bigint NOT NULL,
SortOrder                          bigint,
PRIMARY KEY(ID_TarifpunktmengeElement ASC,ID_Zeitraum ASC));

CREATE TABLE Tarifpunktmengen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Tarifpunktmenge                 bigint NOT NULL,
ReferenzExtern                     text,
PRIMARY KEY(ID_Tarifpunktmenge ASC,ID_Zeitraum ASC));

CREATE TABLE Tarifrelevantepunkte(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Tarifrelevanterpunkt            bigint NOT NULL,
ID_OTPTyp                          bigint NOT NULL,
ID_Bediengebiet                    bigint NOT NULL,
Bezeichnung                        text NOT NULL,
SortOrder                          bigint NOT NULL,
ID_Relcode                         bigint,
ID_Bundesland                      bigint,
ID_Ortspunkt                       bigint,
ID_Sortengruppe                    bigint,
Standortwahl_ID_Bediengebiet       bigint,
ID_TarifrelevanterpunktReferenz    bigint,
PRIMARY KEY(ID_Tarifrelevanterpunkt ASC,ID_Zeitraum ASC));

CREATE TABLE Teilrelationen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Teilrelation                    bigint NOT NULL,
ID_Tarifart                        bigint NOT NULL,
ID_TarifpunktStart                 bigint NOT NULL,
TarifpunktbezeichnungStart         text,
ID_TarifpunktZiel                  bigint NOT NULL,
TarifpunktbezeichnungZiel          text,
ID_Tarifgebiet                     bigint NOT NULL,
ID_Preisstufe                      bigint NOT NULL,
ID_Preisquelle                     bigint,
ID_Komfortklasse                   bigint,
AlternativePreisGruppe             bigint,
EinnahmeAufteilung                 text,
ViabezeichnungDruck                text,
ViabezeichnungRueckDruck           text,
ID_RaeumlicheGueltigkeit           bigint,
ID_RaeumlicheGueltigkeit_Rueck     bigint,
ID_Linie                           bigint,
ReferenzExtern                     text,
PRIMARY KEY(ID_Teilrelation ASC,ID_Zeitraum ASC));

CREATE TABLE Unternehmen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Unternehmen                     bigint NOT NULL,
BezeichnungKurz                    text,
Bezeichnung                        text,
Mandant                            integer,
ReferenzExtern                     text,
PRIMARY KEY(ID_Unternehmen ASC,ID_Zeitraum ASC));

CREATE TABLE Updateinfo(
Updatetime                         datetime,
Filename                           text NOT NULL,
Purpose                            text,
PRIMARY KEY(Updatetime ASC,Filename ASC));

CREATE TABLE VersionInhalt(
DatenversionInhalt                 text NOT NULL,
Testdaten                          integer,
Erstellungsdatum                   datetime NOT NULL,
Lieferant                          text NOT NULL,
Kommentar                          text,
PRIMARY KEY(DatenversionInhalt ASC,Erstellungsdatum ASC,Lieferant ASC));

CREATE TABLE VersionStruktur(
VersionMajor                       bigint NOT NULL,
VersionMinor                       bigint NOT NULL,
VersionPatch                       bigint NOT NULL,
Status                             text,
Aenderungsdatum                    datetime,
Aenderungsautor                    text);

CREATE TABLE Vias(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Via                             bigint NOT NULL,
Bezeichnung                        text,
BezeichnungDruck                   text,
BezeichnungRueck                   text,
BezeichnungRueckDruck              text,
PRIMARY KEY(ID_Via ASC,ID_Zeitraum ASC));

CREATE TABLE Wege(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Weg                             bigint NOT NULL,
Bezeichnung                        text,
ReferenzExtern                     text,
PRIMARY KEY(ID_Weg ASC,ID_Zeitraum ASC));

CREATE TABLE Wegpositionen(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Wegposition                     bigint NOT NULL,
ID_Weg                             bigint NOT NULL,
SortOrder                          bigint NOT NULL,
ID_Ortspunkt                       bigint,
ID_Bediengebiet                    bigint,
Entfernung                         bigint,
Fangbereich                        bigint,
PRIMARY KEY(ID_Wegposition ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Wegpositionen ON Wegpositionen(ID_Weg ASC,SortOrder ASC,ID_Zeitraum ASC);

CREATE TABLE Zeitraeume(
ID_Zeitraum                        integer NOT NULL,
ZeitraumVon                        datetime,
ZeitraumBis                        datetime,
DatenversionZeitraum               text NOT NULL,
HauptZeitraumNr                    bigint NOT NULL,
SubZeitraumNr                      bigint NOT NULL,
PRIMARY KEY(ID_Zeitraum ASC));

CREATE TABLE Zeitraumoptionen(
ID_Zeitraum                        bigint NOT NULL,
Option                             varchar(250) NOT NULL,
Wert                               text,
PRIMARY KEY(Option ASC,ID_Zeitraum ASC));

CREATE TABLE Zusatzsorten(
Deaktiviert                        integer,
ID_Zeitraum                        bigint NOT NULL,
ID_Zusatzsorte                     bigint NOT NULL,
ID_Sorte                           bigint NOT NULL,
ZuordnungRelCodeGrp                varchar(1) NOT NULL,
Anbindung                          varchar(1),
Zusatzsortentyp                    bigint,
ID_Preisstufe                      bigint,
ID_PreisstufeGrenze                bigint,
Hinweistext                        text,
ID_SortengruppeHauptsorten         bigint,
ID_RelcodegruppeStart              bigint,
ID_RelcodegruppeZiel               bigint,
Direktverkauf                      integer,
PRIMARY KEY(ID_Zusatzsorte ASC,ID_Zeitraum ASC));
CREATE UNIQUE INDEX Uix_Zusatzsorten ON Zusatzsorten(ID_Sorte ASC,ZuordnungRelCodeGrp ASC,ID_Zeitraum ASC);

CREATE TABLE DynAttributDef(
ID_DynAttributDef                  integer NOT NULL,
Name                               text NOT NULL,
DynAttributTyp                     text NOT NULL,
PRIMARY KEY(ID_DynAttributDef ASC));

CREATE TABLE DynAttributWert(
ID_Zeitraum                        bigint NOT NULL,
ID_DynAttributDef                  bigint NOT NULL,
Tabellennummer                     bigint NOT NULL,
ID_DatensatzRef                    bigint NOT NULL,
Lang                               varchar(2),
Wert                               text,
PRIMARY KEY(ID_Zeitraum ASC,ID_DynAttributDef ASC,Tabellennummer ASC,ID_DatensatzRef ASC,Lang ASC));

CREATE TABLE Sprachtexte(
ID_Sprachtext                      text NOT NULL,
Lang                               varchar(2) NOT NULL,
Text                               text,
PRIMARY KEY(ID_Sprachtext ASC,Lang ASC));

CREATE TABLE Tabelleninfo(
Tabellenname                       text NOT NULL,
Tabellennummer                     integer NOT NULL,
Strukturname                       text,
PRIMARY KEY(Tabellennummer ASC));

INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Bediengebiete',1, 'Bediengebiete_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefBundeslaender',2, 'DefBundesland_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefErmittlungseinheit',59, 'DefErmittlungseinheit_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefFahrgasttypen',3, 'DefFahrgasttyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefKomfortklassen',4, 'DefKomfortklasse_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefOTPTypen',6, 'DefOTPTyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefOrtspunkttypen',5, 'DefOrtspunkttyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefPreisfindungen',7, 'DefPreisfindung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefPreisquellen',8, 'DefPreisquelle_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefPreisspaltentypen',9, 'DefPreisspaltentyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefRabattklassen',10, 'DefRabattklasse_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefReisetypen',11, 'DefReisetyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefRelationenberechnungsregelungen',12, 'DefRelationenberechnungsregelung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefRelationendruckregelungen',13, 'DefRelationendruckregelung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefRelationscodegruppentypen',14, 'DefRelationscodegruppentyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefSortenausgaberegelungen',15, 'DefSortenausgaberegelung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefSortendruckregelungen',16, 'DefSortendruckregelung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefSortengruppentypen',17, 'DefSortengruppentyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefSortentypen',19, 'DefSortentyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefStreckenart',62, 'DefStreckenart_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefStreckencodetyp',63, 'DefStreckencodetyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefTarifpunkttypen',20, 'DefTarifpunkttyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefVertriebswege',21, 'DefVertriebswege_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefWaehrungen',22, 'DefWaehrung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefZahlgrenzentyp',72, 'DefZahlgrenzentyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('DefZahlungsarten',23, 'DefZahlungsarten_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Feiertage',24, 'Feiertage_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Gleichstellung',70, 'Gleichstellung_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Gleichstellungstyp',68, 'Gleichstellungstyp_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('GueltigkeitszeitRegeln',57, 'GueltigkeitszeitRegeln_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Kalender',25, 'Kalender_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Linien',26, 'Linien_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Mwst',27, 'Mwst_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Nachbarhaltestellen',28, 'Nachbarhaltestellen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('OrtspunkteKA',30, 'OrtspunkteKA_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('OrtspunkteTG',31, 'OrtspunkteTG_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Ortspunkte',29, 'Ortspunkte_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Preise',32, 'Preise_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Preisspalten',33, 'Preisspalten_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('PreisstufenErmittlungen',60, 'PreisstufenErmittlungen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Preisstufen',34, 'Preisstufen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Preisstufendirektwahl',35, 'Preisstufendirektwahl_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('RaeumlicheGueltigkeit',36, 'RaeumlicheGueltigkeit_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Relationen',37, 'Relationen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Relationscodegruppen',38, 'Relationscodegruppen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Relationszuordnungen',39, 'Relationszuordnungen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Sorten',40, 'Sorten_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('SortengruppenElemente',58, 'SortengruppenElemente_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('SortengruppenErmittlungen',61, 'SortengruppenErmittlungen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Sortengruppen',41, 'Sortengruppen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Strecke',66, 'Strecke_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('TagesartMerkmalElemente',43, 'TagesartMerkmalElemente_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tagesarten',42, 'Tagesarten_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('TagesmerkmalElemente',45, 'TagesmerkmalElemente_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tagesmerkmale',44, 'Tagesmerkmale_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tarifarten',46, 'Tarifarten_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tarifgebiete',47, 'Tarifgebiete_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tarifpunkte',48, 'Tarifpunkte_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tarifpunktmengen',49, 'Tarifpunktmengen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Tarifrelevantepunkte',50, 'Tarifrelevantepunkte_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Teilrelationen',51, 'Teilrelationen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Unternehmen',52, 'Unternehmen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Vias',53, 'Vias_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Wege',54, 'Wege_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Wegpositionen',55, 'Wegpositionen_Type');
INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)VALUES ('Zusatzsorten',56, 'Zusatzsorten_Type');
INSERT INTO VersionStruktur (VersionMajor, VersionMinor, VersionPatch, Status, Aenderungsdatum)VALUES (3,5,0, 'Release', '2024-03-08');

-- otionals: husstEnum
INSERT INTO Zeitraeume(ID_Zeitraum, DatenversionZeitraum, HauptZeitraumNr, SubZeitraumNr) VALUES (1, 'husst.initial', 1, 1);
INSERT INTO DefBundeslaender(
ID_Zeitraum, ID_Bundesland, Iso, Bezeichnung) VALUES
  (1, 0, '', 'unbekannt')
, (1, 1, 'SH', 'Schleswig-Holstein (SH)')
, (1, 2, 'HH', 'Hamburg (HH)')
, (1, 3, 'NI', 'Niedersachsen (NI)')
, (1, 4, 'HB', 'Bremen (HB)')
, (1, 5, 'NW', 'Nordrhein-Westfalen (NW)')
, (1, 6, 'HE', 'Hessen (HE)')
, (1, 7, 'RP', 'Rheinland-Pfalz (RP)')
, (1, 8, 'BW', 'Baden-Württemberg (BW)')
, (1, 9, 'BY', 'Bayern (BY)')
, (1, 10, 'SL', 'Saarland (SL)')
, (1, 11, 'BE', 'Berlin (BE)')
, (1, 12, 'BB', 'Brandenburg (BB)')
, (1, 13, 'MV', 'Mecklenburg-Vorpommern (MV)')
, (1, 14, 'SN', 'Sachsen (SN)')
, (1, 15, 'ST', 'Sachsen-Anhalt (ST)')
, (1, 16, 'TH', 'Thüringen (TH)')
;
INSERT INTO DefErmittlungseinheit(
ID_Zeitraum, ID_Ermittlungseinheit, Bezeichnung) VALUES
  (1, 1, 'Minuten')
, (1, 2, 'Kilometer')
;
INSERT INTO DefFahrgasttypen(
ID_Zeitraum, ID_Fahrgasttyp, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
, (1, 1, 'Erwachsener')
, (1, 2, 'Kind')
, (1, 3, 'Student')
, (1, 5, 'Behinderter')
, (1, 6, 'Sehbehinderter')
, (1, 7, 'Hörgeschädigter')
, (1, 8, 'Arbeitsloser/Sozialhilfeempfänger')
, (1, 9, 'Personal')
, (1, 10, 'Militärangehöriger')
, (1, 19, 'Schüler')
, (1, 20, 'Azubi')
, (1, 25, 'Senior')
, (1, 64, 'ermäßigt')
, (1, 65, 'Fahrrad')
, (1, 66, 'Hund')
;
INSERT INTO DefKomfortklassen(
ID_Zeitraum, ID_Komfortklasse, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
, (1, 1, '1. Klasse')
, (1, 2, '2. Klasse')
, (1, 300, 'Übergang von der 2. zur 1. Klasse')
;
INSERT INTO DefNachbarhaltestellenbeziehungen(
ID_Nachbarhaltestellenbeziehung, ID_Zeitraum, Bezeichnung) VALUES
  (0, 1, 'nicht spezifiziert/unbestimmt')
, (1, 1, 'Kurzstrecke')
;
INSERT INTO DefOTPTypen(
ID_Zeitraum, ID_OTPTyp, Bezeichnung) VALUES
  (1, 1, 'Standort Zu jedem Tarifrelevantenpunkt vom OTPTyp Standort muss es einen eindeutigen Ortspunkt geben. (Über ID_Ortspunkt verwiesen) => Es darf kein Ortspunkt mit 2 oder mehr verwiesenden Tarifrelevantenpunkten vom OTPTyp Standort geben. Über diesen Ortspunkt ist der Standort eines Vertriebsgerätes synchronisierbar. Z.B. über seine IBISnr oder ReferenzExtern')
, (1, 2, 'Startpunkt')
, (1, 3, 'Zielpunkt')
;
INSERT INTO DefOrtspunkttypen(
ID_Zeitraum, ID_Ortspunkttyp, Bezeichnung) VALUES
  (1, 1, 'Haltestelle')
, (1, 2, 'Betriebshof')
, (1, 3, 'Zone/Wabe/Ring')
, (1, 5, 'Gemeinde')
;
INSERT INTO DefPreisfindungen(
ID_Zeitraum, ID_Preisfindung, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
, (1, 1, 'Festpreis')
, (1, 2, 'Relationsbezogen')
, (1, 6, 'Relationsbezogen mit Preisstufenupgrade')
, (1, 257, 'Festpreis mit freier Preiseingabe')
, (1, 258, 'Relationsbezogen mit freier Preiseingabe')
, (1, 262, 'Relationsbezogen mit Preisstufenupgrade und freier Preiseingabe')
;
INSERT INTO DefPreisspaltentypen(
ID_Zeitraum, ID_Preisspaltentyp, Bezeichnung) VALUES
  (1, 1, 'Standard / Standardpreisspalte für den allgemeinen Verkauf')
;
INSERT INTO DefRabattklassen(
ID_Zeitraum, ID_Rabattklasse, Bezeichnung) VALUES
  (1, 0, 'Keine Ermäßigung')
, (1, 1, 'prozentuale Ermäßigung Level-1 (z.B. Bahncard 25)')
, (1, 2, 'prozentuale Ermäßigung18 Level-2 (z.B. Bahncard 50)')
, (1, 3, 'prozentuale Ermäßigung Level-3')
, (1, 4, 'prozentuale Ermäßigung Level-4')
, (1, 5, 'prozentuale Ermäßigung Level-5')
, (1, 6, 'Ermäßigung auf Basis gefahrener Kilometer')
, (1, 46, 'Ermäßigung des Ticketkaufs mit KA-Bezahlberechtigung um 25%')
;
INSERT INTO DefReisetypen(
ID_Zeitraum, ID_Reisetyp, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
, (1, 1, 'Standard (passend zum Sortentyp)')
, (1, 2, 'Hin- und Rückfahrt')
, (1, 3, 'Rundreise')
;
INSERT INTO DefRelationenberechnungsregelungen(
ID_Zeitraum, ID_Relationenberechnungsregelung, Bezeichnung) VALUES
  (1, 1, 'Standard. Alle Teilrelationen sind gleichwertig und haben verschiedene Tarifarten und oder Tarifgebiete. Die gewählte Sorte entscheidet, welche Teilrelation genutzt wird.')
, (1, 2, 'Sortorder1 Die Teilrelation mit Sortorder 1 muss bepreist werden, die anderen Teilrelationen werden zusätzlich registriert. Die Teilrelationen können aus verschiedenen Tarifgebieten sein und / oder verschiedene Tarifarten aufweisen.')
, (1, 3, 'AdditionPreise Die Preise aller Teilrelationen werden addiert, es werden alle Teilrelationen registriert. Die Teilrelationen können aus verschiedenen Tarifgebieten sein und / oder verschiedene Tarifarten aufweisen. Für die Bepreisung muss eine Sortengruppe zur Verfügung stehen, in der jeweils eine Sorte zu mindestens einer Teilrelation passt.')
, (1, 4, 'AdditionPreisstufen Die gewählte Sorte entscheidet über ihre Tarifart(en), welche Teilrelation(en) für die Preisfindung und die Registrierung verwendet werden. Nicht passende Teilrelationen werden ignoriert. Damit ist sichergestellt, dass alle verwendeten Teilrelationen aus einem Tarifgebiet stammen. Die Preisstufen der Teilrelationen werden addiert und dazu der Preis der Sorte ermittelt, alle diese Teilrelationen werden registriert.')
;
INSERT INTO DefRelationendruckregelungen(
ID_Zeitraum, ID_Relationendruckregelung, Bezeichnung) VALUES
  (1, 1, 'Ein. Es wird ein Ticket gedruckt.')
, (1, 2, 'Alle Es wird ein Ticket pro Telrelation gedruckt.')
, (1, 3, 'Tarifgebiet. Alle Teilrelationen eines Tarifgebietes werden mit je einem Ticket gedruckt.')
;
INSERT INTO DefRelationscodegruppentypen(
ID_Zeitraum, ID_Relcodegruppentyp, Bezeichnung) VALUES
  (1, 1, 'Magnet')
, (1, 2, 'Startort')
;
INSERT INTO DefSortenausgaberegelungen(
ID_Zeitraum, ID_Sortenausgaberegelung, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
, (1, 1, 'Papierfahrschein')
, (1, 2, 'EFS (z.B. Chipkarte)')
, (1, 3, 'Papierfahrschein / EFS (z.B. Chipkarte)')
, (1, 4, 'Handy Ticket')
, (1, 5, 'Papierfahrschein / Handy Ticket')
, (1, 6, 'EFS (z.B. Chipkarte) / Handy Ticket')
, (1, 7, 'Papierfahrschein / EFS (z.B. Chipkarte) / Handy Ticket')
, (1, 8, 'Papierfahrschein mit Barcode')
, (1, 9, 'Papierfahrschein / Papierfahrschein mit Barcode')
, (1, 10, 'EFS (z.B. Chipkarte) / Papierfahrschein mit Barcode')
, (1, 11, 'Papierfahrschein / EFS (z.B. Chipkarte) / Papierfahrschein mit Barcode')
, (1, 12, 'Handy Ticket / Papierfahrschein mit Barcode')
, (1, 13, 'Papierfahrschein / Handy Ticket / Papierfahrschein mit Barcode')
, (1, 14, 'EFS (z.B. Chipkarte) / Handy Ticket / Papierfahrschein mit Barcode')
, (1, 15, 'Papierfahrschein / EFS (z.B. Chipkarte) / Handy Ticket / Papierfahrschein mit Barcode')
, (1, 16, 'EFS und Papierfahrschein [mit Barcode]')
, (1, 17, 'Papierfahrschein / EFS und Papierfahrschein [mit Barcode]')
, (1, 18, 'EFS (z.B. Chipkarte) / EFS und Papierfahrschein [mit Barcode]')
, (1, 19, 'Papierfahrschein / EFS (z.B. Chipkarte) / EFS und Papierfahrschein [mit Barcode]')
, (1, 20, 'Handy Ticket / EFS und Papierfahrschein [mit Barcode]')
, (1, 21, 'Papierfahrschein / Handy Ticket / EFS und Papierfahrschein [mit Barcode]')
, (1, 22, 'EFS (z.B. Chipkarte) / Handy Ticket / EFS und Papierfahrschein [mit Barcode]')
, (1, 23, 'Papierfahrschein / EFS (z.B. Chipkarte) / Handy Ticket / EFS und Papierfahrschein [mit Barcode]')
, (1, 24, 'Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
, (1, 25, 'Papierfahrschein / Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
, (1, 26, 'EFS (z.B. Chipkarte) / Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
, (1, 27, 'Papierfahrschein / EFS (z.B. Chipkarte) / Papierfahrschein mit Barcode /')
, (1, 28, 'Handy Ticket / Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
, (1, 29, 'Papierfahrschein / Handy Ticket / Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
, (1, 30, 'EFS (z.B. Chipkarte) / Handy Ticket / Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
, (1, 31, 'Papierfahrschein / EFS (z.B. Chipkarte) / Handy Ticket / Papierfahrschein mit Barcode / EFS und Papierfahrschein [mit Barcode]')
;
INSERT INTO DefSortendruckregelungen(
ID_Zeitraum, ID_Sortendruckregelung, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
, (1, 1, 'Druck über Layout')
, (1, 2, 'Vorrangiger Druck über ein zum Verkaufszeitpunkt zugeordnetes Hauptprodukt, sonst über Layout.')
, (1, 3, 'Druck eines 2. Fahrscheins mit einer Druckinformation "2. Druck" die im Layout ausgewertet werden kann.')
;
INSERT INTO DefSortengruppentypen(
ID_Zeitraum, ID_Sortengruppentyp, Bezeichnung) VALUES
  (1, 1, 'Verkaufssortengruppe Relation Diese Sortengruppen werden beim Verkauf über eine Start-/ Zielwahl angeboten.')
, (1, 2, 'Verkaufssortengruppe Festpreis Diese Sortengruppen werden beim Verkauf ohne Relationsauswahl angeboten.')
, (1, 3, 'Verkaufssortengruppe Kombi Diese Sortengruppen fassen Sorten zusammen, die in Kombination angeboten werden können. Die Auswahlsorte soll SortOrder 1 haben. Beispiel: Einfache Fahrt 2. Klasse + Hundeticket + Fahrrad bzw. Hin- und Rückfahrt 2. Klasse + Hundeticket Hin-/Rück + Fahrrad')
, (1, 11, 'Hauptsorten zu Zusatzsorten Unter dem Sortengruppentyp werden Sorten zusammengefasst, die als Hauptsorte zu einem oder mehreren Zusatzsorten definiert sind. In den Zusatzsorten wird im Attribut "ID_SortengruppeHauptsorten" auf die Sortengruppe von diesem Typ verwiesen.')
, (1, 21, 'Gruppenfahrschein Ist für Gruppenfahrscheine, bei denen zusammen unterschiedlich Ausprägungen auf ein Ticket gedruckt werden. Bsp.: Ein Fahrschein mit x Erwachsenen und y Kindern. Es werden die Auswahlsorte und die Ausprägungen in eine Gruppe zusammengefasst. Die Auswahlsorte soll Sortorder 1 haben.')
, (1, 31, 'SortengruppenErmittlung Ist für Referenzen vom SortengruppenErmittlungen_Type. (s. SortengruppenErmittlungen_Type)')
;
INSERT INTO DefSortentypen(
ID_Zeitraum, ID_Sortentyp, Bezeichnung) VALUES
  (1, 1, 'Einzelkarte')
, (1, 2, 'Mehrfahrten')
, (1, 3, 'Zähler')
, (1, 11, 'Tageskarte')
, (1, 12, 'Wochenkarte')
, (1, 13, 'Monatskarte')
, (1, 14, 'Halbjahreskarte')
, (1, 15, 'Jahreskarte')
, (1, 21, 'Artikel')
, (1, 22, 'Gutschein (Verkauf)')
, (1, 23, 'Gutschein (Annahme)')
, (1, 24, 'Gutschein (Restwert)')
, (1, 31, 'Verkäufer Einzahlung')
, (1, 32, 'Abo Einzahlung')
, (1, 33, 'EBE Einzahlung')
, (1, 39, 'Sonstige Einzahlung')
, (1, 41, 'Pfand (z.B. für Kundendatenträger)')
, (1, 42, 'Kaution')
, (1, 991, 'Fehleinnahme')
, (1, 992, 'Bargutschrift (Überzahlung / Restgeldquittung etc.)')
, (1, 999, 'Sonstige')
;
INSERT INTO DefStreckenart(
ID_Zeitraum, ID_Streckenart, Bezeichnung) VALUES
  (1, 1, 'keine Sonderverkaufslogik')
, (1, 2, 'Strecke nur kombiniert mit ID_Streckenart=1 verkaufbar')
, (1, 3, 'nur als Einzelstrecke verkaufbar')
;
INSERT INTO DefStreckencodetyp(
ID_Zeitraum, ID_Streckencodetyp, Bezeichnung) VALUES
  (1, 1, 'AST Anstoßbahnhof')
, (1, 2, 'NAST Nichtanstoßbahnhof')
, (1, 3, 'NE-Haltepunkt')
;
INSERT INTO DefTarifpunkttypen(
ID_Zeitraum, ID_Tarifpunkttyp, Bezeichnung) VALUES
  (1, 1, 'Tarifhaltestelle (falls jede Hst ein eigener Tarifpunkt bildet)')
, (1, 2, 'Zone / Wabe / Ring (unmittelbar einer Tarifhaltestelle zugeordnet)')
, (1, 3, 'Überzone / Wabentyp (faßt Tarifpunkte vom Typ 2 oder 1 zusammen)')
, (1, 4, 'Region (faßt Überzonen zu Regionen zusammen)')
, (1, 5, 'Ortsteil (in seiner Funktion als Tarifpunkt)')
, (1, 6, 'Ort (faßt Ortsteile zusammen)')
;
INSERT INTO DefVertriebswege(
ID_Zeitraum, ID_Vertriebswege, Bezeichnung) VALUES
  (1, 0, 'nicht spezifiziert/unbestimmt')
;
INSERT INTO DefWaehrungen(
ID_Zeitraum, ID_Waehrung, Bezeichnung) VALUES
  (1, 008, 'ALL')
, (1, 012, 'DZD')
, (1, 032, 'ARS')
, (1, 036, 'AUD')
, (1, 044, 'BSD')
, (1, 048, 'BHD')
, (1, 050, 'BDT')
, (1, 051, 'AMD')
, (1, 052, 'BBD')
, (1, 060, 'BMD')
, (1, 064, 'BTN')
, (1, 068, 'BOB')
, (1, 072, 'BWP')
, (1, 084, 'BZD')
, (1, 090, 'SBD')
, (1, 096, 'BND')
, (1, 104, 'MMK')
, (1, 108, 'BIF')
, (1, 116, 'KHR')
, (1, 124, 'CAD')
, (1, 132, 'CVE')
, (1, 136, 'KYD')
, (1, 144, 'LKR')
, (1, 152, 'CLP')
, (1, 156, 'CNY')
, (1, 170, 'COP')
, (1, 174, 'KMF')
, (1, 188, 'CRC')
, (1, 192, 'CUP')
, (1, 203, 'CZK')
, (1, 208, 'DKK')
, (1, 214, 'DOP')
, (1, 222, 'SVC')
, (1, 230, 'ETB')
, (1, 232, 'ERN')
, (1, 238, 'FKP')
, (1, 242, 'FJD')
, (1, 262, 'DJF')
, (1, 270, 'GMD')
, (1, 280, 'DEM')
, (1, 292, 'GIP')
, (1, 320, 'GTQ')
, (1, 324, 'GNF')
, (1, 328, 'GYD')
, (1, 332, 'HTG')
, (1, 340, 'HNL')
, (1, 344, 'HKD')
, (1, 348, 'HUF')
, (1, 352, 'ISK')
, (1, 356, 'INR')
, (1, 360, 'IDR')
, (1, 364, 'IRR')
, (1, 368, 'IQD')
, (1, 376, 'ILS')
, (1, 388, 'JMD')
, (1, 392, 'JPY')
, (1, 398, 'KZT')
, (1, 400, 'JOD')
, (1, 404, 'KES')
, (1, 408, 'KPW')
, (1, 410, 'KRW')
, (1, 414, 'KWD')
, (1, 417, 'KGS')
, (1, 418, 'LAK')
, (1, 422, 'LBP')
, (1, 426, 'LSL')
, (1, 430, 'LRD')
, (1, 434, 'LYD')
, (1, 446, 'MOP')
, (1, 454, 'MWK')
, (1, 458, 'MYR')
, (1, 462, 'MVR')
, (1, 480, 'MUR')
, (1, 484, 'MXN')
, (1, 496, 'MNT')
, (1, 498, 'MDL')
, (1, 504, 'MAD')
, (1, 512, 'OMR')
, (1, 516, 'NAD')
, (1, 524, 'NPR')
, (1, 532, 'ANG')
, (1, 533, 'AWG')
, (1, 548, 'VUV')
, (1, 554, 'NZD')
, (1, 558, 'NIO')
, (1, 566, 'NGN')
, (1, 578, 'NOK')
, (1, 586, 'PKR')
, (1, 590, 'PAB')
, (1, 598, 'PGK')
, (1, 600, 'PYG')
, (1, 604, 'PEN')
, (1, 608, 'PHP')
, (1, 634, 'QAR')
, (1, 643, 'RUB')
, (1, 646, 'RWF')
, (1, 654, 'SHP')
, (1, 682, 'SAR')
, (1, 690, 'SCR')
, (1, 702, 'SGD')
, (1, 704, 'VND')
, (1, 706, 'SOS')
, (1, 710, 'ZAR')
, (1, 728, 'SSP')
, (1, 748, 'SZL')
, (1, 752, 'SEK')
, (1, 756, 'CHF')
, (1, 760, 'SYP')
, (1, 764, 'THB')
, (1, 776, 'TOP')
, (1, 780, 'TTD')
, (1, 784, 'AED')
, (1, 788, 'TND')
, (1, 800, 'UGX')
, (1, 807, 'MKD')
, (1, 818, 'EGP')
, (1, 826, 'GBP')
, (1, 834, 'TZS')
, (1, 840, 'USD')
, (1, 858, 'UYU')
, (1, 860, 'UZS')
, (1, 882, 'WST')
, (1, 886, 'YER')
, (1, 901, 'TWD')
, (1, 925, 'SLE')
, (1, 926, 'VED')
, (1, 927, 'UYW')
, (1, 928, 'VES')
, (1, 929, 'MRU')
, (1, 930, 'STN')
, (1, 931, 'CUC')
, (1, 932, 'ZWL')
, (1, 933, 'BYN')
, (1, 934, 'TMT')
, (1, 936, 'GHS')
, (1, 938, 'SDG')
, (1, 940, 'UYI')
, (1, 941, 'RSD')
, (1, 943, 'MZN')
, (1, 944, 'AZN')
, (1, 946, 'RON')
, (1, 947, 'CHE')
, (1, 948, 'CHW')
, (1, 949, 'TRY')
, (1, 950, 'XAF')
, (1, 951, 'XCD')
, (1, 952, 'XOF')
, (1, 953, 'XPF')
, (1, 955, 'XBA')
, (1, 956, 'XBB')
, (1, 957, 'XBC')
, (1, 958, 'XBD')
, (1, 959, 'XAU')
, (1, 960, 'XDR')
, (1, 961, 'XAG')
, (1, 962, 'XPT')
, (1, 963, 'XTS')
, (1, 964, 'XPD')
, (1, 965, 'XUA')
, (1, 967, 'ZMW')
, (1, 968, 'SRD')
, (1, 969, 'MGA')
, (1, 970, 'COU')
, (1, 971, 'AFN')
, (1, 972, 'TJS')
, (1, 973, 'AOA')
, (1, 975, 'BGN')
, (1, 976, 'CDF')
, (1, 977, 'BAM')
, (1, 979, 'MXV')
, (1, 980, 'UAH')
, (1, 981, 'GEL')
, (1, 984, 'BOV')
, (1, 985, 'PLN')
, (1, 986, 'BRL')
, (1, 990, 'CLF')
, (1, 994, 'XSU')
, (1, 997, 'USN')
, (1, 999, 'EUR')
;
INSERT INTO DefZahlgrenzentyp(
ID_Zeitraum, ID_Zahlgrenzentyp, Bezeichnung) VALUES
  (1, 1, 'Anzahl Haltestellen')
, (1, 2, 'Tarifkilometer')
, (1, 3, 'Radius (Luftlinie)')
;
INSERT INTO DefZahlungsarten(
ID_Zeitraum, ID_Zahlungsarten, Bezeichnung) VALUES
  (1, 0, 'Keine')
, (1, 1, 'Barzahlung')
, (1, 2, 'Kartenzahlung (Schließt alle Arten der Kartenzahlung ein, die das System unterstützt)')
, (1, 3, 'Barzahlung / Kartenzahlung')
, (1, 4, 'KA-Zahlung (POB, PEB und WEB)')
, (1, 5, 'Barzahlung / KA-Zahlung')
, (1, 6, 'Kartenzahlung / KA-Zahlung')
, (1, 7, 'Barzahlung / Kartenzahlung / KA-Zahlung')
, (1, 8, 'Rechnung')
, (1, 9, 'Barzahlung / Rechnung')
, (1, 10, 'Kartenzahlung / Rechnung')
, (1, 11, 'Barzahlung / Kartenzahlung / Rechnung')
, (1, 12, 'KA-Zahlung / Rechnung')
, (1, 13, 'Barzahlung / KA-Zahlung / Rechnung')
, (1, 14, 'Kartenzahlung / KA-Zahlung / Rechnung')
, (1, 15, 'Barzahlung / Kartenzahlung / KA-Zahlung / Rechnung')
;

