<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
  				xmlns:ktx="http://www.krauth-technology.de/ktXsdKtTools/1.0"
           	    xmlns:husstDV="http://husst.de/Versorgungsdaten/3_4_1"
                xmlns:api="http://www.husst.de/Appinfo/3_4_1">
                
	<xsl:output method="text" encoding="UTF-8"/>


	<xsl:variable name="namedTypes">
		<xsl:for-each select="/xs:schema/xs:*[@name]">
			<type><name><xsl:value-of select="@name"/></name></type>	
		</xsl:for-each>
	</xsl:variable>


<!-- ==================================================
   	 function kt:toAnalyze()
     True, wenn element im analyze Parameter definiert ist.  
    
     mögliche Werte sind
     complexType,simpleType,const,enumeration	
	=================================================== -->   
	
	<xsl:function name="kt:toAnalyze" as="xs:boolean">
		<xsl:param name="element"/>
		<xsl:sequence select="$element and contains($analyzeC, ktx:strC($element))"/>
	</xsl:function>
	

	<xsl:template match="xs:complexType[@name='OePVTarifDB_Type']">
		<xsl:for-each select="//xs:*[concat('husstDV:', @name)=//xs:element[concat('husstDV:', @name)=current()/xs:*/xs:element/@ref]/@type]">
		<xsl:sort select="concat(concat(xs:annotation/xs:appinfo/api:schema/@name,'::'), @name)"/>
		<xsl:text>Schema:</xsl:text>
		<xsl:value-of select="xs:annotation/xs:appinfo/api:schema/@name"/><xsl:text>, </xsl:text>
		<xsl:text>Typ:</xsl:text>
		<xsl:value-of select="@name"/><xsl:text>
</xsl:text>		
		</xsl:for-each>
		
		<xsl:text>die schema-freien</xsl:text>		
		<xsl:for-each select="/xs:schema/xs:*[not(concat('husstDV:', @name)=/xs:schema/xs:element/@type)]">
			<xsl:text>"</xsl:text>
			<xsl:for-each select="/xs:schema/xs:*[substring(local-name(),string-length(local-name())-3)='Type']/xs:*/xs:element[concat('husstDV:',current()/@name)=@type]">
				<xsl:sort select="../../xs:annotation/xs:appinfo/api:schema/@name" />
				<xsl:if test = "not(preceding::xs:*[xs:annotation/xs:appinfo/api:schema/@name=current()/../../xs:annotation/xs:appinfo/api:schema/@name]/xs:*/xs:element[concat('husstDV:',current()/@name)=@type])">
		  			<xsl:value-of select="../../xs:annotation/xs:appinfo/api:schema/@name" />			
		  			<xsl:text>,</xsl:text>
	  			</xsl:if>			  
			</xsl:for-each>
			<xsl:value-of select="@name"/>
			<xsl:text>", </xsl:text>
			<xsl:text>
</xsl:text>		
		</xsl:for-each>
		
	</xsl:template>
	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>	
</xsl:stylesheet>