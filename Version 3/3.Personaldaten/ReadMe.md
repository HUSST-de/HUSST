# Folder 3.Personaldaten

## Anforderungen

In diesem Folder entsteht eine neue Husst V3 Version.
Die soll den folgenden Issue lösen: https://github.com/HUSST-de/HUSST/issues/45:

>In Husst 2 waren Personaldaten Bestandteil der Husst Versorgungsdaten.
>
>In Husst 3 sind diese rausgeflogen, da keine Anwendung bekannt war, die diese nutzt.
>
>Nun wurde herangetragen, dass diese Daten doch genutzt werden.
>
>Idee: Eigenen XSDs um Tabellen für Personaldaten von den Tarifdaten zu trennen.

In der anschließenden Diskussion wurde mehrheitlich gewünscht, dass die bestehende HUSST_Versorgungsdaten_3*.xsd aufgeteilt wird in eine Basisdefintion und eine Tarif-/Angebotdefinition und diesen beiden eine dritte Personaldefinition zur Seite gestellt wird. Damit beginnen wir auf Versorungsdatenseite mit der Modularisierung der Datendefinition.

## Modularisierung 

|Alternative-HN2|Alternative-HN|Modulname (AG-2024-03-08)|Modulname (Initial)|Schemata|
|---------|---------|---------|---------|------------|
|HUSST_DvBasis.xsd|HUSST_VersorgungsdatenBasis.xsd|HUSST_Basisversorgungsdaten.xsd|HUSST_Basisversorgungsdaten.xsd|<ul><li>Technisch<br/>fachlich unspezifische Datenstrukturen</li> <li>Intermodal<br/>fachlich modulübergreifende Datenstrukturen</li></ul>|
|HUSST_DvBasisEnumerationen.xsd|HUSST_VersorgungsdatenBasisEnumerationen.xsd| | | Enumerationstypen: ```ID_<Datentyp>HUSST_Type```|
|HUSST_DvTarifAngebot.xsd|HUSST_VersorgungsdatenTarifAngebot.xsd|HUSST_TarifAngebotsversorgungsdaten.xsd|HUSST_Versorgungsdaten.xsd <i>(referenziert HUSST_Basisversorgungsdaten.xsd)</i>| <ul><li>Tarif</li> <li>Streckentarif</li> <li>Angebot</li></ul>|
|HUSST_DvTarifAngebotEnumerationen.xsd|HUSST_VersorgungsdatenTarifAngebotEnumerationen.xsd| | | Enumerationstypen: ```ID_<Datentyp>HUSST_Type``` |
|HUSST_DvVetriebsakteure.xsd|HUSST_VersorgungsdatenVetriebsakteure.xsd|HUSST_Vetriebsstellenversorgungsdaten.xsd|HUSST_Personaldaten.xsd <i>(referenziert HUSST_Basisversorgungsdaten.xsd)</i>| <ul><li>Personal</li> <li>Identifikation</li> <li>Geräte</li></ul>|
|HUSST_DvVetriebsakteureEnumerationen.xsd|HUSST_VersorgungsdatenVetriebsakteureEnumerationen.xsd| | | Enumerationstypen: ```ID_<Datentyp>HUSST_Type``` |


Hinweis:
* bei den vielen Dateien die hier entstehen benötigen wir in Zukunft eine Automatisierung zur Anpassung von 
  * Dateienamen
  * namespaces

## Personaldaten

Welche Datentypen aus der Definition der HUSST V 2.x, die als Schema="Personal" gekennzeichnet sind, wirklich benötigt werden, ist dem Issue nicht zu entnehmen.

die Typen sind:
* Einsatzarten_Type
* GeraetEinsatztypen_Type
* Geraet_Type
* IdentobjektTypen_Type
* Identobjekte_Type
* PersonalIdentobjekte_Type
* Personal_Type
* Personaleinsatz_Type
* <i>obsolet: Standort_Type</i>

Hinweise vom AG Treffen vom 8. März 2024
* In den Ergebnisdaten nachschauen, was an Feldern bzgl. Geräten & Personal definiert ist.
* Die Anforderungen kommen von highQ. Martin Ebner bietet an, die weitere Arbeit mit Horst zu übernehmen.


# Working
## todo Personal Split Versorgungsdaten
* Run "HUSST_Versorgungsdaten_3_x.xsd-Split-Personal"
* im Ergebnis <xs:Schema .. -Tag ersetzen
* fehlenden IdentobjektTypen_Type von Hand vor den Personal_Type kopieren
* replace "tpd:" mit "husstDV:"

