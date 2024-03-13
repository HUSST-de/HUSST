<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
  				xmlns:ktx="http://www.krauth-technology.de/ktXsdKtTools/1.0"
           	    xmlns:husstDV="http://husst.de/Versorgungsdaten/3_5_0"
                xmlns:api="http://www.husst.de/Appinfo/3_5_0"
                xmlns:exsl="http://exslt.org/common"  
                extension-element-prefixes = "exsl">
                
	<xsl:output method="text" encoding="ISO-8859-1"/>


	<xsl:variable name="assignedSchema">
		<xsl:variable name="list">
			<type><name>Char</name><schemalist>Basis</schemalist></type>
			<type><name>DynAttributDef_Type</name><schemalist>Basis</schemalist></type>
			<type><name>DynAttributWert_Subtype</name><schemalist>Basis</schemalist></type>
			<type><name>DynAttributWert_Type</name><schemalist>Basis</schemalist></type>
			<type><name>INT8</name><schemalist>Basis</schemalist></type>
			<type><name>Sammelbeleg_Type</name><schemalist>Tarif</schemalist></type>
			<type><name>Sprachtexte_Type</name><schemalist>Basis</schemalist></type>
			<type><name>Tabelleninfo_Type</name><schemalist>Basis</schemalist></type>
			<type><name>Umschalttag_Type</name><schemalist>Tarif,Angebot</schemalist></type>
			<type><name>Vorverkauf_Type</name><schemalist>Tarif,Angebot</schemalist></type>
			<type><name>DauerMinuten</name><schemalist>Basis</schemalist></type>
			<type><name>FLOAT1</name><schemalist>Basis</schemalist></type>
			<type><name>INT1</name><schemalist>Basis</schemalist></type>
			<type><name>INT2</name><schemalist>Basis</schemalist></type>
			<type><name>Kalender_Type</name><schemalist>Basis</schemalist></type>
			<type><name>KoordWgs84_Type</name><schemalist>Basis</schemalist></type>
			<type><name>Tagesarten_Type</name><schemalist>Basis</schemalist></type>
			<type><name>TagesartMerkmalElemente_Type</name><schemalist>Basis</schemalist></type>
			<type><name>Tagesmerkmale_Type</name><schemalist>Basis</schemalist></type>
			<type><name>TagesmerkmalElemente_Type</name><schemalist>Basis</schemalist></type>
			<type><name>UhrzeitMinuten</name><schemalist>Basis</schemalist></type>
		</xsl:variable>
				
		<xsl:for-each select="exsl:node-set($list)/type">
			<xsl:apply-templates select="." mode="copy"/>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="unusedTypes">
		<xsl:variable name="list">
			<xsl:for-each select="/xs:schema/(xs:complexType | xs:simpleType)">
				<xsl:if test="not(//xs:*[substring-after(@type,':')=current()/@name][1]
				or //xs:*[contains(@memberTypes,current()/@name)][1]
				)">
					<type><name><xsl:value-of select="@name"/></name></type>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:for-each select="exsl:node-set($list)/type">
			<xsl:apply-templates select="." mode="copy"/>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="memberTypes">
		<xsl:variable name="list">
			<xsl:for-each select="/xs:schema/xs:simpleType/xs:union">
				<xsl:variable name="parentname"><xsl:value-of select="../@name"/></xsl:variable>
				<xsl:for-each select="tokenize(@memberTypes, '\s+')">
					<type>
						<parentname><xsl:value-of select="$parentname"/></parentname>
						<name><xsl:value-of select="substring-after(., ':')"/></name>				
					</type>
				</xsl:for-each>			
			</xsl:for-each>
		</xsl:variable>		
		<xsl:for-each select="exsl:node-set($list)/type">
			<xsl:apply-templates select="." mode="copy"/>
		</xsl:for-each>
	</xsl:variable>
	
	<!-- Name des Schemas der umgebenden Typdefinition -->
	<xsl:variable name="schemaParenttypes">
		<xsl:variable name="list">
			<xsl:for-each select="/xs:schema/(xs:complexType | xs:simpleType)/xs:*/xs:element[contains(@type,':')]">
				<type><name><xsl:value-of select="substring-after(@type,':')"/></name>
				<schema>
					<xsl:for-each select="../../xs:annotation/xs:appinfo/api:schema[@name]">
						<xsl:sort select="@name"/>
						<xsl:value-of select="@name"/>
						<xsl:if test="position()!=last()">::</xsl:if>
					</xsl:for-each>
				</schema></type>	
			</xsl:for-each>
			<xsl:for-each select="/xs:schema/(xs:complexType | xs:simpleType)/xs:*/xs:element[contains(@ref,':')]">
				<xsl:for-each select="/xs:schema/xs:element[@name=substring-after(current()/@ref,':') and contains(@type,':')]">
					<type><name><xsl:value-of select="substring-after(@type,':')"/></name>
					<schema>
						<xsl:for-each select="/xs:schema/(xs:complexType | xs:simpleType)[@name=substring-after(current()/@type,':')]/xs:annotation/xs:appinfo/api:schema[@name]">
							<xsl:sort select="@name"/>
							<xsl:value-of select="@name"/>
							<xsl:if test="position()!=last()">::</xsl:if>
						</xsl:for-each>
					</schema></type>	
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:for-each select="exsl:node-set($list)/type">
			<xsl:sort select="concat(name, '::', schema)" />
			<xsl:if test="not( preceding::type[name=current()/name and schema=current()/schema][1] )" >
				<xsl:apply-templates select="." mode="copy"/>
			</xsl:if>			
		</xsl:for-each>
	</xsl:variable>
	
   <!-- ==================================================
   	Variable $crlf
	Windows Zeilenschaltung
   =================================================== -->
 	<xsl:variable name="crlf">
 		<xsl:text>&#x0D;&#x0A;</xsl:text>
 	</xsl:variable>

	<xsl:function name="ktx:husstMainSchemaFromSchemalist">
		<xsl:param name="node" />
		<xsl:variable name="list">
			<xsl:for-each select="tokenize(
			  replace(
			  replace(
			  replace($node
			  , 'Angebot','Tarif')
			  , '::', ',')
			  , 'Tarifstrecken', 'Tarif')
			,',')">
				<xsl:sort select="." />
				<item><xsl:value-of select='.'/></item>											
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="compactList">
			<xsl:for-each select="exsl:node-set($list)/item">
				<xsl:if test="not(preceding::item[.=current()][1])">
					<xsl:value-of select="concat(.,',')" />
				</xsl:if>				
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="value">
<!-- 			<xsl:value-of select="$compactList"/> -->
			<xsl:choose>
				<xsl:when test="substring-after($compactList, ',') > ''">Basis</xsl:when>
				<xsl:when test="$compactList = ''">Basis</xsl:when>
				<xsl:otherwise><xsl:value-of select="substring-before($compactList, ',')"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:sequence select="$value"/>
	</xsl:function>

	<xsl:function name="ktx:husstSchema2husstXsd">
		<xsl:param name="node"/>

		<xsl:variable name="value">
			<xsl:choose>
				<xsl:when test="$node='Tarif'">HUSST_Versorgungsdaten.xsd</xsl:when>
				<xsl:when test="$node='Personal'">HUSST_Personaldaten.xsd</xsl:when>
				<xsl:when test="$node='unbenutzt'">unbenutzt</xsl:when>
				<xsl:otherwise>HUSST_Basisversorgungsdaten.xsd</xsl:otherwise>								
			</xsl:choose>
		</xsl:variable>
			
		<xsl:sequence select="$value"/>
	</xsl:function>
	
	<xsl:function name="ktx:husstXsd">
		<xsl:param name="node"/>	
		
		<xsl:variable name="value">
			<xsl:choose>
				<xsl:when test="$unusedTypes/type[name=$node] and not($assignedSchema/type[name=$node])">unbenutzt</xsl:when>
				<xsl:otherwise><xsl:value-of select="ktx:husstMainSchemaFromSchemalist(ktx:husstSchemalistCompact($node))"/></xsl:otherwise>								
			</xsl:choose>
		</xsl:variable>
			
		<xsl:sequence select="ktx:husstSchema2husstXsd($value)"/>
	</xsl:function>

	<xsl:function name="ktx:husstSchemalist">
		<xsl:param name="node"/>		

		<xsl:variable name="value">
			<xsl:choose>
				<xsl:when test="$node='OePVTarifDB_Type'">Angebot,Tarif,Tarifstrecken</xsl:when>
				<xsl:when test="$memberTypes/type[name=$node]">
					<xsl:value-of select="ktx:husstSchemalist($memberTypes/type[name=$node]/parentname)"/>
				</xsl:when>
				<xsl:when test="$assignedSchema/type[name=$node]"><xsl:value-of select="$assignedSchema/type[name=$node]/schemalist"/></xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="$schemaParenttypes/type[name=$node]">
						<xsl:value-of select="schema"/>
						<xsl:if test="position()!=last()">,</xsl:if>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:sequence select="$value"/>
	</xsl:function>
	
	<xsl:function name="ktx:husstSchemalistCompact">
		<xsl:param name="node" />
		<xsl:variable name="list">
			<xsl:for-each select="tokenize(replace(ktx:husstSchemalist($node), '::', ','),',')">
				<xsl:sort select="." />
				<item><xsl:value-of select='.'/></item>											
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="compactList">
			<xsl:for-each select="exsl:node-set($list)/item">
				<xsl:if test="not(preceding::item[.=current()][1])">
					<xsl:value-of select="concat(.,',')" />
				</xsl:if>				
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="value">
<!-- 			<xsl:value-of select="$compactList"/> -->
			<xsl:value-of select="substring($compactList, 1, string-length($compactList)-1 )"/>
		</xsl:variable>
		
		<xsl:sequence select="$value"/>
	</xsl:function>

	<xsl:function name="ktx:husstSchemaLine">
		<xsl:param name="xsd"/>
		<xsl:param name="schemalist"/>
		<xsl:param name="name"/>		
		<xsl:variable name="value">
			<xsl:text>"</xsl:text>
			<xsl:value-of select="$xsd"/>
			<xsl:text>"</xsl:text>
			<xsl:text>;</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="$schemalist"/>
			<xsl:text>"</xsl:text>
			<xsl:text>;</xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="$name"/>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="$crlf"/>
		</xsl:variable>
		<xsl:sequence select="$value"/>
	</xsl:function>

	<xsl:template name="testMemberTypes">
		<xsl:text>"memberTypes"</xsl:text><xsl:value-of select="$crlf" />

		<xsl:for-each select="$memberTypes/type">
<!-- 			<xsl:value-of select="concat(parentname,'::',name, $crlf)"/> -->
			<xsl:value-of select="concat(parentname,'::',name,'{',ktx:husstSchemalist(name),'}', $crlf)"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="testAssignedSchema">
		<xsl:text>"testAssignedSchema"</xsl:text><xsl:value-of select="$crlf" />

		<xsl:for-each select="$assignedSchema/type">
			<xsl:value-of select="concat('name:', name, 'schemalist:', schemalist, $crlf)"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="testSchemaParenttypes">
		<xsl:text>"schemaParenttypes"</xsl:text><xsl:value-of select="$crlf" />

		<xsl:for-each select="$schemaParenttypes/type">
			<xsl:value-of select="concat('@', $assignedSchema/type[name=current()/name]/schemalist , ' ', '[', ktx:husstMainSchemaFromSchemalist(ktx:husstSchemalist(name)) ,']',schema,'::',name,'{',ktx:husstSchemalist(name),'}', $crlf)"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="xs:complexType[@name='OePVTarifDB_Type']">
		<!-- 
		Ziel:
		"Xsd-Schema";"Husst-Schemataliste";"Datentyp" 
		-->
		
<!-- 		<xsl:call-template name="testAssignedSchema" />	 -->
<!-- 		<xsl:call-template name="testMemberTypes" />	 -->
<!-- 		<xsl:call-template name="testSchemaParenttypes" />	 -->
	
		<xsl:text>"Xsd-Schema";"Husst-Schemataliste";"Datentyp"</xsl:text><xsl:value-of select="$crlf"/>
		
		<xsl:for-each select="/xs:schema/(xs:complexType|xs:simpleType)">
			<xsl:value-of select="ktx:husstSchemaLine(ktx:husstXsd(@name), ktx:husstSchemalistCompact(@name), @name)" />
		</xsl:for-each>
	</xsl:template>
	
	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="@*|node()" mode="copy">
		<xsl:copy>
			<xsl:apply-templates select="@*" mode="copy"/>
			<xsl:apply-templates  mode="copy"/>
		</xsl:copy>	
	</xsl:template>	
</xsl:stylesheet>