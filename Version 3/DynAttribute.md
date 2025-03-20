## Sorten
| Name                                | Kommentar                                                                    | Typ    | spezifische Werte        |
| ----------------------------------- | ---------------------------------------------------------------------------- | ------ | ------------------------ |
| husst.Sorte.Entwertung              | Gibt an, ob die Sorte entwertet werden muss.                                 | string | Pflicht, Keine, Optional |
| husst.Sorte.AnzeigeKurz             | Ein kurzer Anzeigetext für eine Sorte für das Verkaufspersonal.              | string |                          |
| husst.Sorte.AnzeigeLang             | Ein langer Anzeigetext für eine Sorte für das Verkaufspersonal.              | string |                          |
| husst.Sorte.KundendisplayKurz       | Ein kurzer Anzeigetext für eine Sorte für den Kunden.                        | string |                          |
| husst.Sorte.KundendisplayLang       | Ein langer Anzeigetext für eine Sorte für den Kunden.                        | string |                          |
| husst.Sorte.Drucktext2              | Ein zusätzlicher Drucktext für eine Sorte.                                   | string |                          |
| husst.Sorte.Drucktext3              | Ein zusätzlicher Drucktext für eine Sorte.                                   | string |                          |
| husst.Sorte.ZusammengefassteAusgabe | Gibt an, ob die Sorte mehrfach zu einer Ausgabe zusammengefasst werden kann. | bool   |                          |
| husst.Sorte.AnzahlAbschnitte        | Gibt an, wie viele Abschnitte beim Druck der Sorte ausgegeben werden sollen. | int    |                          |
| husst.Sorte.AnzahlBerechtigungen    | Gibt an, wie viele Fahrtberechtigungen mit dieser Sorte erlaubt sind.        | int    |                          |
|                                     |                                                                              |        |                          |

## Preise
| Name                            | Kommentar                                                                  | Typ    | spezifische Werte |
| ------------------------------- | -------------------------------------------------------------------------- | ------ | ----------------- |
| husst.Preis.Drucktext           | Ein Drucktext für den Preis.                                               | string |                   |
| husst.Preis.Mitnahme.Kinder.Min | Gibt an, wie viele kostenlose Kinder mindestens mitgenommen werden müssen. | int    |                   |
| husst.Preis.Mitnahme.Kinder.Max | Gibt an, wie viele kostenlose Kinder höchstens mitgenommen werden dürfen.  | int    |                   |

## Preisstufen
| Name                       | Kommentar                         | Typ    | spezifische Werte |
| -------------------------- | --------------------------------- | ------ | ----------------- |
| husst.Preisstufe.Drucktext | Ein Drucktext für die Preisstufe. | string |                   |

## Teilrelationen
| Name                                 | Kommentar                               | Typ    | spezifische Werte |
| ------------------------------------ | --------------------------------------- | ------ | ----------------- |
| husst.Teilrelation.Via.Referenz      | Eine Referenz für das Via des Hinwegs.  | string |                   |
| husst.Teilrelation.Via.ReferenzRueck | Eine Referenz für das Via des Rückwegs. | string |                   |
