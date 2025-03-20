<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:husstDV="http://husst.de/Versorgungsdaten/3_7_0"
    xmlns:api="http://www.husst.de/Appinfo/3_7_0"
>
	<xsl:output method="text" encoding="UTF-8" />
	
	<xsl:param name="einstiegsebene" as="xs:integer">0</xsl:param>

	 <!-- Dateiname der aktuellen Inputdatei -->
	 <xsl:variable name="documentName" select="tokenize(document-uri(/), '/')[last()]" />
	 
	 <!-- das Schema -->
	 <xsl:param name="schema" select="substring-before(substring-after($documentName, 'HUSST_Dv'), '_3')"/>

	 <!-- die HusstVersion -->
	 <xsl:param name="verHusst" />
	 
	 
	 <!-- die Basisdefinition -->
	 <xsl:variable name="h3Base">
	   <!-- .. wenn wir nicht selbst schon die Basisdefinition sind -->
	   <xsl:if test="$documentName != 'HUSST_DvBasis_3_7_0.xsd'">
	     <xsl:value-of select="document('../xml/HUSST_DvBasis_3_7_0.xsd')"/>
	   </xsl:if>
	 </xsl:variable> 
	
  
	<!-- ===================================================================== 
	die gesamte Xsd 
	=====================================================================  -->
	<xsl:template match="xs:schema">
		<xsl:value-of select="api:header(0, concat($schema,' Elemente ', $documentName ))" />
		<xsl:apply-templates select="xs:element">
		    <xsl:sort select="@name" />
		</xsl:apply-templates>

		<xsl:value-of select="api:header(0, concat($schema,' Enumerationen ', $documentName ))" />
		<xsl:apply-templates select="xs:simpleType[xs:*/xs:enumeration]">
<!-- 		<xsl:apply-templates select="xs:simpleType[xs:*/xs:enumeration or (xs:restriction and substring-before(../xs:simpleType/xs:union/@memberTypes, @name)>'')]"> -->
		    <xsl:sort select="@name" />
		</xsl:apply-templates>

		<!-- der Kopfkommentar -->
		<xsl:value-of select="api:header(0, concat($schema,' Definitionsstand'))"/>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:value-of select="api:docu(xs:annotation/xs:documentation)"/>
	</xsl:template>

	<!-- ===================================================================== 
    alle Datentypen, die in einem Datenversorgungsmodul husstPersonal_Type 
    oder OePVTarifDB_Type vorkommen dürfen
	=====================================================================  -->
	<xsl:template match="xs:element[api:strip-ns(@type)=../xs:complexType/@name]">
		<xsl:value-of select="api:setAnchor( api:strip-ns( @type ) )"/>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:value-of select="api:header(1, @name)" />

		<xsl:apply-templates select="../xs:complexType[@name=api:strip-ns(current()/@type)]"/>
	</xsl:template>
	<xsl:template match="xs:complexType[parent::xs:schema]">
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:value-of select="api:docu(xs:annotation/xs:documentation)"/>
		
		<!-- [options="header"] -->
		<!-- |======================= -->
		<!-- |Eigenschaft|Beschreibung -->
		<!-- |Bearbeitungdsatum  | -->
		<!-- |Lieferant| das ist der Lieferant der Daten -->
		<!-- |=======================		 -->
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>[options="header" cols="2%,20%,78%"]</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>|=======================</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>| |Eigenschaft|Beschreibung</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>


		<xsl:apply-templates select="xs:*/xs:element" />
		<xsl:text>|=======================</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>[small]#&#160;&#160;★&#160;&#160;Pflichtelemente#</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="xs:element" >
		<xsl:value-of select="concat('|', if (@minOccurs > 0) then '★&#160;|' else ' |', @name, '|' )" />
		<xsl:text>&#13;&#10;</xsl:text>
		
		<xsl:value-of select="api:docu(xs:annotation/xs:documentation, not(@name='Deaktiviert' or @name='ID_Zeitraum'))"/> 
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:if test="ancestor::xs:schema/xs:*[@name=api:strip-ns(current()/@type)]">
			<xsl:if test="ancestor::xs:schema/xs:*[@name=api:strip-ns(current()/@type)]/(xs:union|xs:*/xs:enumeration)">
				<xsl:value-of select="concat('siehe auch: ', api:linkAnchor( api:strip-ns( @type ) ) )"/>
				<xsl:text>&#13;&#10;</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	
	<xsl:template match="xs:simpleType[parent::xs:schema and (xs:*/xs:enumeration or xs:restriction)]">
		<xsl:value-of select="api:setAnchor( api:strip-ns( @name ) )"/>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:value-of select="api:setAnchor( ../xs:simpleType[substring-before(xs:union/@memberTypes, current()/@name)>'']/@name)"/>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:value-of select="api:header(1, api:captionText(@name))" />
		<xsl:value-of select="api:docu(xs:annotation/xs:documentation|../xs:simpleType[substring-before(xs:union/@memberTypes, current()/@name)>'']/xs:annotation/xs:documentation)"/> 
	
		<!-- [options="header"] -->
		<!-- |======================= -->
		<!-- |Eigenschaft|Beschreibung -->
		<!-- |Bearbeitungdsatum  | -->
		<!-- |Lieferant| das ist der Lieferant der Daten -->
		<!-- |=======================		 -->
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>[options="header" cols="20%,80%"]</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>|=======================</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
		<xsl:text>|Wert|Beschreibung</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>


		<xsl:apply-templates select="xs:*/xs:enumeration" />
		<xsl:text>|=======================</xsl:text>
		<xsl:text>&#13;&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="xs:enumeration" >
		<xsl:value-of select="concat('|', @value, '|' )" />
		<xsl:text>&#13;&#10;</xsl:text>
		
		<xsl:value-of select="api:docu(xs:annotation/xs:documentation)"/> 
		<xsl:text>&#13;&#10;</xsl:text>
	</xsl:template>
	
    <!-- liefert "text" als Überschrift um "einstiegsebene" + "ebene" eingerückt
    	"ebene" Zählung beginnt im Sub-Dokument mit 0    	 
    -->
	<xsl:function name="api:header">
		<xsl:param name="ebene" as="xs:integer"/>
		<xsl:param name="text"/>
		<xsl:sequence select="string-join(for $i in 1 to xs:integer($ebene + $einstiegsebene) return '=', '')"/>
		<xsl:value-of select="$text"/>			
		<xsl:text>&#13;&#10;</xsl:text> 		
	</xsl:function>
	
	<xsl:function name="api:setAnchor" as="xs:string">
	  <xsl:param name="name"/>
	  <xsl:sequence select="if ($name) then concat('[[', $name ,']]') else ''"/>
	</xsl:function>	

	<xsl:function name="api:linkAnchor" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="concat('&lt;&lt;', $name, ',', api:captionText($name), '>>')"/>
	</xsl:function>	

	<xsl:function name="api:strip_Type" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="if (substring-before($name, '_Type')='') then $name else substring-before($name, '_Type')"/>
	</xsl:function>	

	<xsl:function name="api:stripHUSST" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="if (substring-before($name, 'HUSST')='') then $name else substring-before($name, 'HUSST')"/>
	</xsl:function>	

	<xsl:function name="api:captionText" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="api:stripHUSST(api:strip_Type($name))"/>
	</xsl:function>	

	<xsl:function name="api:isEmpty" as="xs:boolean*">
		<xsl:param name="lines" as="xs:string*"/>
		
		<xsl:sequence select="not(some $line in $lines satisfies normalize-space($line) ne '')"/>
	</xsl:function>

	<xsl:function name="api:docu" as="xs:string*">
		<xsl:param name="lines" as="xs:string*"/>
		<xsl:sequence  select="api:docu($lines, 1=1)"/>
	</xsl:function>
	<xsl:function name="api:docu" as="xs:string*">
		<xsl:param name="lines" as="xs:string*"/>
		<xsl:param name="warning" as="xs:boolean"/>
		<xsl:sequence select="if (api:isEmpty($lines)) then if ($warning) then 'IMPORTANT: [red]#_Hier wird noch ein Dokumentierer gesucht!_#&#13;&#10;' else '' 
		else		
		string-join(
		  for $line in $lines 
		  return 
		    string-join(
		      for $l in tokenize($line, '\n') 
		      return api:doculine(normalize-space($l)), 
		      '&#13;&#10;'
		    ), 
		  '&#13;&#10;'
		)"/>
	</xsl:function>	

	<xsl:function name="api:doculine" as="xs:string">
	  <xsl:param name="line" as="xs:string"/>
	  <xsl:sequence><xsl:value-of select="if (not($line) or $line='') then '' else concat(concat('[small]#', if (substring($line,1,2)='- ') then concat('* ', substring($line,3)) else $line), '# +')"/></xsl:sequence>
  	</xsl:function>
	

	<xsl:function name="api:ltrim" as="xs:string">
	  <xsl:param name="line" as="xs:string"/>
	  <xsl:sequence select="replace($line, '^\s+', '')"/>
	</xsl:function>    
	
    <!-- liefert "text" als Überschrift um "einstiegsebene" + "ebene" eingerückt
    	"ebene" Zählung beginnt im Sub-Dokument mit 0    	 
    -->
    <xsl:function name="api:strip-ns" as="xs:string*">
	  <xsl:param name="names" as="xs:string*"/>
	  <xsl:sequence select="for $name in $names return  if (contains($name, ':')) then substring-after($name, ':') else $name"/>
	</xsl:function>	

	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>	
</xsl:stylesheet>