<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:husstDV="http://husst.de/Versorgungsdaten/3_01"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:api="http://www.husst.de/Appinfo/3_01"
>
  <xsl:output method="text" encoding="UTF-8"   
  />
    <!-- ===============================================================================
    
      Erzeugt ein SQL Script um eine leere HUSST_Versorgungsdaten_3_01 Datenbank 
      zu erstellen.
      
      Autor: Horst Neubauer, krauth technology GmbH, Eberbach     
      
    =============================================================================== -->

	<!-- ===============================================================================
		globaler Parameter mit dem aktuellen Datum des Aufrufs der Transformation
		wird erwartet im Format YYYYMMDD 

		in Eclipse z.B. in der Run Configuration
		In Transformation Parameters einen Parameter hinzufügen (Add Parameter)
		Name: current_date
		Value: ${current_date} 		
	=============================================================================== -->	
	<xsl:param name="current_date" />

	<!-- ===============================================================================
		globale Variable für die Ausgabe eines Zeilenumbruchs 
	=============================================================================== -->	
	<xsl:variable name="crlf"><xsl:text>&#xa;</xsl:text></xsl:variable>

	<!-- =============================================================================== 
		globale Variable mit der Version der Husst-DV-Strukturversion
		Format: V #.# - <status> vom <Änderungsdatum>
		z.B. "V 3.0 - in Arbeit vom 2019-09-13" 
	=============================================================================== -->	
	<xsl:variable name="HUSSTversion">
		<xsl:text>V </xsl:text>
		<xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='VersionMajor']/@default"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='VersionMinor']/@default"/>
		<xsl:text>.</xsl:text>
		<xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='VersionPatch']/@default"/>
		<xsl:text> - </xsl:text>
		<xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='Status']/@default"/>
		<xsl:text> vom </xsl:text>
		<xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='Aenderungsdatum']/@default"/>
	</xsl:variable>

	<!-- =============================================================================== 
		Name eines Typs ohne den ggf. vorangestellten Namespace-Präfix 

		Parameter: name
	=============================================================================== -->
	<xsl:template name="stripNS">
		<xsl:param name="name"/>
		<xsl:choose>
		  <xsl:when test="contains($name,':')"><xsl:value-of select="substring-after($name,':')"/></xsl:when>
		  <xsl:otherwise><xsl:value-of select="$name"/></xsl:otherwise>
		</xsl:choose>		
	</xsl:template>	

	<!-- ===============================================================================
		Normalisiert einen Datenobjektnamen (Tabelle, Feld, ..) 
		Aktuell wird nur ein ggf. vorangestellter Namespace-Präfix entfernt.
		Kann aber erweitert werden, um z.B. GROSSSCHREIBUNG zu erwzingen

		Parameter: name
	=============================================================================== -->
	<xsl:template name="normalizeDBObjectName">
		<xsl:param name="name"/>
		<xsl:call-template name="stripNS"><xsl:with-param name="name" select="$name"/></xsl:call-template>
	</xsl:template>	

   <!-- ===============================================================================
		Liefert den Typ-Namen des Knotens zurück oder 'leer'.
        NS-Präfix wird, wenn vorhanden, abgeschnitten.
        Parameter: Der Element-Knoten der direkt oder indirekt auf einen simplen 
        Datentyp der Tabellendefinition führt (also, keine zusammengestzen Typen). 
        Mode: "fieldtypename"
        
        
        
        Die Funktion ermittelt nur die, zur Zeit in HUSST_Datenversorgung*.xsd auch 
        verwendeten Definitionsmöglichkeiten. Sie muss erweitert werden, wenn in der 
        Definition noch weitere Möglichkeiten ausgereitzt werden.   
    =============================================================================== --> 
	<xsl:template mode="fieldtypename" match="*">
		<xsl:if test="@type">
			<xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="@type"/></xsl:call-template>    
		</xsl:if>
		<xsl:if test="not(@type)">
			<xsl:choose>
				<xsl:when test="xs:simpleType/xs:restriction/@base">
					<xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="xs:simpleType/xs:restriction/@base"/></xsl:call-template>    
				</xsl:when>
				<xsl:when test="xs:restriction/@base">
					<xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="xs:restriction/@base"/></xsl:call-template>    
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="leer" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

   <!-- ===============================================================================
		Liefert den DB-Typ-Namen des Feld-Typs zurück oder 'leer'.
		Sucht rekursiv bis zur endgültigen xs:... Typ-Defintion einer simplen 
		Felddefintion.
        Parameter: Der Element-Knoten aus der Tabellendefinition.
        Mode: "fieldtype"
        
        Die Funktion ermittelt nur die, zur Zeit in HUSST_Datenversorgung*.xsd auch 
        verwendeten Definitionsmöglichkeiten. Sie muss erweitert werden, wenn in der 
        Definition noch weitere Möglichkeiten ausgereitzt werden.   
    =============================================================================== --> 
	<xsl:template mode="fieldtype" match="*">
    	<xsl:variable name="maxLength" select="descendant::xs:maxLength/@value "/>
		<xsl:variable name="type"><xsl:apply-templates mode="fieldtypename" select="."/></xsl:variable>

		<xsl:choose>
			<!-- SQLite kennt eigentlich nur *einen* Integer Datentyp, 64bit
				 Manche DBKomponenten interpretieren den aber als 32bit Integer,
				 wohingegen der 'bigint' als 64bit Integer verstanden wird.
				 Der zuvor verwendete 'largeint' wird zumindest von der ZEOS Library, 
				 zumindest inzwischen, nicht korrekt als 64bit sondern als 32bit Integer
				 interpretiert.   
			-->
			<xsl:when test="$type='unsignedInt'">bigint</xsl:when>
			<xsl:when test="$type='integer'">bigint</xsl:when>
			<xsl:when test="$type='decimal'">numeric</xsl:when>
			<xsl:when test="$type='float'">real</xsl:when>
			<xsl:when test="$type='date'">datetime</xsl:when>
			<xsl:when test="$type='dateTime'">datetime</xsl:when>
			<xsl:when test="$type='boolean'">integer</xsl:when>
			<xsl:when test="($type='string') or ($type='language')">
				<xsl:if test="$maxLength">varchar(<xsl:value-of select="$maxLength"></xsl:value-of>)</xsl:if>
				<xsl:if test="not($maxLength)">text</xsl:if>
			</xsl:when>
			<xsl:otherwise>    
				<xsl:variable name="nextType">
					<xsl:if test="/xs:schema/xs:simpleType[@name=$type]/xs:union/@memberTypes">
						<xsl:call-template name="normalizeDBObjectName">
							<xsl:with-param name="name" select="substring-before(/xs:schema/xs:simpleType[@name=$type]/xs:union/@memberTypes,' ')"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="/xs:schema/xs:simpleType[@name=$type]/xs:restriction">
						<xsl:value-of select="$type"/>
					</xsl:if>            
				</xsl:variable>
				<xsl:apply-templates mode="fieldtype" select="/xs:schema/xs:simpleType[@name=$nextType]"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>  

   <!-- ===============================================================================
		Liefert die Felddefinitionen aller Felder einer Tabelle und den Primärschlüssel. 
		Mode: "fieldtype"
    =============================================================================== --> 
	<xsl:template mode="tableFields" match="xs:*[(xs:sequence|xs:choice|xs:all)/xs:element]">
		<xsl:for-each select="(xs:sequence|xs:choice|xs:all)/xs:element[not(contains(@type,'_Subtype'))]">
			<xsl:variable name="fieldname"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="@name"/></xsl:call-template></xsl:variable>

			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:value-of select="$crlf"/>
			<xsl:text>	</xsl:text>
			<xsl:value-of select="$fieldname"/>
			<xsl:text> </xsl:text>
			
			<xsl:value-of select="substring('                                   ',1,35-string-length($fieldname))"/>
			<xsl:apply-templates mode="fieldtype" select="."/>			
			<xsl:if test="@nillable='false'">
				<xsl:text> NOT NULL</xsl:text>
			</xsl:if>
		</xsl:for-each> 

		<xsl:if test="xs:annotation/xs:appinfo/api:primekey/api:field">
			<xsl:text>,</xsl:text>
			<xsl:value-of select="$crlf"/>
			<xsl:text>	</xsl:text>
			<xsl:text>PRIMARY KEY(</xsl:text>
			<xsl:for-each select="xs:annotation/xs:appinfo/api:primekey/api:field">
    	        <xsl:if test="position()!=1">
        	    	<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:value-of select="@name" />
    	        <xsl:text> ASC</xsl:text>
			</xsl:for-each>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>

   <!-- ===============================================================================
		Liefert den Create SQL für eine Tabelle ausgehend von ihrem xs:element Eintrag.
		Das sind alle Domain-Typen der HUSST Datenversorgung, im Gegensatz zu den 
		rein technischen Datentypen (DynAttributDef_Type, DynAttributWert_Type 
		und Sprachtexte_Type).  
		Mode: "tabledef"
    =============================================================================== --> 
	<xsl:template match="/xs:schema/xs:element" mode="tabledef">
		<!-- Name des Datentyps der Tabelle ohne Namespace-Präfix -->
		<xsl:variable name="tableName"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="@name"/></xsl:call-template></xsl:variable>
		<xsl:variable name="typeName"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="@type"/></xsl:call-template></xsl:variable>

		<!-- Sicherstellen, dass der Datentyp existiert -->
		<xsl:if test="not(/xs:schema/xs:*[@name=$typeName])">
			<xsl:message><xsl:text>FEHLER: Datentyp </xsl:text><xsl:value-of select="@type"/><xsl:text> ist nicht definiert.</xsl:text></xsl:message>
		</xsl:if>	  

		<!-- CREATE TABLE SQL erzeugen -->
		<xsl:text>CREATE TABLE </xsl:text>
		<xsl:value-of select="$tableName"/>
		<xsl:text>(</xsl:text>
		<!-- die Felddefinitionen übernimmt ein eigenes Template -->
		<xsl:apply-templates mode="tableFields" select="/xs:schema/xs:*[@name=$typeName]" />
		<xsl:text>);</xsl:text>
		<xsl:value-of select="$crlf"/>
		
		<xsl:if test="/xs:schema/xs:*[@name=$typeName]/xs:annotation/xs:appinfo/api:uniquekey">
			<xsl:apply-templates mode="tabledef" select="/xs:schema/xs:*[@name=$typeName]/xs:annotation/xs:appinfo/api:uniquekey"/>
			<xsl:value-of select="$crlf"/>
		</xsl:if>
	</xsl:template>

   <!-- ===============================================================================
		Liefert den Create SQL für eine Tabelle für einen technischen Daten-Type der 
		HUSST Datenversorgung für den es kein xs:element gibt. 
		(DynAttributDef_Type, DynAttributWert_Type und Sprachtexte_Type).  
		Mode: "tabledef"
    =============================================================================== --> 
	<xsl:template match="/xs:schema/xs:complexType" mode="tabledef">
		<!-- Name des Datentyps der Tabelle ohne Namespace-Präfix -->
		<xsl:variable name="tableName"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="substring-before(@name,'_Type')"/></xsl:call-template></xsl:variable>
		<xsl:variable name="typeName"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="@name"/></xsl:call-template></xsl:variable>

		<!-- CREATE TABLE SQL erzeugen -->
		<xsl:text>CREATE TABLE </xsl:text>
		<xsl:value-of select="$tableName"/>
		<xsl:text>(</xsl:text>
		<!-- die Felddefinitionen übernimmt ein eigenes Template -->
		<xsl:apply-templates mode="tableFields" select="current()" />
		<xsl:text>);</xsl:text>
		<xsl:value-of select="$crlf"/>
		
		<xsl:if test="xs:annotation/xs:appinfo/api:uniquekey">
			<xsl:apply-templates mode="tabledef" select="xs:annotation/xs:appinfo/api:uniquekey"/>
			<xsl:value-of select="$crlf"/>
		</xsl:if>
	</xsl:template>

   <!-- ===============================================================================
		Liefert den Create SQL für einen Unique Key.
		Mode: "tabledef"
    =============================================================================== --> 
	<xsl:template match="api:uniquekey" mode="tabledef">
		<xsl:variable name="idxName"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="@name"/></xsl:call-template></xsl:variable>
		<xsl:variable name="typeName"><xsl:call-template name="normalizeDBObjectName"><xsl:with-param name="name" select="ancestor::xs:*/@name"/></xsl:call-template></xsl:variable>

		<xsl:text>CREATE UNIQUE INDEX </xsl:text>
		<xsl:value-of select="$idxName"/>
		<xsl:text> ON </xsl:text>
		<xsl:value-of select="/xs:schema/xs:element[@type=concat('husstDV:',$typeName)]/@name" />
		<xsl:text>(</xsl:text>
		<xsl:for-each select="api:field">
			<xsl:if test="position()!=1">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:value-of select="@name" />
			<xsl:text> ASC</xsl:text>
		</xsl:for-each>
		<xsl:text>);</xsl:text>
	</xsl:template>

	<!-- ===============================================================================
		Liefert die Tabellennummern einer Tabelle, die für dynamische Attribute 
		definiert ist oder 'Fehler: tabellennummer undefiniert'.
		Mode: "tabellennummer"
    =============================================================================== --> 
	<xsl:template match="xs:*" mode="tabellennummer">
		<xsl:choose>
			<xsl:when test="@name='Bediengebiete_Type'">1</xsl:when>
			<xsl:when test="@name='DefBundesland_Type'">2</xsl:when>
			<xsl:when test="@name='DefFahrgasttyp_Type'">3</xsl:when>
			<xsl:when test="@name='DefKomfortklasse_Type'">4</xsl:when>
			<xsl:when test="@name='DefOrtspunkttyp_Type'">5</xsl:when>
			<xsl:when test="@name='DefOTPTyp_Type'">6</xsl:when>
			<xsl:when test="@name='DefPreisfindung_Type'">7</xsl:when>
			<xsl:when test="@name='DefPreisquelle_Type'">8</xsl:when>
			<xsl:when test="@name='DefPreisspaltentyp_Type'">9</xsl:when>
			<xsl:when test="@name='DefRabattklasse_Type'">10</xsl:when>
			<xsl:when test="@name='DefReisetyp_Type'">11</xsl:when>
			<xsl:when test="@name='DefRelationenberechnungsregelung_Type'">12</xsl:when>
			<xsl:when test="@name='DefRelationendruckregelung_Type'">13</xsl:when>
			<xsl:when test="@name='DefRelationscodegruppentyp_Type'">14</xsl:when>
			<xsl:when test="@name='DefSortenausgaberegelung_Type'">15</xsl:when>
			<xsl:when test="@name='DefSortendruckregelung_Type'">16</xsl:when>
			<xsl:when test="@name='DefSortengruppentyp_Type'">17</xsl:when>
			
			<!-- stillgelegt 3.0->3.01  
			<xsl:when test="@name='DefSortenklasse_Type'">18</xsl:when>
			 -->
			<xsl:when test="@name='DefSortentyp_Type'">19</xsl:when>
			<xsl:when test="@name='DefTarifpunkttyp_Type'">20</xsl:when>
			<xsl:when test="@name='DefVertriebswege_Type'">21</xsl:when>
			<xsl:when test="@name='DefWaehrung_Type'">22</xsl:when>
			<xsl:when test="@name='DefZahlungsarten_Type'">23</xsl:when>
			<xsl:when test="@name='Feiertage_Type'">24</xsl:when>
			<xsl:when test="@name='Kalender_Type'">25</xsl:when>
			<xsl:when test="@name='Linien_Type'">26</xsl:when>
			<xsl:when test="@name='Mwst_Type'">27</xsl:when>
			<xsl:when test="@name='Nachbarhaltestellen_Type'">28</xsl:when>
			<xsl:when test="@name='Ortspunkte_Type'">29</xsl:when>
			<xsl:when test="@name='OrtspunkteKA_Type'">30</xsl:when>
			<xsl:when test="@name='OrtspunkteTG_Type'">31</xsl:when>
			<xsl:when test="@name='Preise_Type'">32</xsl:when>
			<xsl:when test="@name='Preisspalten_Type'">33</xsl:when>
			<xsl:when test="@name='Preisstufen_Type'">34</xsl:when>
			<xsl:when test="@name='Preisstufendirektwahl_Type'">35</xsl:when>
			<xsl:when test="@name='RaeumlicheGueltigkeit_Type'">36</xsl:when>
			<xsl:when test="@name='Relationen_Type'">37</xsl:when>
			<xsl:when test="@name='Relationscodegruppen_Type'">38</xsl:when>
			<xsl:when test="@name='Relationszuordnungen_Type'">39</xsl:when>
			<xsl:when test="@name='Sorten_Type'">40</xsl:when>
			<xsl:when test="@name='Sortengruppen_Type'">41</xsl:when>
			<xsl:when test="@name='Tagesarten_Type'">42</xsl:when>
			<xsl:when test="@name='TagesartMerkmalElemente_Type'">43</xsl:when>
			<xsl:when test="@name='Tagesmerkmale_Type'">44</xsl:when>
			<xsl:when test="@name='TagesmerkmalElemente_Type'">45</xsl:when>
			<xsl:when test="@name='Tarifarten_Type'">46</xsl:when>
			<xsl:when test="@name='Tarifgebiete_Type'">47</xsl:when>
			<xsl:when test="@name='Tarifpunkte_Type'">48</xsl:when>
			<xsl:when test="@name='Tarifpunktmengen_Type'">49</xsl:when>
			<xsl:when test="@name='Tarifrelevantepunkte_Type'">50</xsl:when>
			<xsl:when test="@name='Teilrelationen_Type'">51</xsl:when>
			<xsl:when test="@name='Unternehmen_Type'">52</xsl:when>
			<xsl:when test="@name='Vias_Type'">53</xsl:when>
			<xsl:when test="@name='Wege_Type'">54</xsl:when>
			<xsl:when test="@name='Wegpositionen_Type'">55</xsl:when>
			<xsl:when test="@name='Zusatzsorten_Type'">56</xsl:when>
			<xsl:when test="@name='GueltigkeitszeitRegeln_Type'">57</xsl:when>
			<xsl:when test="@name='SortengruppenElemente_Type'">58</xsl:when>
			<xsl:when test="@name='DefErmittlungseinheit_Type'">59</xsl:when>
			<xsl:when test="@name='PreisstufenErmittlungen_Type'">60</xsl:when>
			<xsl:when test="@name='SortengruppenErmittlungen_Type'">61</xsl:when>
			
			<!-- Erweiterung V3.2 -->
			<xsl:when test="@name='DefStreckenart_Type'">62</xsl:when>
			<xsl:when test="@name='DefStreckencodetyp_Type'">63</xsl:when>
			<xsl:when test="@name='OrtspunktStreckencode_Type'">64</xsl:when>
			<xsl:when test="@name='Streckencode_Type'">65</xsl:when>
			<xsl:when test="@name='Strecke_Type'">66</xsl:when>
			<xsl:when test="@name='Streckenzuordnung_Type'">67</xsl:when>
			<xsl:when test="@name='Gleichstellungstyp_Type'">68</xsl:when>
			<xsl:when test="@name='GleichstellungTarifart_Type'">69</xsl:when>
			<xsl:when test="@name='Gleichstellung_Type'">70</xsl:when>
			<xsl:when test="@name='Streckenvias_Type'">71</xsl:when>
			
		  	<xsl:otherwise>Fehler: Tabellennummer undefiniert</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- ===============================================================================
		Liefert alle INSERT SQL Anweisungen für Initialewerte von verschiedenen Tabellen.
		Aktuell unterstützt werden: 
		  VersionStruktur
		  Tabelleninfo
		  
		Mode: "initialvalues"
    =============================================================================== --> 
	<xsl:template match="/xs:schema" mode="initialvalues">
		<!-- Tabelleninfo mit den Strukturinformationen füllen für Tabellen mit einer Tabellennummer -->
		<xsl:value-of select="$crlf"/>
		<xsl:for-each select="/xs:schema/xs:*[concat('husstDV:',@name)=/xs:schema/xs:element/@type
		  and descendant::xs:element[@type='husstDV:DynAttribut_Subtype']
		  ]">
			<xsl:sort select="@name"/>
		    
		  	<xsl:variable name="tableName" select="/xs:schema/xs:element[current()/@name=substring-after(@type,':')]/@name"/>
			<xsl:variable name="structureName" select="current()/@name"/>
			<xsl:variable name="tabellennummer">
				<xsl:apply-templates mode="tabellennummer" select="current()"/>
			</xsl:variable>

			<xsl:text>INSERT INTO Tabelleninfo (Tabellenname, Tabellennummer, Strukturname)</xsl:text>
			<xsl:text> VALUES ("</xsl:text><xsl:value-of select="$tableName"/>
			<xsl:text>", </xsl:text><xsl:value-of select="$tabellennummer"/>
			<xsl:text>, "</xsl:text><xsl:value-of select="$structureName"/>
			<xsl:text>"); </xsl:text>

			<xsl:value-of select="$crlf"/>
		</xsl:for-each>
		
		<!-- Versionsinformation schreiben -->
		<xsl:text>INSERT INTO VersionStruktur (VersionMajor, VersionMinor, VersionPatch, Status, Aenderungsdatum)</xsl:text>
		<xsl:text> VALUES (</xsl:text><xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='VersionMajor']/@default"/>
		<xsl:text>, </xsl:text><xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='VersionMinor']/@default"/>
		<xsl:text>, </xsl:text><xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='VersionPatch']/@default"/>
		<xsl:text>, "</xsl:text><xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='Status']/@default"/>
		<xsl:text>", "</xsl:text><xsl:value-of select="//xs:complexType[@name='VersionStruktur_Type']/descendant::xs:element[@name='Aenderungsdatum']/@default"/>
		<xsl:text>"); </xsl:text>
	
		<xsl:value-of select="$crlf"/>
		
	</xsl:template>

	<!-- ===============================================================================
		
		Liefert das gesamte SQL Script.
		
    =============================================================================== --> 
	<xsl:template match="/xs:schema">
		<!-- Kommentarkopf der erzeugten SQL Datei -->
		<xsl:text>/************************************************************************************</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:text>* HUSST Versorgungsdaten</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:text>*</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:text>* automatisch generiertes SQL Script zur Erzeugung einer leeren HUSST DV Datenbank</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:if test="$current_date">
			<xsl:text>* generiert am </xsl:text>
			<xsl:value-of select="concat(concat(concat(substring($current_date,1,4),'-'),substring($current_date,5,2),'-'),substring($current_date,7,2))"/>
			<xsl:value-of select="$crlf"/>
		</xsl:if>
		<xsl:text>*</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:text>* HUSST Datenversorgung (</xsl:text><xsl:value-of select="$HUSSTversion"/><xsl:text> )</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:text>*</xsl:text><xsl:value-of select="$crlf"/>
		<xsl:text>*************************************************************************************/</xsl:text><xsl:value-of select="$crlf"/>

		<!-- Alle Tabellendefinitionen anlegen, alphabetisch sortiert -->
		<xsl:for-each select="xs:element[not(@name='OePVTarifDB')]">
			<xsl:sort select="@name"/>

			<xsl:value-of select="$crlf"/>
			<xsl:apply-templates mode="tabledef" select="current()"/>
		</xsl:for-each>
		
		<!-- DB-Abbildungs-Spezialtabellen -->
		<xsl:for-each select="xs:complexType[@name='DynAttributDef_Type' or @name='DynAttributWert_Type' 
		or @name='Sprachtexte_Type' or @name='Tabelleninfo_Type']">
			<xsl:sort select="@name"/>

			<xsl:value-of select="$crlf"/>
			<xsl:apply-templates mode="tabledef" select="current()"/>
		</xsl:for-each>

		<!-- Initialwerte -->
		<xsl:apply-templates mode="initialvalues" select="current()"/>
	</xsl:template>

	<!-- Defaultverhalten - nichts kopieren -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>	
</xsl:stylesheet>