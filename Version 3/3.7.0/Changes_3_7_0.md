# Änderungen in 3.7.0

## HUSST_Appinfo_3_7_0
### Neue Datentypen
Status: Vorschläge

| Element     | Datentyp     | Doku|Beschreibung                          |
|--------------|--------------|-----|----------------------------------|
| `since` | `husstversion_Type` |ja| Husst-Version, in der ein Element/Datentyp eingeführt wurde (vor 3.7 unvollständig) |
| `changed` | `husstversionlist_Type` |ja| Husst-Versionen, in denen ein Element/Datentyp geändert wurde (vor 3.7 unvollständig) |
| `remarks`    | `string` |nein| interne Hinweise zu einem Strukturelement - der Text erscheint nicht in der offiziellen Dokumentation|
| `reference`    | `string` |ja| Verweis auf eine externe Referenz zu einem Strukturelement|
| `example`    | `example_Type` |ja| Freitextbeispiel                      |
| `fieldexample` | `fieldexample_Type` |ja| Strukturiertes Beispiel mit Feldwerten |

### Beispiele

#### since und changed
api:since: Husst-Version, in der ein Element/Datentyp eingeführt wurde (vor 3.7 unvollständig)

api:changed: Husst-Versionen, in denen ein Element/Datentyp geändert wurde (vor 3.7 unvollständig)
```xml
  <xs:simpleType name="ID_StreckenartHUSST_Type">
    <xs:annotation>
      <xs:documentation>
        Die HUSST definiert ID_Streckenart kleiner 1000.
      </xs:documentation>
      <xs:appinfo>
      	<api:since>3.2</api:since>
      	<api:changed>3.7</api:changed>
      	<api:schema name="Tarif"/>
      </xs:appinfo>
    </xs:annotation>
```
#### remarks
interne Hinweise zu einem Strukturelement - der Text erscheint nicht in der offiziellen Dokumentation
```xml
  <xs:complexType name="Nachbarhaltestellen_Type">
    <xs:annotation>
    	<xs:documentation>Dient zur Definition von Kurzstreckenbeziehungen.</xs:documentation>
    	<xs:appinfo>
    		<api:remarks>
    			In Daisy (Entwicklungsversion) sollte beachtet werden,
    			die Nachbarhaltestellen in Angebot- und Tariftabellen zu
    			trennen. Vorbild: Relationen und Teilrelationen
    		</api:remarks>
```

#### reference
Verweis auf eine externe Referenz zu einem Strukturelement
```xml
  <xs:simpleType name="ID_FahrgasttypHUSST_Type">
    <xs:annotation>
      <xs:documentation>
        Die HUSST definiert ID_Fahrgasttyp kleiner 1000
        angelehnt an VDV-KA Kundentyp
      </xs:documentation>
      <xs:appinfo>
      	<api:reference>VDV KA HD-BOM: KundenTyp_CODE (lehnt an: EN 1545: ProfileCodeIOP)</api:reference>
```

#### example
Freitextbeispiel
```xml
  <xs:complexType name="PreisstufenErmittlungen_Type">
    <xs:annotation>
      <xs:documentation>
        Die PreisstufenErmittlungen definieren Regeln zur Berechnung der Preisstufe einer Sorte auf Basis einer variablen Ermittlungseinheit (z. B. Minuten oder Kilometer). 
        Sie stellen eine Alternative zur Preisstufenermittlung über Teilrelationen dar und kommen insbesondere im Kontext von SortengruppenErmittlungen (z. B. im MaaS-Umfeld) zum Einsatz.

        Die Berechnung erfolgt schrittweise: Liegt die ermittelte Menge der Einheiten im Bereich „Von“ bis „Bis“, wird die Anzahl der Schritte aufgerundet und mit dem Preis der zugeordneten Preisstufe multipliziert.

        Hinweis:
        - Der Schrittwert darf nicht größer als (Bis – Von) sein.
        - (Bis – Von) muss durch Schritt ohne Rest teilbar sein.
        - Die Regel kann optional eine Beschreibung enthalten, die nicht für Vertriebsgeräte bestimmt ist.
      </xs:documentation>
      <xs:appinfo>
        <api:example>
          Einheit: Minuten, Von: 0, Bis: 90, Schritt: 5, Preisstufe: 1<br/>
          → Bei 32 Minuten: 7 Schritte → 7 × Preis von Preisstufe 1<br/><br/>
          Einheit: Minuten, Von: 90, Bis: 180, Schritt: 10, Preisstufe: 2<br/>
          → Bei 117 Minuten: 3 Schritte → 3 × Preis von Preisstufe 2<br/><br/>
          Einheit: Kilometer, Von: 0, Bis: 100, Schritt: 100, Preisstufe: 3<br/>
          → Bei 5 km: 1 Schritt → 1 × Preis von Preisstufe 3
        </api:example>
```

#### fieldexample
Strukturiertes Beispiel mit Feldwerten
```xml
  <xs:complexType name="DefNachbarhaltestellenbeziehung_Type">
    <xs:annotation>
      <xs:documentation>
        Definiert die möglichen Verwendungszwecke von Nachbarhaltestellenbeziehungen innerhalb der Datenversorgung. 
        Eine Nachbarhaltestellenbeziehung ordnet einem Ortspunkt (z. B. einer Haltestelle) eine Menge benachbarter Ortspunkte zu. 
        Über die hier definierte ID_Nachbarhaltestellenbeziehung kann zwischen verschiedenen Arten solcher Beziehungen unterschieden werden – etwa für unterschiedliche tarifliche oder betriebliche Zwecke. 
        Die HUSST reserviert Werte kleiner 1000 für standardisierte Typen; Werte ab 1000 stehen für projektspezifische Erweiterungen zur Verfügung.
      </xs:documentation>
      <xs:appinfo>
        <api:fieldexample>
          Beispiel für eine Definition von Kurzstrecken Nachbarhaltestellen
          <api:field name="ID_Nachbarhaltestellenbeziehng">1</api:field>
          <api:field name="Bezeichnung">Kurzstreckenbeziehung</api:field>
          Listet alle Nachbarhaltestellen zu einer Ausgangshaltestelle, die mit einem Kurzstreckenfahrschein erreicht werden können.
        </api:fieldexample>
```