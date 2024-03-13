<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:hfn="http://husst.de/functions"
  xmlns:exsl="http://exslt.org/common"  

  xmlns:husstDV="http://husst.de/HUSST_Versorgungsdaten/3_5_0" 
  xmlns:api="http://husst.de/HUSST_Appinfo/3_5_0"

  extension-element-prefixes = "exsl"
  >

  <xsl:output encoding='UTF-8' method='xml' />

  <xsl:variable name="dh">"</xsl:variable>

  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/60 
    
  ================================================== -->
  <xsl:template match="@type['xs:integer' and ../@name='ID_DynAttributDef']">
    <xsl:attribute name="type">husstDV:INT4</xsl:attribute>    
  </xsl:template>

  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/59 
    
  ================================================== -->
  <xsl:template match="xs:documentation[contains(.,'HAST Hauptanstoßbahnhof')]">
    <xsl:copy>
      <xsl:value-of select="replace(.,'HAST Hauptanstoßbahnhof','AST Anstoßbahnhof')"/>
    </xsl:copy>
  </xsl:template>

  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/58 
    
  ================================================== -->
  <xsl:template match="xs:element[@name='ID_StreckencodeStart' and ancestor::xs:complexType[@name='Strecke_Type']]">
    <xsl:element name="xs:element">
      <xsl:attribute name="name">SortOrder</xsl:attribute>
      <xsl:attribute name="type">husstDV:INT4</xsl:attribute>
      <xsl:attribute name="minOccurs">0</xsl:attribute>
      <xsl:attribute name="maxOccurs">1</xsl:attribute>
    </xsl:element>
    <xsl:value-of select="preceding-sibling::text()[position()=last()]" />
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="*" />
    </xsl:copy>
  </xsl:template>

  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/56 
    
  ================================================== -->
  <xsl:template match="xs:enumeration[@value='11' and ancestor::xs:simpleType[@name='ID_SortengruppentypHUSST_Type']]">
    <xsl:variable name="value">
      <xs:enumeration value="3">
        <xs:annotation>
          <xs:documentation>
            Verkaufssortengruppe Kombi
            Diese Sortengruppen fassen Sorten zusammen, die in Kombination angeboten werden können.
            Die Auswahlsorte soll SortOrder 1 haben.
            Beispiel:
            Einfache Fahrt 2. Klasse + Hundeticket + Fahrrad
            bzw.
            Hin- und Rückfahrt 2. Klasse + Hundeticket Hin-/Rück + Fahrrad
          </xs:documentation>
        </xs:annotation>
      </xs:enumeration>    
      <xs:enumeration value="11">
        <xs:annotation>
          <xs:documentation>
            Hauptsorten zu Zusatzsorten
            Unter dem Sortengruppentyp werden Sorten zusammengefasst, die als Hauptsorte zu einem oder mehreren Zusatzsorten definiert sind.
            In den Zusatzsorten wird im Attribut "ID_SortengruppeHauptsorten" auf die Sortengruppe von diesem Typ verwiesen.
          </xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xsl:variable>

    <xsl:variable name="indent" select="preceding-sibling::text()[position()=last()]" />    
    <xsl:for-each select="exsl:node-set($value)/xs:enumeration">
      <xsl:if test="position()!=1">
        <xsl:value-of select="$indent" />
      </xsl:if>
      <xsl:apply-templates select="." mode="nons"/>      
    </xsl:for-each>
    
    <!-- Die 11 habe ich hier in den "value" aufgenommen, weil ich mich sonst um Einrückungen kümmern müsste  -->
  </xsl:template>

  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/55 
    
  ================================================== -->
  <xsl:template match="xs:enumeration[@value='30' and ancestor::xs:simpleType[@name='ID_FahrgasttypHUSST_Type']]">
    <xsl:variable name="value">
      <xs:enumeration value="64">
        <xs:annotation>
          <xs:documentation>ermäßigt</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="65">
        <xs:annotation>
          <xs:documentation>Fahrrad</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="66">
        <xs:annotation>
          <xs:documentation>Hund</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xsl:variable>

    <xsl:variable name="indent" select="preceding-sibling::text()[position()=last()]" />    
    <xsl:for-each select="exsl:node-set($value)/xs:enumeration">
      <xsl:if test="position()!=1">
        <xsl:value-of select="$indent" />
      </xsl:if>
      <xsl:apply-templates select="." mode="nons"/>      
    </xsl:for-each>
    <!--     den bisherigen Eintrag für Hund nicht kopieren, den haben wir hiermit ersetzt -->
  </xsl:template>


  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/54
    
  ================================================== -->
  <xsl:template match="xs:enumeration[@value='2' and ancestor::xs:simpleType[@name='ID_KomfortklasseHUSST_Type']]">
    <xsl:variable name="value">
      <xs:enumeration value="2">
        <xs:annotation>
          <xs:documentation>2. Klasse</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
      <xs:enumeration value="300">
        <xs:annotation>
          <xs:documentation>Übergang von der 2. zur 1. Klasse</xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xsl:variable>

    <xsl:variable name="indent" select="preceding-sibling::text()[position()=last()]" />    
    <xsl:for-each select="exsl:node-set($value)/xs:enumeration">
      <xsl:if test="position()!=1">
        <xsl:value-of select="$indent" />
      </xsl:if>
      <xsl:apply-templates select="." mode="nons"/>      
    </xsl:for-each>
    <!--     den bisherigen Eintrag für Hund nicht kopieren, den haben wir hiermit ersetzt -->
  </xsl:template>
  <xsl:template match="xs:documentation[contains(., 'angelehnt an VDV-KA ServiceKlasse')]">
    <xsl:copy>
      <xsl:value-of select="replace(.,'angelehnt an VDV-KA ServiceKlasse','angelehnt an VDV-KA ServiceKlasse (reserviert: 0-255)')"/>
    </xsl:copy>
  </xsl:template>
  

  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/49
    
  ================================================== -->
  <xsl:template match="xs:element[@name='ID_Ortspunkt' and ancestor::xs:complexType[@name='OrtspunkteKA_Type']]">
    <xsl:variable name="value">
      <xs:element name="ID_OrtspunktKA" type="husstDV:INT4" maxOccurs="1" minOccurs="1">
        <xs:annotation>
          <xs:documentation>
            Eindeutige Datensatz-ID innerhalb der ID_Zeitraum
          </xs:documentation>
        </xs:annotation>
      </xs:element>
      <xs:element name="ID_Ortspunkt" type="husstDV:INT4" maxOccurs="1" minOccurs="1">
        <xs:annotation>
          <xs:documentation>
            Referenz zum Ortspunkt, den der OrtspunktKA um VDV KA Eigenschaften ergänzt.
          </xs:documentation>
        </xs:annotation>
      </xs:element>
    </xsl:variable>

    <xsl:variable name="indent" select="preceding-sibling::text()[position()=last()]" />    
    <xsl:for-each select="exsl:node-set($value)/xs:element">
      <xsl:if test="position()!=1">
        <xsl:value-of select="$indent" />
      </xsl:if>
      <xsl:apply-templates select="." mode="nons"/>      
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="@name[current()='ID_Ortspunkt'
  and parent::api:field/parent::api:primekey 
  and ancestor::xs:complexType[@name='OrtspunkteKA_Type']]">    
    <xsl:attribute name="name" select="'ID_OrtspunktKA'"></xsl:attribute>
  </xsl:template>


  <!-- ==================================================   
  
    löst: https://github.com/HUSST-de/HUSST/issues/57
    
  ================================================== -->
<!--       <xs:element name="ID_Bundesland" type="husstDV:INT4" maxOccurs="1" minOccurs="1"/> -->
<!--       <xs:element name="ID_Bundesland" type="husstDV:ID_Bundesland_Type" maxOccurs="1" minOccurs="1"/> -->
  <xsl:template match="@type[current()='husstDV:INT4'
    and parent::xs:element[@name='ID_Bundesland']]">    
    <xsl:attribute name="type" select="'husstDV:ID_Bundesland_Type'"></xsl:attribute>
  </xsl:template>

  <xsl:function name="hfn:strip">
    <xsl:param name="node" />
    <xsl:variable name="value">
      <xsl:value-of
        select="substring-before(substring($node, 2), $dh)" />
    </xsl:variable>

    <xsl:sequence select="$value" />
  </xsl:function>

  <!-- Vorlage für ID_Bundesland Enumeration  -->
  <xsl:template name="blEnumTemplate">
    <xsl:if test="nr">
      <xs:enumeration value="{nr}">
        <xs:annotation>
          <xs:documentation>
            <xsl:value-of select="name"/>
            <xsl:if test="iso and ''!=iso">
              <xsl:value-of select="concat(' ', iso)"/>              
            </xsl:if>
          </xs:documentation>
        </xs:annotation>
      </xs:enumeration>
    </xsl:if>                   
  </xsl:template>

  <!-- fügt ID_Bundesland_Type und ID_BundeslandHUSST_Type vor Feiertage_Type ein -->
  <xsl:template match="text()[
        parent::xs:schema 
    and following-sibling::*[1] 
    [self::xs:complexType[@name='Feiertage_Type']] ]">

    <xsl:variable name="bl">
      <xsl:variable name="list">
        "0";"unbekannt";""
        "1";"Schleswig-Holstein";"(SH)"
        "2";"Hamburg";"(HH)"
        "3";"Niedersachsen";"(NI)"
        "4";"Bremen";"(HB)"
        "5";"Nordrhein-Westfalen";"(NW)"
        "6";"Hessen";"(HE)"
        "7";"Rheinland-Pfalz";"(RP)"
        "8";"Baden-Württemberg";"(BW)"
        "9";"Bayern";"(BY)"
        "10";"Saarland";"(SL)"
        "11";"Berlin";"(BE)"
        "12";"Brandenburg";"(BB)"
        "13";"Mecklenburg-Vorpommern";"(MV)"
        "14";"Sachsen";"(SN)"
        "15";"Sachsen-Anhalt";"(ST)"
        "16";"Thüringen";"(TH)"
      </xsl:variable>

      <xsl:variable name="blList">
        <xsl:for-each select="tokenize($list,'\s+')">
          <land>
            <xsl:for-each select="tokenize(., ';')">
              <xsl:choose>  
                <xsl:when test="position()=1"><nr><xsl:value-of select="hfn:strip(.)"/></nr></xsl:when>
                <xsl:when test="position()=2"><name><xsl:value-of select="hfn:strip(.)"/></name></xsl:when>
                <xsl:when test="position()=3"><iso><xsl:value-of select="hfn:strip(.)"/></iso></xsl:when> 
              </xsl:choose>
            </xsl:for-each>
          </land>
        </xsl:for-each>
      </xsl:variable>

      <xsl:apply-templates select="exsl:node-set($blList)" mode="copy"/>
    </xsl:variable>
    
    <xsl:variable name="value">
      <xs:simpleType name="ID_BundeslandHUSST_Type">
        <xs:annotation>
          <xs:documentation>
            Die HUSST definiert ID_Bundesland kleiner 1000.
            Aktuell definiert die HUSST ID_Bundesland für die deutschen Bundesländern
            analog der "Liste deutscher Bundesländer" wie sie für den Amtlicher Regionalschlüssel (ARS) 
            bzw. dem darin enthaltenen Amtlichen Gemeindeschlüssel (AGS) definiert sind. 
            
            Quelle: 02Bundeslaender_mit_Hauptstaedten.xslx - Statistisches Bundesamt (Destatis), 2023
            https://www.destatis.de/DE/Themen/Laender-Regionen/Regionales/Gemeindeverzeichnis/Administrativ/Archiv/Standardtabellen/02_BundeslaenderVorjahr.html
            
            Dieser 2-stellige Länderschlüssel wird u.a. auch in der DHID/Global-ID (=Landeskennzeichen(LK)) 
            verwendet und damit im deutschlandweiten zentralen Haltestellenverzeichnis (zHV)
             - siehe auch VDV-Schrift 432: https://www.vdv.de/downloads/3855/432SDS/forced.
          </xs:documentation>
        </xs:annotation>
        <xs:restriction base="husstDV:INT4">
          <xsl:for-each select="$bl/land" >
            <xsl:call-template name="blEnumTemplate"/>
          </xsl:for-each>
        </xs:restriction>
      </xs:simpleType>

      <xs:simpleType name="ID_Bundesland_Type">
        <xs:annotation>
          <xs:documentation>
            Die ID_Bundesland ist entweder eine von HUSST vordefinierter Zahl kleiner 1000 oder eine im Projekt vereinbarte Zahl größer gleich 1000.
            Im freidefinierbaren Bereich gibt es herstellerspezifische Wertebereiche. s. https://github.com/HUSST-de/HUSST/tree/master/Version%203/3.0
          </xs:documentation>
        </xs:annotation>
        <xs:union memberTypes="husstDV:ID_BundeslandHUSST_Type husstDV:ID_Projektspezifisch_Type"/>
      </xs:simpleType>
      
    </xsl:variable>

    <!-- fügt den ausgewählten Block mit Whitespaces vor unserem neuen Block ein -->
    <xsl:copy/>

<!--     <xsl:variable name="indent" select="''" />     -->
    <xsl:variable name="indent" select="preceding-sibling::text()[position()=last()]" />    
    <xsl:for-each select="exsl:node-set($value)/xs:*">
      <xsl:if test="position()!=1">
        <xsl:value-of select="$indent" />
      </xsl:if>
      <xsl:apply-templates select="." mode="nons"/>     

    </xsl:for-each>

    <!-- trennt unseren neuen vom bisherigen Block mit dem gleichen Block von Whitespaces, wie vor unserem neuen Block -->
    <xsl:copy/>
  </xsl:template>


  <!-- standard copy template -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <!-- <xsl:copy> -->
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|node()" mode="copy">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="copy"/>
      <xsl:apply-templates mode="copy"/>
    </xsl:copy>
  </xsl:template>

  <xsl:function name="hfn:indent">
    <xsl:param name="node"/>
    <xsl:variable name="value">
      <xsl:text>  </xsl:text>
      <xsl:if test="$node/parent::xs:*">
        <xsl:value-of select="hfn:indent($node/parent::xs:*)"/>
      </xsl:if>
    </xsl:variable>
    <xsl:sequence select="$value"/>
  </xsl:function>

  <xsl:template match="@*|node()" mode="nons">
    <xsl:param name="indent" select="'    '" />
    <xsl:if test="node() and parent::xs:*">
      <xsl:value-of select="'&#10;'|| $indent || hfn:indent(.)" />
    </xsl:if>
    <xsl:copy copy-namespaces="no">
      <!-- <xsl:copy> -->
      <xsl:apply-templates select="@*" mode="nons" />
      <xsl:apply-templates             mode="nons" />
    </xsl:copy>
    <xsl:if test="node()">
      <xsl:value-of select="'&#10;  ' || hfn:indent(.)" />
      <xsl:if test="not(parent::xs:*)"><xsl:text>  </xsl:text></xsl:if>
    </xsl:if>
  </xsl:template>


</xsl:stylesheet>