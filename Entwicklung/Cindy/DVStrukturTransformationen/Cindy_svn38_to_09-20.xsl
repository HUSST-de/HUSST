<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:husstDV="http://husst.de/Versorgungsdaten/Cindy"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:api="http://www.husst.de/Appinfo/Cindy"
>
  <xsl:output indent="yes"   
  />
    <!--
		Transformiert die Husst DV-Struktur.
		Bitte folgendermaßen vorgehen:

		1. HUSST_Versorgungsdaten_Cindy.xsd 
			aus der Subversion Revision 38 bei sourceforge verwenden

		2. den <xsl:stylesheet Eintrag erweitern, und ändern:      
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:husstDV="http://husst.de/Versorgungsdaten/Cindy"
	xmlns:api="http://www.husst.de/Appinfo/Cindy"
	targetNamespace="http://husst.de/Versorgungsdaten/Cindy"
	elementFormDefault="qualified" attributeFormDefault="unqualified">

		3. Suchen und ersetzen: husst: durch husstDV:

		4. Transformation durchführen

		5. <xsl:stylesheet Eintrag ersetzen aus 2.
			wegen der besseren Lesbarkeit mit den Zeilenumbrüchen    
    --> 
    
    
    <!--  Für leere Xml-Tags durchgängig verkürzte Schreibweise verwenden. 
    IDEE: 
    suche:   "(<(\S+(:\S+))([^<]+))>\s*<\/\2>"    
    ersetze: "\1/>"
    mit Regulären Ausdrücken     
    -->

	<!-- Versionsinformation als globale Variable definieren -->
	<xsl:variable name="VS_VersionMajor">3</xsl:variable>
	<xsl:variable name="VS_VersionMinor">0</xsl:variable>
	<xsl:variable name="VS_Status">in Arbeit</xsl:variable>
	<xsl:variable name="VS_Aenderungsdatum">2019-09-20</xsl:variable>
	<xsl:variable name="VS_Aenderungsautor">HUSST-Arbeitsgruppe / Neubauer(kt)</xsl:variable>

	<!-- Versionsinformation anpassen -->
	<xsl:template match="xs:element[@name='VersionMajor']/@default">
		<xsl:attribute name="default"><xsl:value-of select="$VS_VersionMajor"/></xsl:attribute>
	</xsl:template>
	<xsl:template match="xs:element[@name='VersionMinor']/@default">
		<xsl:attribute name="default"><xsl:value-of select="$VS_VersionMinor"/></xsl:attribute>
	</xsl:template>
	<xsl:template match="xs:element[@name='Status']/@default">
		<xsl:attribute name="default"><xsl:value-of select="$VS_Status"/></xsl:attribute>
	</xsl:template>
	<xsl:template match="xs:element[@name='Aenderungsdatum']/@default">
		<xsl:attribute name="default"><xsl:value-of select="$VS_Aenderungsdatum"/></xsl:attribute>
	</xsl:template>
	<xsl:template match="xs:element[@name='Aenderungsautor']/@default">
		<xsl:attribute name="default"><xsl:value-of select="$VS_Aenderungsautor"/></xsl:attribute>
	</xsl:template>

	<!-- Kopfkommentar ersetzen -->
	<xsl:template match="xs:schema/xs:annotation/xs:documentation">
		<xsl:copy>
			<xsl:text>
			Tarifdatenversorgung von Verkaufssystemen
			</xsl:text>

			<xsl:text>Version: Cindy</xsl:text>
<!-- 	 später, wenn wir den Arbeitnamen 'Cindy' verlassen -->		
<!-- 			<xsl:text>V </xsl:text>			<xsl:value-of select="$VS_VersionMajor"/> -->
<!-- 			<xsl:text>.</xsl:text>			<xsl:value-of select="$VS_VersionMinor"/> -->
			<xsl:text> - </xsl:text>		<xsl:value-of select="$VS_Status"/>
			<xsl:text> - </xsl:text>		<xsl:value-of select="$VS_Aenderungsdatum"/>

			Lizenzmodell:   CC BY-SA 4.0
			homepage:       www.husst.de
			Git Repository: https://github.com/HUSST-de/HUSST
		</xsl:copy>		
	</xsl:template>

	<!-- Diverse Unique-Indizes einrichten -->
    <xsl:template match="index[@name='Idx_Feiertag_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Feiertage</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">Datum</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Bundesland</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_NachbarHst_Main']"><xsl:text>
				</xsl:text><xsl:element name="api:uniquekey">
      			<xsl:attribute name="name">Uix_Nachbarhaltestellen</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
	      			<xsl:attribute name="name">ID_OrtspunktVon</xsl:attribute>
		      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      				<xsl:attribute name="name">ID_OrtspunktNach</xsl:attribute>
		      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      				<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      			</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_OP_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Ortspunkte</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">Ortsnummer</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Ortspunkttyp</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_OPTG_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_OrtspunkteTG</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Ortspunkt</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Tarifgebiet</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_Pr_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Preise</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Preisstufe</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Sorte</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Preisspalte</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_Preisstufennummer']">
    </xsl:template>

    <xsl:template match="index[@name='Idx_TagMerkEl_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_TagesmerkmalElemente</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Tagesmerkmal</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">Bezeichnung</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_RZ_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Relationszuordnungen</xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Teilrelation</xsl:attribute>
      	</xsl:element><xsl:text>
			</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Relation</xsl:attribute>
      	</xsl:element><xsl:text>
			</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Relationszuordung</xsl:attribute>
      	</xsl:element><xsl:text>
			</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
		</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='IDX_ZS_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Zusatzsorten</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Sorte</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ZuordnungRelCodeGrp</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_WP_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Wegpositionen</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Weg</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">SortOrder</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

    <xsl:template match="index[@name='Idx_SoGr_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Sortengruppen</xsl:attribute><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">Sortengruppennummer</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Sortengruppentyp</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Bediengebiet</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">SortOrder</xsl:attribute>
      	</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element><xsl:text>
				</xsl:text></xsl:element>
    </xsl:template>

	<xsl:template match="xs:complexType[@name='TarifpunktmengeElemente_Type']">
		<xsl:copy>
			<xsl:apply-templates select="@*" /><xsl:text>
		</xsl:text><xsl:element name="xs:annotation"><xsl:text>
			</xsl:text><xsl:element name="xs:documentation"><xsl:text>
				</xsl:text>Eintrag in einer geordneten Menge von Tarifpunkten.<xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:appinfo"><xsl:text>
				</xsl:text><xsl:element name="api:primekey"><xsl:text>
					</xsl:text><xsl:element name="api:field">
						<xsl:attribute name="name">ID_TarifpunktmengeElement</xsl:attribute>
					</xsl:element><xsl:text> 
					</xsl:text><xsl:element name="api:field">	
						<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
					</xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="api:schema">
					<xsl:attribute name="name">Tarif</xsl:attribute>
					<xsl:attribute name="nillable">true</xsl:attribute>
				</xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element>
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

    <xsl:template match="primekey[@name='Idx_TagartMerkEl_Main']">
      <xsl:element name="api:uniquekey">
      	<xsl:attribute name="name">Uix_Tarifpunkte</xsl:attribute>
      	<xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Betriebstagesart</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Sortengruppentyp</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Bediengebiet</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="api:field">
      		<xsl:attribute name="name">SortOrder</xsl:attribute>
      	</xsl:element>
      	<xsl:element name="api:field">
      		<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
      	</xsl:element>
      </xsl:element>
    </xsl:template>

	<!-- Diverse überflüssige Indizes löschen -->
    <xsl:template match="index[
      @name='Idx_Kalender_BTagArt'
      or @name='Idx_NachbarHst_PstTg'
      or @name='Idx_OP_IBISnr'
      or @name='Idx_OP_RelCode'
      or @name='Idx_OP_ExtOrtsNummer'
      or @name='Idx_OPKA_OrtOrgID'
      or @name='Idx_PstDirekt_Main'
      or @name='Idx_Relation'
      or @name='IDX_REL_START_ZIEL'
      or @name='Idx_Relcodegruppe_Main'
      or @name='Idx_Relcodegruppe_Relcode'
      or @name='Idx_So_Tarifgebiet'
      or @name='Idx_So_Tarifgeber'
      or @name='Idx_So_Komfortklasse'
      or @name='Idx_So_Rabattklasse'
      or @name='Idx_So_Fahrgasttyp'
      or @name='Idx_TR_StartTarifpunkt'
      or @name='Idx_TR_ZielTarifpunkt'
      or @name='Idx_TR_Pst'
      or @name='Idx_WP_OP'
      or @name='Idx_SoGr_ID_Sorte'
      or @name='Idx_TagartMerkEl_Main'
      or @name='Idx_OTP_Main'
      or @name='Idx_OTP_Relcode'      
      ]"/>

	<!-- Überflüssigen Type Sortenattributgruppen_Type löschen -->
	<xsl:template match="xs:*[@name='Sortenattributgruppen_Type' or @name='Sortenattributgruppen'
	or @ref='husstDV:Sortenattributgruppen']"/>
	<!-- Komfortklasse zu ID_Komfortklasse in Teilrelationen korrigieren -->
    <xsl:template match="xs:element[@name='Komfortklasse']">
      <xsl:element name="xs:element">
      	<xsl:attribute name="name">ID_Komfortklasse</xsl:attribute>
      	<xsl:attribute name="type">husstDV:ID_Komfortklasse_Type</xsl:attribute>
      	<xsl:attribute name="nillable">true</xsl:attribute>      	
		<xsl:attribute name="minOccurs">0</xsl:attribute>
		<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation" ><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Hinweis zur Komfortklasse (1.Klasse/2.Klasse etc).<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element>
    </xsl:template>

	<!-- Vertriebswege in Relationen und Preisstufendirektwahlen anpassen
	 -->
    <xsl:template match="xs:element[@name='Vertriebswege']">
		<xsl:element name="xs:element">
			<xsl:attribute name="name">ID_Vertriebswege</xsl:attribute>
			<xsl:attribute name="type">husstDV:ID_Vertriebswege_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Schränkt die Verwendung des Elements auf die angegebenen Vertriebswege ein.<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element>
    </xsl:template>
    <xsl:template match="xs:simpleType[@name='ID_VertriebswegeHUSST_Type']/xs:annotation/xs:documentation">
    	<xsl:element name="xs:documentation">
				Die HUSST definiert ID_Vertriebswege kleiner 1024
			</xsl:element>
    </xsl:template>
    <xsl:template match="xs:simpleType[@name='ID_Vertriebswege_Type']/xs:annotation/xs:documentation">
    	<xsl:element name="xs:documentation">
				Die ID_Vertriebswege ist entweder eine von HUSST vordefinierter Zahl kleiner 1024 oder eine im Projekt vereinbarte Zahl &gt;= 1024.
			</xsl:element>
    </xsl:template>
    <xsl:template match="xs:simpleType[@name='ID_Vertriebswege_Type']/xs:union/@memberTypes">
    	<xsl:attribute name="memberTypes">husstDV:ID_VertriebswegeHUSST_Type husstDV:ID_ProjektspezifischBitfeld_Type</xsl:attribute>
    </xsl:template>

    <xsl:template match="xs:simpleType[@name='ID_Zahlungsarten_Type']/xs:union/@memberTypes">
    	<xsl:attribute name="memberTypes">husstDV:ID_ZahlungsartenHUSST_Type husstDV:ID_ProjektspezifischBitfeld_Type</xsl:attribute>
    </xsl:template>

    <xsl:template match="xs:simpleType[@name='ID_Sortenausgaberegelung_Type']/xs:annotation/xs:documentation">
    	<xsl:element name="xs:documentation">
				Die ID_Sortenausgaberegelung ist entweder eine von HUSST vordefinierter Zahl kleiner 1024 oder eine im Projekt vereinbarte Zahl &gt;= 1024.
			</xsl:element>
    </xsl:template>
    <xsl:template match="xs:simpleType[@name='ID_Sortenausgaberegelung_Type']/xs:union/@memberTypes">
    	<xsl:attribute name="memberTypes">husstDV:ID_SortenausgaberegelungHUSST_Type husstDV:ID_ProjektspezifischBitfeld_Type</xsl:attribute>
    </xsl:template>



	<!-- GueltigZeit_Type beim Preis_Type einfügen und GueltigParam/Regel/Text entfernen
	 -->
    <xsl:template match="xs:element[@name='GueltigRegel' or @name='GueltigZeit']">
		<xsl:element name="xs:element">
			<xsl:attribute name="name">ID_GueltigkeitszeitRegel</xsl:attribute>
			<xsl:attribute name="type">husstDV:INT4</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Definiert die zeitliche Gültigkeit des Produktes.<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element>
    </xsl:template>
    <xsl:template match="xs:element[@name='GueltigParam']"/>
    <xsl:template match="xs:element[@name='GueltigText']"/>
    <xsl:template match="xs:element[@name='Vorverkauf']"/>
    <xsl:template match="xs:element[@name='Umschalttag']"/>
    <xsl:template match="xs:simpleType[@name='GueltigZeit_Type']">
		<xsl:element name="xs:complexType">
			<xsl:attribute name="name">GueltigkeitszeitRegel</xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="xs:annotation"><xsl:text>
			</xsl:text><xsl:element name="xs:documentation"><xsl:text>
				</xsl:text>Definiert eine zeitliche Gültigkeit. Darin enthalten sein kann auch die Vorverkaufbarkeit <xsl:text>
				</xsl:text>(Regel zum möglichen Gültigkeitsbeginn) und die Umschaltung auf einen neuen Default-Gültigkeitsbeginn.<xsl:text>
				</xsl:text>Der Datentyp wird noch weiter ausgebaut und in einer eigenen HUSST-Definition konkretisiert. 
			</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:appinfo"><xsl:text>
				</xsl:text><xsl:element name="api:primekey"><xsl:text>
					</xsl:text><xsl:element name="api:field">
		      				<xsl:attribute name="name">ID_GueltigkeitszeitRegel</xsl:attribute>
	    	  			</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
	      					<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
	      				</xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="api:schema">
						<xsl:attribute name="name">Tarif</xsl:attribute>
						<xsl:attribute name="nillable">true</xsl:attribute>
					</xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><xsl:element name="xs:sequence"><xsl:text>
			</xsl:text><xsl:element name="xs:element">			
					<xsl:attribute name="name">Deaktiviert</xsl:attribute>						
					<xsl:attribute name="type">xs:boolean</xsl:attribute>						
					<xsl:attribute name="nillable">true</xsl:attribute>						
					<xsl:attribute name="minOccurs">0</xsl:attribute>						
					<xsl:attribute name="maxOccurs">1</xsl:attribute>						
				</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">			
					<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>						
					<xsl:attribute name="type">husstDV:INT4</xsl:attribute>						
					<xsl:attribute name="nillable">false</xsl:attribute>						
					<xsl:attribute name="minOccurs">1</xsl:attribute>						
					<xsl:attribute name="maxOccurs">1</xsl:attribute>						
				</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">			
					<xsl:attribute name="name">ID_GueltigkeitszeitRegel</xsl:attribute>						
					<xsl:attribute name="type">husstDV:INT4</xsl:attribute>						
					<xsl:attribute name="nillable">false</xsl:attribute>						
					<xsl:attribute name="minOccurs">1</xsl:attribute>						
					<xsl:attribute name="maxOccurs">1</xsl:attribute>						
				</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">			
					<xsl:attribute name="name">GueltigkeitszeitRegelNr</xsl:attribute>						
					<xsl:attribute name="type">husstDV:INT4</xsl:attribute>						
					<xsl:attribute name="nillable">false</xsl:attribute>						
					<xsl:attribute name="minOccurs">1</xsl:attribute>						
					<xsl:attribute name="maxOccurs">1</xsl:attribute>						
				</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">			
					<xsl:attribute name="name">Param</xsl:attribute>						
					<xsl:attribute name="type">xs:string</xsl:attribute>						
					<xsl:attribute name="nillable">true</xsl:attribute>						
					<xsl:attribute name="minOccurs">0</xsl:attribute>						
					<xsl:attribute name="maxOccurs">1</xsl:attribute>						
				</xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
	</xsl:text></xsl:element>
    </xsl:template>
    
    <!-- ID_ProjektspezifischBitfeld_Type -->
    <xsl:template match="xs:simpleType[@name='ID_Projektspezifisch_Type']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy><xsl:text>

	</xsl:text><xsl:element name="xs:simpleType">
		<xsl:attribute name="name">ID_ProjektspezifischBitfeld_Type</xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="xs:annotation"><xsl:text>
			</xsl:text><xsl:element name="xs:documentation"><xsl:text>
				</xsl:text>Frei definierbare IDs für Def-Elemente auf Bitfeld Basis beginnen mit 1024
			</xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><xsl:element name="xs:restriction">
			<xsl:attribute name="base">husstDV:INT4</xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="xs:minInclusive">
	      		<xsl:attribute name="value">1024</xsl:attribute>
	      	</xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
	</xsl:text></xsl:element>
	</xsl:template>
		

	<!-- Bediengebiet und Nachbarhaltestellentyp ergänzt -->
    <xsl:template match="xs:simpleType[@name='ID_Reisetyp_Type']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy><xsl:text>
		
	</xsl:text><xsl:element name="xs:complexType">
		<xsl:attribute name="name">DefNachbarhaltestellenbeziehung_Type</xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="xs:annotation"><xsl:text>
			</xsl:text><xsl:element name="xs:documentation"><xsl:text>
				</xsl:text>Art einer Nachbarhaltestellenbeziehung.<xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:appinfo"><xsl:text>
				</xsl:text><xsl:element name="api:primekey"><xsl:text>
					</xsl:text><xsl:element name="api:field">
		      				<xsl:attribute name="name">ID_Nachbarhaltestellenbeziehung</xsl:attribute>
	    	  			</xsl:element><xsl:text>
					</xsl:text><xsl:element name="api:field">
	      					<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
	      				</xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
				</xsl:text><xsl:element name="api:schema">
						<xsl:attribute name="name">Angebot</xsl:attribute>
						<xsl:attribute name="nillable">true</xsl:attribute>
					</xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><xsl:element name="xs:sequence"><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">Deaktiviert</xsl:attribute>
			<xsl:attribute name="type">xs:boolean</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">ID_Nachbarhaltestellenbeziehung</xsl:attribute>
			<xsl:attribute name="type">husstDV:ID_Nachbarhaltestellenbeziehung_Type</xsl:attribute>
			<xsl:attribute name="nillable">false</xsl:attribute>
			<xsl:attribute name="minOccurs">1</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Art der Nachbarbeziehung.<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">ID_Zeitraum</xsl:attribute>
			<xsl:attribute name="type">husstDV:INT4</xsl:attribute>
			<xsl:attribute name="nillable">false</xsl:attribute>
			<xsl:attribute name="minOccurs">1</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">Bezeichnung</xsl:attribute>
			<xsl:attribute name="type">xs:string</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Bezeichnung der Art der Nachbarbeziehung.<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
   	</xsl:text></xsl:element><xsl:text>
		
	</xsl:text><xsl:element name="xs:simpleType">
		<xsl:attribute name="name">ID_NachbarhaltestellenbeziehungHUSST_Type</xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="xs:annotation"><xsl:text>
			</xsl:text><xsl:element name="xs:documentation"><xsl:text>
				</xsl:text>Die HUSST definiert ID_Nachbarhaltestellenbeziehung kleiner 1000<xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><xsl:element name="xs:restriction">
			<xsl:attribute name="base">husstDV:INT4</xsl:attribute><xsl:text>
			</xsl:text><xsl:element name="xs:enumeration">
	      		<xsl:attribute name="value">0</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>nicht spezifiziert/unbestimmt<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:enumeration">
	      		<xsl:attribute name="value">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Kurzstrecke<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
	</xsl:text></xsl:element>
   	<xsl:text>		
	</xsl:text><xsl:element name="xs:simpleType">
		<xsl:attribute name="name">ID_Nachbarhaltestellenbeziehung_Type</xsl:attribute><xsl:text>
		</xsl:text><xsl:element name="xs:annotation"><xsl:text>
			</xsl:text><xsl:element name="xs:documentation"><xsl:text>
				</xsl:text>Die ID_Nachbarhaltestellenbeziehung ist entweder eine von HUSST vordefinierter Zahl kleiner 1000 oder eine im Projekt vereinbarte Zahl &gt;= 1000.<xsl:text>
			</xsl:text></xsl:element><xsl:text>
		</xsl:text></xsl:element><xsl:text>
		</xsl:text><xsl:element name="xs:union">
		<xsl:attribute name="memberTypes">husstDV:ID_NachbarhaltestellenbeziehungHUSST_Type husstDV:ID_Projektspezifisch_Type</xsl:attribute>
		</xsl:element><xsl:text>
   	</xsl:text></xsl:element>
   	
    </xsl:template>
    <xsl:template match="xs:element[@name='ID_Nachbarhaltestelle']">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">ID_Bediengebiet</xsl:attribute>
			<xsl:attribute name="type">husstDV:INT4</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Bediengebiet, in dessen Kontext die Nachbarbeziehung definiert ist .<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">ID_Nachbarhaltestellenbeziehung</xsl:attribute>
			<xsl:attribute name="type">husstDV:INT4</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
			<xsl:attribute name="minOccurs">0</xsl:attribute>
			<xsl:attribute name="maxOccurs">1</xsl:attribute><xsl:text>
				</xsl:text><xsl:element name="xs:annotation"><xsl:text>
					</xsl:text><xsl:element name="xs:documentation"><xsl:text>
						</xsl:text>Art der Nachbarbeziehung.<xsl:text>
					</xsl:text></xsl:element><xsl:text>
				</xsl:text></xsl:element><xsl:text>
			</xsl:text></xsl:element>
    </xsl:template>
	


	<!-- Diverse Schema-Zuordnungen erweitern -->
    <xsl:template match="xs:appinfo[ancestor::xs:*/@name='DefVertriebswege_Type']">
    	<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
<xsl:text>	</xsl:text><xsl:element name="api:schema">
				<xsl:attribute name="name">Angebot</xsl:attribute>
				<xsl:attribute name="nillable">true</xsl:attribute>						
			</xsl:element><xsl:text>
			</xsl:text></xsl:copy>
    </xsl:template>

    <xsl:template match="xs:appinfo[ancestor::xs:*/@name='Sortengruppen_Type']">
    	<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
<xsl:text>	</xsl:text><xsl:element name="api:schema">
				<xsl:attribute name="name">Angebot</xsl:attribute>
				<xsl:attribute name="nillable">true</xsl:attribute>						
			</xsl:element><xsl:text>
			</xsl:text></xsl:copy>
    </xsl:template>

	<!-- Husst-Appinfo Namespace anwenden
	
	     Diverse Schema-Zuordnungen ändern  
	-->
    <xsl:template match="xs:appinfo/primekey">
		<xsl:element name="api:primekey">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
    </xsl:template>
    <xsl:template match="xs:appinfo/primekey/field">
		<xsl:element name="api:field">
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:element>
    </xsl:template>
    <xsl:template match="xs:appinfo/schema">
		<xsl:element name="api:schema">
			<xsl:choose>
				<xsl:when test="ancestor::xs:*/@name='Relationen_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>
				<xsl:when test="ancestor::xs:*/@name='DefRelationenberechnungsregelung_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>				
				<xsl:when test="ancestor::xs:*/@name='DefRelationendruckregelung_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>				
				<xsl:when test="ancestor::xs:*/@name='DefRelationscodegruppentyp_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>				
				<xsl:when test="ancestor::xs:*/@name='Nachbarhaltestellen_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>				
				<xsl:when test="ancestor::xs:*/@name='OrtspunkteTG_Type'">
					<xsl:attribute name="name">Tarif</xsl:attribute>
				</xsl:when>				
				<xsl:when test="ancestor::xs:*/@name='Relationen_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>
				<xsl:when test="ancestor::xs:*/@name='Relationscodegruppen_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:when test="ancestor::xs:*/@name='Relationscodes_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:when test="ancestor::xs:*/@name='Relationszuordnungen_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:when test="ancestor::xs:*/@name='Vias_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:when test="ancestor::xs:*/@name='Relationscodes_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:when test="ancestor::xs:*/@name='Relationscodes_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:when test="ancestor::xs:*/@name='Relationscodes_Type'">
					<xsl:attribute name="name">Angebot</xsl:attribute>
				</xsl:when>								
				<xsl:otherwise>
					<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="@*[name()!='name']"/>
			<xsl:apply-templates/>
		</xsl:element>
    </xsl:template>

	<!-- fehlende Elementdefinitionen ergänzen -->
	<xsl:template match="xs:element[@name='VersionStruktur']">
		<xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates />
		</xsl:copy><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefFahrgasttypen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefFahrgasttyp_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefKomfortklassen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefKomfortklasse_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefNachbarhaltestellenbeziehungen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefNachbarhaltestellenbeziehung_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefPreisfindungen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefPreisfindung_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefRabattklassen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefRabattklasse_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefReisetypen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefReisetyp_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefSortenausgaberegelungen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefSortenausgaberegelung_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefSortendruckregelungen</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefSortendruckregelung_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefVertriebswege</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefVertriebswege_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">DefZahlungsarten</xsl:attribute>
			<xsl:attribute name="type">husstDV:DefZahlungsarten_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element><xsl:text>
<!-- 	</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="name">DynAttributDef</xsl:attribute> -->
<!-- 			<xsl:attribute name="type">husstDV:DynAttributDef_Type</xsl:attribute> -->
<!-- 			<xsl:attribute name="nillable">true</xsl:attribute> -->
<!-- 		</xsl:element><xsl:text> -->
<!-- 	</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="name">DynAttributWert</xsl:attribute> -->
<!-- 			<xsl:attribute name="type">husstDV:DynAttributWert_Type</xsl:attribute> -->
<!-- 			<xsl:attribute name="nillable">true</xsl:attribute> -->
<!-- 		</xsl:element><xsl:text> -->
	</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="name">Relationszuordnungen</xsl:attribute>
			<xsl:attribute name="type">husstDV:Relationszuordnungen_Type</xsl:attribute>
			<xsl:attribute name="nillable">true</xsl:attribute>
		</xsl:element>
<!-- 		<xsl:text> -->
<!-- 	</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="name">Sprachtexte</xsl:attribute> -->
<!-- 			<xsl:attribute name="type">husstDV:Sprachtexte_Type</xsl:attribute> -->
<!-- 			<xsl:attribute name="nillable">true</xsl:attribute> -->
<!-- 		</xsl:element><xsl:text> -->
<!-- 	</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="name">Tabelleninfo</xsl:attribute> -->
<!-- 			<xsl:attribute name="type">husstDV:Tabelleninfo_Type</xsl:attribute> -->
<!-- 			<xsl:attribute name="nillable">true</xsl:attribute> -->
<!-- 		</xsl:element> -->
	</xsl:template>
	<!-- fehlende Elementreferenzen ergänzen -->
	<xsl:template match="/xs:schema/xs:complexType[@name='OePVTarifDB_Type']/xs:choice/xs:element[@ref='husstDV:Bearbeitung']">
		<xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefFahrgasttypen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefKomfortklassen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefNachbarhaltestellenbeziehungen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefPreisfindungen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefRabattklassen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefReisetypen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefSortenausgaberegelungen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefSortendruckregelungen</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefVertriebswege</xsl:attribute>
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:DefZahlungsarten</xsl:attribute>
<!-- 		</xsl:element><xsl:text> -->
<!-- 			</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="ref">husstDV:DynAttributDef</xsl:attribute> -->
<!-- 		</xsl:element><xsl:text> -->
<!-- 			</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="ref">husstDV:DynAttributWert</xsl:attribute> -->
		</xsl:element><xsl:text>
			</xsl:text><xsl:element name="xs:element">
			<xsl:attribute name="ref">husstDV:Relationszuordnungen</xsl:attribute>
<!-- 		</xsl:element><xsl:text> -->
<!-- 			</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="ref">husstDV:Sprachtexte</xsl:attribute> -->
<!-- 		</xsl:element><xsl:text> -->
<!-- 			</xsl:text><xsl:element name="xs:element"> -->
<!-- 			<xsl:attribute name="ref">husstDV:Tabelleninfo</xsl:attribute> -->
		</xsl:element><xsl:text>
			</xsl:text><xsl:copy>
			<xsl:apply-templates select="@*" />
			<xsl:apply-templates />
		</xsl:copy>
	</xsl:template>

	<!-- Defaultverhalten - alles kopieren, was keine besondere Anweisung hat -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>	
</xsl:stylesheet>