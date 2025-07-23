# Änderungen in 3.7.0

## HUSST_Appinfo_3_7_0
### Neue Datentypen
Status: Vorschläge

| Element     | Datentyp     | Doku|Beschreibung                          |
|--------------|--------------|-----|----------------------------------|
| `since` | `husstversion_Type` |ja| Angabe einer Husst-Version |
| `changed` | `husstversionlist_Type` |ja| Angabe einer Liste von Husst-Versionen |
| `remarks`    | `string` |nein| interne Hinweise zu einem Strukturelement - der Text erscheint nicht in der offiziellen Dokumentation|
| `reference`    | `string` |ja| Verweis auf eine externe Referenz zu einem Strukturelement|
| `example`    | `example_Type` |ja| Freitextbeispiel                      |
| `fieldexample` | `fieldexample_Type` |ja| Strukturiertes Beispiel mit Feldwerten |
