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
		Entfernt alle nillable=?? Attribut Angaben.
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
    
	<xsl:template match="@nillable"/>

	<!-- Defaultverhalten - alles kopieren, was keine besondere Anweisung hat -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>	
</xsl:stylesheet>