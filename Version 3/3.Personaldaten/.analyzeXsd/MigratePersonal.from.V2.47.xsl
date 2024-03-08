<?xml version="2.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:kt="http://www.krauth-technology.de/ktXmlDelphiDatenbindung/1.0"
	xmlns:dcb="http://www.krauth-technology.de/DelphiCodeBinding/1.0"
  xmlns:ktDelphiXml="http://www.krauth-technology.de/ktDelphiXml/1.0"
  xmlns:ktx="http://www.krauth-technology.de/ktXsdKtTools/1.0"
  xmlns:exsl="http://exslt.org/common"  
  xmlns:svn="svn"
  extension-element-prefixes = "exsl"
  >
	<xsl:template match="">
		<!-- TODO: Auto-generated template -->
	</xsl:template>
	
	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>	
</xsl:stylesheet>