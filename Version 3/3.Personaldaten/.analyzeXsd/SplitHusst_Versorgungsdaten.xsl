<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:kt="http://www.krauth-technology.de/ktXmlDelphiDatenbindung/1.0"
  xmlns:dcb="http://www.krauth-technology.de/DelphiCodeBinding/1.0"
  xmlns:ktDelphiXml="http://www.krauth-technology.de/ktDelphiXml/1.0"
  xmlns:ktx="http://www.krauth-technology.de/ktXsdKtTools/1.0"
  xmlns:exsl="http://exslt.org/common"  
  xmlns:svn="svn"
  extension-element-prefixes = "exsl"

  xmlns:api="http://www.husst.de/Appinfo/3_Personal"
  xmlns:husstDV="http://husst.de/Versorgungsdaten/3_Personal"

  >
    <xsl:output method="xml" version="1.0" encoding="UTF-8"/>
  <xs:annotation>
    <xs:documentation>
      2024-03-06 hneubauer(Husst-AG)
      
      Teilt die bisherige Husst_Datenversorgung.xsd in mehrere Dateien auf, pro Aufruf wird eine neue .xsd erzeugt.
      
      der Parameter xsd steuert, welche Datei erzeugt wird:
      
      xsd=Basis      - HUSST_Basisversorgungsdaten.xsd
          (default)
          
      xsd=Versorgung - HUSST_Versorgungsdaten.xsd
      
    </xs:documentation>
  </xs:annotation>
  
  <!-- Ziel-Xsd -->
  <xsl:param name="xsd">Basis</xsl:param>
  

  <xsl:variable name="xsdFilename">
    <xsl:choose>
      <xsl:when test="$xsd='Basis'">HUSST_Basisversorgungsdaten.xsd</xsl:when>
      <xsl:when test="$xsd='Versorgung'">HUSST_Versorgungsdaten.xsd</xsl:when>
      <xsl:when test="$xsd='Personal'">HUSST_Personaldaten.xsd</xsl:when>
      <xsl:otherwise>unbenutzt.xsd</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="datentyp">
    <xsl:variable name="DatentypenCsv">
"Xsd-Schema";"Husst-Schemataliste";"Datentyp";"SchemaNeu"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DauerMinuten";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DefBundesland_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DefWaehrung_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DynAttributDef_Type";"Intermodal"
"unbenutzt";"";"Betriebszeit_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DynAttributTyp_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DynAttributWert_Type";"Intermodal"
"unbenutzt";"";"INT3";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Feiertage_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"ID_Bundesland_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"ID_BundeslandHUSST_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"ID_Waehrung_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"ID_WaehrungHUSST_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Kalender_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"KoordWgs84_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Tagesarten_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"TagesartMerkmalElemente_Type";"Intermodal"
"HUSST_Versorgungsdaten.xsd";"Tarif";"ZuordnungRelCodeGrp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ZusSorteAnbindung_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Tagesmerkmale_Type";"Intermodal"
"HUSST_Versorgungsdaten.xsd";"Tarif";"Sammelbeleg_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"TagesmerkmalElemente_Type";"Intermodal"
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_RelationenberechnungsregelungHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_Relationenberechnungsregelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_RelationendruckregelungHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_Relationendruckregelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"KA_Kundentyp_CODE_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"KA_Profil_CODE_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"KA_ServiceKlasse_CODE_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"KA_TransportmittelKategorie_CODE_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"KA_RabattParameter_CODE_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Tarifgebiete_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Tarifpunkte_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Tarifpunktmengen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"TarifpunktmengeElemente_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"UhrzeitMinuten";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Unternehmen_Type";"Intermodal"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Bearbeitung_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"blobString";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Char";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Angebot,Basis";"DateCompact";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"DateTimeCompact";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Angebot,Basis,Tarif,Tarifstrecken";"DynAttribut_Subtype";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Angebot";"Relationscodes_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Relationscodegruppen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"RaeumlicheGueltigkeit_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Relationen_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Vias_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Relationszuordnungen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Teilrelationen_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Nachbarhaltestellen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefZahlgrenzentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_Zahlgrenzentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_ZahlgrenzentypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Preisstufendirektwahl_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Preisspalten_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Preisstufen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"SortenTarifarten_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Sorten_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Zusatzsorten_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Preise_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"PreisstufenErmittlungen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"SortengruppenErmittlungen_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"OrtspunkteTG_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"OrtspunkteKA_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Ortspunkte_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Linien_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Wege_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Wegpositionen_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"DynAttributWert_Subtype";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_ProjektspezifischBitfeld_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"FLOAT1";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Angebot,Basis,Tarif,Tarifstrecken";"ID_Projektspezifisch_Type";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_SortentypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Sortentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_TarifpunkttypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Tarifpunkttyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_OrtspunkttypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_Ortspunkttyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_OTPTypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_OTPTyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_PreisquelleHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Preisquelle_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_PreisspaltentypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Preisspaltentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_RelcodegruppentypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_Relcodegruppentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_SortengruppentypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_Sortengruppentyp_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"INT1";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"INT2";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Angebot,Basis,Tarif,Tarifstrecken";"INT4";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefTarifpunkttyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefSortentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"DefSortengruppentyp_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"INT8";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"Interpretationen_Type";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Tarif";"Mwst_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefPreisspaltentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefFahrgasttyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_FahrgasttypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Fahrgasttyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefKomfortklasse_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_KomfortklasseHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Komfortklasse_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefRabattklasse_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_RabattklasseHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Rabattklasse_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefPreisfindung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_PreisfindungHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Preisfindung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefSortenausgaberegelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_SortenausgaberegelungHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Sortenausgaberegelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefSortendruckregelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_SortendruckregelungHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Sortendruckregelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefReisetyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_ReisetypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Reisetyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefNachbarhaltestellenbeziehung_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_NachbarhaltestellenbeziehungHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"ID_Nachbarhaltestellenbeziehung_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefVertriebswege_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_VertriebswegeHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"ID_Vertriebswege_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"Vorverkauf_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"Umschalttag_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"GueltigkeitszeitRegeln_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefZahlungsarten_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Zahlungsarten_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_ZahlungsartenHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"Tarifarten_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefRelationscodegruppentyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefOrtspunkttyp_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"Interpretationsschluessel_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"InterpretationsschluesselHUSST_Type";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Angebot";"Tarifrelevantepunkte_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"Bediengebiete_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefOTPTyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"Sortengruppen_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis,Tarif";"InterpretationsschluesselProjektspezifisch_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Lang_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Sprachtexte_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Angebot,Basis";"String250";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefPreisquelle_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefRelationenberechnungsregelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot";"DefRelationendruckregelung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"DefErmittlungseinheit_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_ErmittlungseinheitHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarif";"ID_Ermittlungseinheit_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"DefStreckenart_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"ID_StreckenartHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"ID_Streckenart_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"DefStreckencodetyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"ID_StreckencodetypHUSST_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"ID_Streckencodetyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"Strecke_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"Streckencode_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"OrtspunktStreckencode_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"Streckenzuordnung_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"Gleichstellungstyp_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"GleichstellungTarifart_Type";""
"HUSST_Versorgungsdaten.xsd";"Tarifstrecken";"Gleichstellung_Type";""
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif,Tarifstrecken";"OePVTarifDB_Type";""
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Tabelleninfo_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Updateinfo_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"VersionInhalt_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"VersionStatus_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"VersionStruktur_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Zeitraeume_Type";"Technisch"
"HUSST_Basisversorgungsdaten.xsd";"Basis";"Zeitraumoptionen_Type";"Technisch"
"HUSST_Versorgungsdaten.xsd";"Angebot,Tarif";"SortengruppenElemente_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Einsatzarten_Type";""
"HUSST_Personaldaten.xsd";"Personal";"GeraetEinsatztypen_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Geraet_Type";""
"HUSST_Personaldaten.xsd";"Personal";"IdentobjektTypen_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Identobjekte_Type";""
"HUSST_Personaldaten.xsd";"Personal";"PersonalIdentobjekte_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Personal_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Personaleinsatz_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Standort_Type";""
"HUSST_Personaldaten.xsd";"Personal";"Geraetetypen_Type";""
    </xsl:variable>
    
    <xsl:variable name="list">
      <!-- in Zeilen zerlegen -->
      <xsl:for-each select="tokenize($DatentypenCsv,'\n')">
        <!--  Zeile in Felder zerlegen -->
        <!--  und je Zeile ein xml-Element ezeugen -->
        <type>
        <xsl:for-each select="tokenize(.,';')">
          <xsl:choose>
            <xsl:when test="position()=1"><xsdFilename><xsl:value-of select='ktx:strip(.)'/></xsdFilename></xsl:when>
            <xsl:when test="position()=2"><schemalist><xsl:value-of select='ktx:strip(.)'/></schemalist></xsl:when>
            <xsl:when test="position()=3"><name><xsl:value-of select='ktx:strip(.)'/></name></xsl:when>
            <xsl:when test="position()=4"><schemaneu><xsl:value-of select='ktx:strip(.)'/></schemaneu></xsl:when>
          </xsl:choose>        
        </xsl:for-each>
        </type>
      </xsl:for-each>
    </xsl:variable>    
    
    <xsl:apply-templates select="exsl:node-set($list)" mode="copy"/>
  </xsl:variable>

  <xsl:variable name="xsdDt">
    <xsl:apply-templates select="$datentyp/type[xsdFilename=$xsdFilename]" mode="copy"/>
  </xsl:variable>
  

   <!-- ==================================================
     Variable $eh
  einfaches Hochkomma
   =================================================== -->
   <xsl:variable name="eh">
     <xsl:text>'</xsl:text>
   </xsl:variable>

   <!-- ==================================================
     Variable $dh
  doppeltes Hochkomma
   =================================================== -->
   <xsl:variable name="dh">
     <xsl:text>"</xsl:text>
   </xsl:variable>

   <!-- ==================================================
     Variable $crlf
  Windows Zeilenschaltung
   =================================================== -->
   <xsl:variable name="crlf">
     <xsl:text>&#x0D;&#x0A;</xsl:text>
   </xsl:variable>

  <xsl:function name="ktx:strip">
    <xsl:param name="node"/>
    <xsl:variable name="value">
      <xsl:value-of select="substring-before(substring($node, 2), $dh)"/>
    </xsl:variable>

    <xsl:sequence select="$value"/>
  </xsl:function>

  <xsl:template name="newline0">
      <xsl:text>
</xsl:text>
    </xsl:template>
  <xsl:template name="newline">
      <xsl:text>
  </xsl:text>
    </xsl:template>

  <xsl:template match="/xs:schema">
    <xsl:call-template name="newline0"/>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>

      <xsl:attribute name="targetNamespace">http://husst.de/Versorgungsdaten/3_Personal</xsl:attribute>
      <xsl:attribute name="elementFormDefault">qualified</xsl:attribute>
      <xsl:attribute name="attributeFormDefault">unqualified</xsl:attribute>
<!--            targetNamespace="http://husst.de/Versorgungsdaten/3_4_1" -->
<!--            elementFormDefault="qualified" attributeFormDefault="unqualified"> -->
  
      <xsl:call-template name="newline"/>
      <xsl:comment select="$xsd"/>
      <xsl:call-template name="newline"/>

      <xsl:call-template name="newline"/>
      <xsl:if test="not($xsd='Basis')">
        <xsl:element name="xs:include">
          <xsl:attribute name="schemaLocation">./HUSST_DvBasis_3_Personal.xsd</xsl:attribute>
        </xsl:element>
        <xsl:call-template name="newline"/>
      </xsl:if>
      
      <xsl:apply-templates/>

<!--       <xsl:apply-templates select="$datentyp" mode="copy"/> -->
    </xsl:copy>
  </xsl:template>

<!--   <xsl:template match="/xs:schema/comment()[following-sibling::xs:simpleType[1][@name=$xsdDt/type/name] -->
<!--     or   following-sibling::xs:complexType[1][@name=$xsdDt/type/name] -->
<!--   ]"> -->
  <xsl:template match="/xs:schema/comment()[(following-sibling::xs:simpleType|following-sibling::xs:complexType)[1][@name=$xsdDt/type/name]]"> 
    <xsl:call-template name="newline"/>
    <xsl:apply-templates select="." mode="copy"/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template name="schemaneu">
    <xsl:element name="api:schema">
      <xsl:attribute name="name"><xsl:value-of select="$xsdDt/type[name=current()/ancestor::xs:complexType/@name]/schemaneu"/></xsl:attribute>
    </xsl:element>      
  </xsl:template>

  <xsl:template match="/xs:schema/xs:annotation">
    <xsl:call-template name="newline"/>
    <xsl:apply-templates select="." mode="copy"/>
    <xsl:call-template name="newline"/>
  </xsl:template>
     
  <xsl:template match="api:schema[
     ancestor::xs:complexType[@name=$xsdDt/type[schemaneu!='']/name]]"
     mode="copy">
    <xsl:choose>
      <xsl:when test="not(preceding-sibling::api:schema)">
        <xsl:element name="api:schema">
          <xsl:attribute name="name"><xsl:value-of select="$xsdDt/type[name=current()/ancestor::xs:complexType/@name]/schemaneu"/></xsl:attribute>
        </xsl:element>      
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="api:annotation[not(api:schema) and 
     ancestor::xs:complexType[@name=$xsdDt/type[schemaneu!='']/name]]" mode="copy">
    <xsl:choose>
      <xsl:when test="not(preceding-sibling::api:schema)">
        <xsl:element name="api:schema">
          <xsl:attribute name="name"><xsl:value-of select="$xsdDt/type[name=current()/ancestor::xs:complexType/@name]/schemaneu"/></xsl:attribute>
        </xsl:element>      
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <xsl:param name="schemaneu"/>

  <xsl:template match="xs:annotation[@id='Kopiervorlage' and parent::xs:schema]" mode="copy"/>
  <xsl:template match="@id['Kopiervorlage']" mode="copy"/>
  <xsl:template match="@id['Kopiervorlage']" mode="copyvorlage"/>

  <xsl:template match="xs:simpleType[not(xs:annotation)]" mode="deactivateDcopy">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="copy"/>
      <xsl:call-template name="newline" />
      <xsl:apply-templates select="//xs:annotation[@id='Kopiervorlage']" mode="copytemplate">
        <xsl:with-param name="schemaneu" select="$xsdDt/type[name=current()/@name]/schemaneu"/> 
      </xsl:apply-templates>
      <xsl:call-template name="newline" />
      <xsl:apply-templates select="*" mode="copy"/>
    </xsl:copy>  
  </xsl:template>

  <xsl:template match="/xs:schema/xs:element[substring-after(@type,':')=$xsdDt/type/name]">
    <xsl:call-template name="newline"/>
    <xsl:apply-templates select="." mode="copy"/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="/xs:schema/xs:simpleType[@name=$xsdDt/type/name]">
    <xsl:call-template name="newline"/>
    <xsl:apply-templates select="." mode="copy"/>
    <xsl:call-template name="newline"/>
  </xsl:template>

  <xsl:template match="/xs:schema/xs:complexType[@name=$xsdDt/type/name]">
    <xsl:call-template name="newline"/>
    <xsl:apply-templates select="." mode="copy"/>
    <xsl:call-template name="newline"/>
  </xsl:template>
  
  <xsl:template match="@*|node()">
    <xsl:apply-templates select="@*"/>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- standard copy template -->
  <xsl:template match="@*|node()" mode="copy">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="copy"/>
      <xsl:apply-templates mode="copy"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="@*|node()" mode="copytemplate">
    <xsl:param name="schemaneu"/>
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="copytemplate">
        <xsl:with-param name="schemaneu" select="$schemaneu" />
      </xsl:apply-templates>
      <xsl:apply-templates select="*" mode="copytemplate">
        <xsl:with-param name="schemaneu" select="$schemaneu" />
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>  
  <xsl:template match="@name[parent::api:schema]" mode="copyvorlage">
    <xsl:param name="schemaneu"/>
    <xsl:copy>
      <xsl:value-of select="$schemaneu"/>
    </xsl:copy>
    
  </xsl:template>
</xsl:stylesheet>
