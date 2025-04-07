# DynAttribute HUSST 3.X.X
Wenn einzelne HUSST-Partner 'Sonderlogiken' umsetzen müssen, werden häufig DynAttribute dafür genutzt um etwaige Anforderungen zu erfüllen. 
Um Dopplungen zu vermeiden, sind im Folgenden die DynAttribute aufgelistet, die durch Abstimmung der Partner in den HUSST-Standard aufgenommen wurden.

## Sorten
| Name                                | Kommentar                                                                    | Typ    | spezifische Werte        |
| ----------------------------------- | ---------------------------------------------------------------------------- | ------ | ------------------------ |
| husst.Sorte.Entwertung              | Gibt an, ob die Sorte entwertet werden muss.                                 | string | Pflicht, Keine, Optional |
| husst.Sorte.AnzeigeKurz             | Ein kurzer Anzeigetext für eine Sorte für das Verkaufspersonal.              | string |                          |
| husst.Sorte.AnzeigeLang             | Ein langer Anzeigetext für eine Sorte für das Verkaufspersonal.              | string |                          |
| husst.Sorte.KundendisplayKurz       | Ein kurzer Anzeigetext für eine Sorte für den Kunden.                        | string |                          |
| husst.Sorte.KundendisplayLang       | Ein langer Anzeigetext für eine Sorte für den Kunden.                        | string |                          |
| ~~husst.Sorte.Drucktext2~~          | ~~Ein zusätzlicher Drucktext für eine Sorte.~~                               | ~~string~~ |                      |
| ~~husst.Sorte.Drucktext3~~          | ~~Ein zusätzlicher Drucktext für eine Sorte.~~                               | ~~string~~ |                      |
|~~husst.Sorte.ZusammengefassteAusgabe~~| ~~Gibt an, ob die Sorte mehrfach zu einer Ausgabe zusammengefasst werden kann.~~| ~~bool~~   |                  |
| *(NEU)* husst.Sorte.Druck.Zusatztext.n | Anzahl der Zusatztexte, die im Zusammenhang mit einem Belegdruck verwendet werden | int |  |
| *(NEU)* husst.Sorte.Druck.Zusatztext.XXX.Text | Im Zusammenhang mit einem Belegdruck zu verwendender Zusatztext. <br> **XXX**: Hier sollen IMMER 3-stellige Zahlen (001, 002, 098, 099, 100) | string |  |
| husst.Sorte.AnzahlAbschnitte        | Gibt an, wie viele Abschnitte beim Druck der Sorte ausgegeben werden sollen. | int    |                          |
| husst.Sorte.AnzahlBerechtigungen    | Gibt an, wie viele Fahrtberechtigungen mit dieser Sorte erlaubt sind.        | int    |
| *(NEU)* husst.Sorte.Chipkarte.Werteinheiten.MinBetrag    | Minimal zulässiger Betrag in kleinster Werteinheit für eine Aufbuchung von Werteinheiten auf eine Chipkarte | currency |   |
| *(NEU)* husst.Sorte.Chipkarte.Werteinheiten.MaxBetrag | Maximal zulässiger Betrag in kleinster Werteinheit für eine Aufbuchung von Werteinheiten auf einer Chipkarte | currency |  |
| *(NEU)* husst.Sorte.Sammelbeleg_Type |  |  |  |
| *(NEU)* husst.Sorte.KA.EFS.NichtUebertragbar | Drückt aus ob dieser Fahrschein an andere Fahrgäste übertragbar ist. </br></br> **TODO:** Diskussion aus HUSST RUnde in CLP: Wollen wir das hier umbenennen und generell zum 'personalisieren' nutzen? Man könnte Regelungen 'wie' personalisiert werden darf durch Flags ausdrücken. | bool |  |
| *(NEU)* husst.Sorte.Daten.Registrierung.Elemente | Kommuniziert die Felder an Clients, die bei der Entsorgung mitgeliefert werden müssen | string |  |
| *(NEU)* husst.Sorten.ErlaubteOrtspunkttypen | **Wurde in CLP nicht hbesprachen - ist von HighQ definiert.** |  |  |

## Preise
| Name                            | Kommentar                                                                  | Typ    | spezifische Werte |
| ------------------------------- | -------------------------------------------------------------------------- | ------ | ----------------- |
| husst.Preis.Drucktext           | Ein Drucktext für den Preis.                                               | string |                   |
| husst.Preis.Mitnahme.Kinder.Min | Gibt an, wie viele kostenlose Kinder mindestens mitgenommen werden müssen. | int    |                   |
| husst.Preis.Mitnahme.Kinder.Max | Gibt an, wie viele kostenlose Kinder höchstens mitgenommen werden dürfen.  | int    |                   |
| *(NEU)* husst.Preis.Anzahl.Personen.Unabhaengig | (z.B. bei einem Gruppenfahrschein für bis zu n Personen, dessen Preis konstant ist). </br> **Hier sind noch Diskussionen notwendig um u.A. zu klären was bspw., mit 'AnzahlKinder' etc passiert**  | bool |  |
## Preisstufen
| Name                       | Kommentar                         | Typ    | spezifische Werte |
| -------------------------- | --------------------------------- | ------ | ----------------- |
| husst.Preisstufe.Drucktext | Ein Drucktext für die Preisstufe. | string |                   |
| *(NEU)* husst.Preisstufe.Typ.Tarifentfernung | **Wert der von Krauth kommt - Nochmal prüfen ob wir das brauchen** | string |  |
## Teilrelationen
| Name                                 | Kommentar                               | Typ    | spezifische Werte |
| ------------------------------------ | --------------------------------------- | ------ | ----------------- |
| husst.Teilrelation.Via.Referenz      | Eine Referenz für das Via des Hinwegs.  | string |                   |
| husst.Teilrelation.Via.ReferenzRueck | Eine Referenz für das Via des Rückwegs. | string |                   |

## Tarifgebiet
| Name                                                      | Kommentar              | Typ        | Spezifische Werte |
|-----------------------------------------------------------|------------------------|------------|-------------------|
| husst.Tarifgebiet.Daten.Tarifgeber.Name | Bspw. Amcon ist ein Lieferant und würde dann hier drin stehen. | string |  |
| husst.Tarifgebiet.Daten.Registrierung.Elemente | dyn. Attribute des Tarifgebiets |  |  |
