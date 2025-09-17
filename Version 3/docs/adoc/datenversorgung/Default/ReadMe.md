# 📘 Default-Dokumentation für XSD-Strukturelemente
ADoc\src\Dv\Default


Dieses Verzeichnis enthält Standard-Dokumentationstexte für Strukturelemente in den Dv-Xsd-Dateien.

## Elemente
Elemente müssen in der .xsd keine eigene Doku enthalten, wenn sie auf eigene Datentypen verweisen.

Wenn ein Element in der XSD keine eigene Dokumentation über `<xs:annotation><xs:documentation>` mitbringt, 
wird automatisch ein passender Text aus diesem Verzeichnis verwendet. 
Die Zuordnung erfolgt anhand des Elementnamens.

**Beispiel:**

```xml
<xs:element name="DynAttribut" type="husstDV:DynAttribut_Subtype"/>
```

verwendet default/Element_DynAttribut.adoc:
```
Optionaler Erweiterungsmechanismus für zusätzliche, 
projektspezifische Eigenschaften. 

Unbekannte Attribute sind von empfangenden Systemen zu ignorieren.
```