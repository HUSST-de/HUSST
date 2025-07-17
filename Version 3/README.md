# Husst Version 3

In diesem Ordner befinden sich die Version 3 und alle Unterversionen.
Zu jeder Version ist auch eine Beispiel SQLite Abbildung verfügbar.

## Herstellerreservierte Bereiche

Die Typen abgeleitet von ID_Projektspezifisch_Type haben ab 1000 einen freien Wertebereich.
Damit es bei herstellerübergreifenden Systemen keine Doppelungen gibt, werden hier Wertebereiche festgelegt, den die Hersteller dafür nutzen.

Weitere Hersteller können sich gerne einen Bereich via Pullrequest oder Issue anfrage / reservieren.

* 2000-2999 AMCON
* 3000-3999 ICA
* 4000-4999 krauth
* 5000-5999 highQ

## Changelog

### 3.7.0 -> 3.8.0
Änderungsdatum: 17. Juli 2025
Matching von Verbund- und Streckenverbindungen 
* DvTarifAngebot
   * Ergänzung Streckenverlauf_Type 
   * Relationen_Type ergänzt um ID_Streckenverlauf (optional)

### 3.6.0 -> 3.7.0
Änderungsdatum: 15. Januar 2025
Parallele Suche in Verbund- und Streckentarifen ermöglichen / unterbinden
* DvTarifAngebot
   * Relationen_Type ergänzt um ID_TarifartStrecke (optional)

### 3.5.0 -> 3.6.0
Änderungsdatum: 28. Juni 2024
Umsetzung der Modularisierung der Versorgungsdaten in 
  * DvBasis
  * DvTarifAngebot
  * DvVertrieb 
    - enthält jetzt wieder die Personaldatentypen++ aus der 2.x Version
    - Angepasst an die neue 3.x Logik

Die Anpassungen sind abwärtskompatibel innerhalb der Version 3.

Außerdem  
  * Enumeration ID_OTPTypHUSST_Type um Value=4 ergänzt 

### 3.4.1 -> 3.5.0
Änderungsdatum: 8. März 2024

Versorgungsdaten
 - OrtspunkteKA erhalten ID_OrtspunktKA als neues Primarykey Field, zusätzlichen Uix
 - Strecke_Type: SortOrder ergänzt #58
 - Enumerationserweiterungen (tlw. Korrekturen)
   - ID_KomfortklasseHUSST_Type ergänzt um Übergang 2. in 1. Klasse #54
   - ID_FahrgasttypHUSST_Type ergänzt um ermäßigt, Fahrrad, Hund (in 3.4.1. mit anderer Nummer eingeführt) #55
   - ID_SortengruppentypHUSST_Type ergänzt Verkaufssortengruppe Kombi #56
   - ID_Bundesland mit dem Amtlichen Regionalschlüssel (ARS) festgelegt #57
   - Enumeration aller Währungen ersetzt bisherige Min-/Max- Restriktion
 - DefStreckencodetyp_Type: HAST in AST umbenennen #59
 - div. kleinere Korrekturen 

Außerdem
 - Vereinheitlichung der Husst - Namespaces (ohne www.)
 - SQLiteAbbildung - Dateinamen systematisiert
 - zusätzlich erweiterte SQLite Abbildung mit allen Husst definierten Enumerationen 

### 3.4.0 -> 3.4.1

Versorgungsdaten
 - korrigierte SQLite Abbildung
 - 2 x Enums erweitert
 
### 3.3.0 -> 3.4.0

Versorgungsdaten
- Definition der Nachbarhaltestellen erweitert, sodass diese nun nutzbar sind.
- Kleine Verbesserungen der Dokumentation

Ergebnisdaten
- Warenkorb hat nun eine optionale ReferenzExtern
- Kleine Verbesserungen der Dokumentation

### 3.2.0 -> 3.3.0

Ergebnisdaten

- Zusätzlicher Zahlungstyp mit allgemeinen Feldern für die Abbildung von Zahlungsdaten in WebShops

### 3.1.0 -> 3.2.0

1. semantische Versionierung
2. Integration einer zusätzlichen Verbindungslogik für Tarife mit streckenbasierter Tarifierung

Versorgungsdaten

- Ortspunkte.ID_RelCode - kein Pflichtfeld mehr
- zusätzliches Husst-Schema: Tarifstrecken
- Ergänzungen in HUSST_Versorgungsdaten
    - DefStreckenart
    - DefStreckencodetyp
    - OrtspunktStreckencode
    - Streckencode
    - Strecke
    - Streckenzuordnung
    - Gleichstellungstyp
    - GleichstellungTarifart
    - Gleichstellung

Versorungs- und Ergebnisdaten

- VersionStruktur um VersionPatch ergänzt (semantische Versionierung)

### 3.0.0 -> 3.1.0

Update im Zuge des Husst4Maas Projekts. Es wurden hauptsächlich Ergänzungen vorgenommen, um eine Abbildung von Carsharing-, Maut- und Parktarifen zu ermöglichen.

* PreisstufenErmittlungen_Type hinzugefügt:
  Die PreisstufenErmittlungen dienen dazu, die zu berechenden Preisstufen für eine Sorte zu ermitteln.
* SortengruppenErmittlungen_Type hinzugefügt: Die SortengruppenErmittlungen definieren Regeln zur Stukturierung von Tarifen in beliebig kleine Zeitperioden innerhalb eines
  Zeitraums.
* Zugehörige Typen und Enums:
    * Ermittlungseinheit Enum hinzugefügt.
    * DauerMinuten Typ hinzugefügt.
    * UhrzeitMinuten Typ hinzugefügt.

Zudem wurden einige allgemeine Optimierungen und Vervollständigungen vorgenommen.

* Ergänzung von Dokumentation an ein paar Stellen, wo diese fehlte.
* Ausdefinition einiger Enumerationen:
    * OTPTyp
    * Preisquelle
    * Sortengruppentyp
