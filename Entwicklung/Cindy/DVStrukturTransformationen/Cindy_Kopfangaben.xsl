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
		Transformiert die Husst DV-Struktur in dem es den aktuellen HUSST Header einsetzt.
		Bitte folgendermaßen vorgehen:

		1. HUSST_Versorgungsdaten_Cindy.xsd verwenden

		2. Transformation durchführen

		3. <xsl:stylesheet Eintrag ersetzen 
			wegen der besseren Lesbarkeit mit den Zeilenumbrüchen
für Versorgungsdaten:			
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:husstDV="http://husst.de/Versorgungsdaten/Cindy"
	xmlns:api="http://www.husst.de/Appinfo/Cindy"
	targetNamespace="http://husst.de/Versorgungsdaten/Cindy"
	elementFormDefault="qualified" attributeFormDefault="unqualified">

für Ergebnisdaten:			    
<schema targetNamespace="http://husst.de/Ergebnisdaten/Cindy" elementFormDefault="qualified" 
	xmlns="http://www.w3.org/2001/XMLSchema" 
	xmlns:husst="http://husst.de/Ergbnisdaten/Cindy">

für Appinfo:
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:api="http://www.husst.de/Appinfo/Cindy"
	targetNamespace="http://www.husst.de/Appinfo/Cindy" 
	elementFormDefault="qualified" attributeFormDefault="unqualified">

    --> 

	<!-- Kopfkommentar ersetzen -->
	<xsl:template match="xs:schema[@targetNamespace='http://husst.de/Versorgungsdaten/Cindy']/xs:annotation/xs:documentation">
		<xsl:copy>
			<xsl:text>
			HUSST Versorgungsdaten
			Version: Entwicklung "Cindy"

			Mehr Informationen:
			- https://husst.de/
			- https://github.com/HUSST-de/HUSST

			Lizensiert unter CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
			</xsl:text>
		</xsl:copy>		
	</xsl:template>

	<xsl:template match="xs:schema[@targetNamespace='http://www.husst.de/Appinfo/Cindy']/xs:annotation/xs:documentation">
		<xsl:copy>
			<xsl:text>
			HUSST Appinfo
			Version: Entwicklung "Cindy"

			Mehr Informationen:
			- https://husst.de/
			- https://github.com/HUSST-de/HUSST

			Lizensiert unter CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
		
			Diese Dokument dient als ergänzende Definition für Elemente in den XSDs.
			</xsl:text>
		</xsl:copy>		
	</xsl:template>

	<xsl:template match="xs:schema[@targetNamespace='http://husst.de/Ergebnisdaten/Cindy']/xs:annotation/xs:documentation">
		<xsl:copy>
			<xsl:text>
			HUSST Ergebnisdaten
			Version: Entwicklung "Cindy"

			Mehr Informationen:
			- https://husst.de/
			- https://github.com/HUSST-de/HUSST

			Lizensiert unter CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
			</xsl:text>
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