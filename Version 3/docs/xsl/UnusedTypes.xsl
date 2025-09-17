<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:husstDV="http://husst.de/Versorgungsdaten/3_7_0"
    xmlns:api="http://www.husst.de/Appinfo/3_7_0"
>
	<xsl:output method="text" encoding="UTF-8" />

	<!-- 	sucht nach nicht verwendeten Datentypdefinitionen
	-->

	<!-- ======================================================================
		 Parameter 
	= =  ================================================================== = = -->

  
	<!-- ======================================================================
		 die gesamte Xsd 
	= =  ================================================================== = = -->
	
	<xsl:template match="xs:simpleType | xs:complexType"
	  xmlns:xs="http://www.w3.org/2001/XMLSchema">
	  <xsl:if test="
	    not(some $ref in (//@type|//@ref|//@memberTypes) satisfies contains(string($ref), concat(':',@name)))
	  ">
	    <xsl:value-of select="@name"/>
	    <xsl:text>&#13;&#10;</xsl:text>
	  </xsl:if>
	</xsl:template>

	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>	
</xsl:stylesheet>