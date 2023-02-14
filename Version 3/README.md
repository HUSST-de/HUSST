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
  
### 3.01 -> 3.2.0
1. semantische Versionierung
2. Integration zusätzliche Verbindungslogik für Tarife mit streckenbasierter Tarifierung

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
    
### 3.00 -> 3.01
Update im Zuge des Husst4Maas Projekts. Es wurden hauptsächlich Ergänzungen vorgenommen, um eine Abbildung von Carsharing-, Maut- und Parktarifen zu ermöglichen.

* PreisstufenErmittlungen_Type hinzugefügt:
  Die PreisstufenErmittlungen dienen dazu, die zu berechenden Preisstufen für eine Sorte zu ermitteln.
* SortengruppenErmittlungen_Type hinzugefügt: Die SortengruppenErmittlungen definieren Regeln zur Stukturierung von Tarifen in beliebig kleine Zeitperioden innerhalb eines Zeitraums.
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
