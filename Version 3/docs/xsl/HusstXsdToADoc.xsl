<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:husstDV="http://husst.de/Versorgungsdaten/3_7_0"
    xmlns:api="http://husst.de/Appinfo/3_7_0"
>
	<xsl:output method="text" encoding="UTF-8" />

	<!-- 	wandelt eine HUSST-Dv-Schemadefinition in eine Ascii-Doc Dokumentation
	
	        so wie es aussieht, lassen sich auch die Ergebnisdaten damit abbilden,
	        der Dateiname wird sich also noch mal ändern...
	-->

	<!-- ======================================================================
		 Parameter und globale Variablen 
	= =  ================================================================== = = -->
	<!-- die Menü-Ebene, ab der die Überschriften aus der Xsd beginnen
		 wird von außen vorgegeben (z.Zt. 3)
	 -->
	<xsl:param name="einstiegsebene" as="xs:integer">0</xsl:param>
	<xsl:param name="defaults"/>
	<!-- Loglevel - High to Low 
	    ERROR
      , WARNING
      , INFO      - - Default
      , HINT
      , DEBUG 
    -->
	<xsl:param name="loglevel" as="xs:string">INFO</xsl:param>

	<!-- ======================================================================
		 globale Variablen 
	= =  ================================================================== = = -->
	<!-- die HusstVersion mit unterstrichen -->
	<xsl:variable name="small"/>
  
	<!-- die HusstVersion -->
	<xsl:variable name="nsHusst" select="if (namespace-uri-for-prefix('husstDV', /*) > '') then 'husstDV' else 'husst'" />
	<xsl:variable name="prefixAnchor" select="if (namespace-uri-for-prefix('husstDV', /*) > '') then '' else 'Erg_'" />
	<xsl:variable name="uriHusst">
	  <xsl:value-of select="namespace-uri-for-prefix($nsHusst, /*)"/>	
	</xsl:variable>
	<xsl:variable name="version">
	  <xsl:value-of select="api:verFromUriHusst($uriHusst)"/>	
	</xsl:variable>
	<xsl:variable name="verHusst" select="replace($version, '_', '.')"/>
	<xsl:variable name="verHusst_" select="$version"/>

	<!-- hilfreiche Konstanten -->
	<xsl:variable name="crlf" select="'&#13;&#10;'"/>
	
	<!-- Pfad zu den Vorlagedateien -->
	<xsl:variable name="pathTemplates" >
		<xsl:variable name="translated" select="translate($defaults, '\', '/')"/>
		<xsl:sequence select="concat('file:///', iri-to-uri( concat($translated, if (ends-with($translated, '/')) then '' else '/') ))" />
	</xsl:variable>
	
	<!-- Dateiname der aktuellen Inputdatei -->
	<xsl:variable name="documentName" select="concat('HUSST_Dv', $schema,'_', $verHusst_, '.xsd')" />
	 
	<!-- alle Schemata zu einem Dokument zusammengefasst -->
	<xsl:variable name="husstVerDir" select="concat('../../', $verHusst, '/')" />
	
	<xsl:variable name="schemata" select="
	  if ($nsHusst='husstDV') then
		 document(concat($husstVerDir, 'HUSST_DvBasis_',        $verHusst_ , '.xsd'))
		|document(if (not(//xs:schema/xs:annotation/xs:appinfo/api:schema[@name='test'])) 
		 then concat($husstVerDir, 'HUSST_DvTarifAngebot_', $verHusst_ , '.xsd') 
         else concat('HUSST_Dok-Testfaelle',          '.xsd'))
		|document(concat($husstVerDir, 'HUSST_DvVertrieb_',     $verHusst_ , '.xsd'))
	  else
	    document(concat($husstVerDir, 'HUSST_Ergebnisdaten_',  $verHusst_ , '.xsd'))
	"/>
		 
	<!-- das Schema -->
	<xsl:variable name="schema" select="if ($nsHusst='husstDV') then string-join(/xs:schema/xs:annotation/xs:appinfo/api:schema/@name) else 'Ergebnis'" />

	<!-- das/die Rootelement(e) -->
	<xsl:variable name="root"         select=" /xs:schema/xs:element[not(@name=$schemata//xs:*/substring-after(@ref,':'))]"/>

	<!-- die Elemente -->
	<xsl:variable name="elemDomain"   select="if ($nsHusst='husstDV') 
	  then /xs:schema/xs:element[not(@name=$root/@name)]
	  else /xs:schema/xs:complexType[not(@name=$root/api:strip-ns(@type))]" />
	
	<!-- die einfachen Datentypen -->
	<!-- fachliche datentypen (mit api:schema Zuordnung)  -->
	<xsl:variable name="enumDomain"   select="/xs:schema/xs:simpleType[    xs:annotation/xs:appinfo/api:schema/@name  and     xs:*/xs:enumeration]"/>
	<xsl:variable name="simpleDomain" select="/xs:schema/xs:simpleType[    xs:annotation/xs:appinfo/api:schema/@name  and not(xs:*/xs:enumeration) and not(xs:union)]"/>
	<!-- technische datentypen  (ohne api:schema Zuordnung)-->
	<xsl:variable name="enumTech"     select="/xs:schema/xs:simpleType[not(xs:annotation/xs:appinfo/api:schema/@name) and     xs:*/xs:enumeration]"/>
	<xsl:variable name="simpleTech"   select="/xs:schema/xs:simpleType[not(xs:annotation/xs:appinfo/api:schema/@name) and not(xs:*/xs:enumeration) and not(xs:union)]"/>

	<!-- Husst-Typen, die eigene Doku brauchen (weil der Typ fachlich nicht aussagefähig ist, z.B. INT4) -->
	<xsl:variable name="needsDocu" select="$schemata/xs:schema/xs:*[@name and xs:annotation/xs:appinfo/api:needsDocu]"/>

	<!-- mit ' a|' als Spaltentrenner funktioniert IMPORTANT: auch innerhalb der Tabelle -->
    <xsl:variable name="missingDocuTable">[red]#_todo: Doku_#</xsl:variable>
<!--     <xsl:variable name="missingDocuTable">IMPORTANT: _todo: Doku_</xsl:variable> -->
    <xsl:variable name="missingDocu"     >IMPORTANT: _todo: Doku_</xsl:variable>
  
	<xsl:variable name="datentypCellA" select="concat($crlf, ' a|')" />
	<xsl:variable name="datentypCellBlank" select="concat($crlf, '|')" />
	<xsl:variable name="datentypCell" select="$datentypCellA" />
	<xsl:variable name="datentypTextT" select="'&lt;T&gt;: '"/>
	<xsl:variable name="datentypTextDTyp" select="'Datentyp: '"/>
	
	<xsl:variable name="datentypImageInline" select="'image:type.svg[&lt;T&gt;,35,35,opts=inline] '"/>
	<xsl:variable name="datentypImageInlineNunito" select="'image:type-nunito.svg[&lt;T&gt;,45,35,opts=inline] '"/>
	<xsl:variable name="datentypImageInclude" select="'include::images/type.svg[] '"/>
	<xsl:variable name="datentypImage" select="$datentypImageInclude"/>
	<xsl:variable name="datentypImgIntro" select="' '"/>
	<xsl:variable name="datentyp" select="concat('',$datentypImageInlineNunito, $crlf)"/>
	<xsl:variable name="datentypIntro">
<![CDATA[+++<div class="exampleblock datatype">+++]]>
</xsl:variable>
	<xsl:variable name="datentypOutro">
<![CDATA[+++</div>+++]]></xsl:variable>

  
	<xsl:variable name="verwendetTextVerwendetIn" select="'Verwendet in: '"/>
	<xsl:variable name="verwendetTextVerwendetAls" select="'Verwendet als: '"/>
	<xsl:variable name="verwendetIn" select="$verwendetTextVerwendetIn"/>
	<xsl:variable name="verwendetAls" select="$verwendetTextVerwendetAls"/>

  
	<!-- ======================================================================
		 die gesamte Xsd 
	= =  ================================================================== = = -->
	
	<xsl:template match="xs:schema">
<!-- 	<xsl:template match="xs:schema[$nsHusst='husstDV' or $nsHusst='husst']"> -->

		<!-- Root Element(e) -->
		<xsl:if test="count($root)>0">
       		<xsl:value-of select="$crlf"/>
	        <xsl:value-of select="$crlf"/>
			<xsl:value-of select="api:header(0, concat($schema, if (count($root) > 1) then ' Rootelemente' else ' Rootelement' ))" />
	        <xsl:value-of select="$crlf"/>
       		<xsl:for-each select="$root">
				<xsl:apply-templates select="self::xs:*"/>
       		</xsl:for-each>
	        <xsl:value-of select="$crlf"/>       
       	</xsl:if>
				
       	<xsl:value-of select="$crlf"/>       
		<xsl:value-of select="api:header(0, concat($schema,' Elemente' ))" />
        <xsl:value-of select="$crlf"/>       
        <xsl:value-of select="$crlf"/>       
	        

		<!-- fachliche Elemente -->
		<xsl:apply-templates select="$elemDomain">
		    <xsl:sort select="@name" />
		</xsl:apply-templates>

		<!-- fachliche Enumerationen -->
		<xsl:if test="count($enumDomain) > 0">
			<xsl:value-of select="api:header(0, concat($schema,' Enumerationen ' ))" />
	        <xsl:value-of select="$crlf"/>       
	        <xsl:value-of select="$crlf"/>       
			<xsl:for-each select="$enumDomain">
				<xsl:sort select="@name"/>
				<xsl:apply-templates select="self::xs:*"/>
		        <xsl:value-of select="$crlf"/>       
			</xsl:for-each>
	        <xsl:value-of select="$crlf"/>
        </xsl:if>
               
		<!-- fachliche Datentypen -->
		<xsl:if test="count($simpleDomain) > 0">
			<xsl:value-of select="api:header(0, concat($schema,' Datentypen ' ))" />
	        <xsl:value-of select="$crlf"/>       
	        <xsl:value-of select="$crlf"/>       
			<xsl:for-each select="$simpleDomain|xs:complexType[@name='DynAttribut_Subtype']">			
				<xsl:sort select="@name"/>
				<xsl:apply-templates select="self::xs:*"/>
		        <xsl:value-of select="$crlf"/>       
			</xsl:for-each>
	        <xsl:value-of select="$crlf"/>
        </xsl:if>
               
		<!-- technische Enumerationen -->
		<xsl:if test="count($enumTech) > 0">
			<xsl:value-of select="api:header(0, concat('', 'technische Enumerationen ' ))" />
	        <xsl:value-of select="$crlf"/>       
	        <xsl:value-of select="$crlf"/>       
			<xsl:for-each select="$enumTech">
				<xsl:sort select="@name"/>
				<xsl:apply-templates select="self::xs:*"/>
		        <xsl:value-of select="$crlf"/>       
			</xsl:for-each>
	        <xsl:value-of select="$crlf"/>
        </xsl:if>        
               
		<!-- fachliche Datentypen -->
		<xsl:if test="count($simpleTech) > 0">
			<xsl:value-of select="api:header(0, concat('', 'technische Datentypen ' ))" />
	        <xsl:value-of select="$crlf"/>       
	        <xsl:value-of select="$crlf"/>       
			<xsl:for-each select="$simpleTech">
				<xsl:sort select="@name"/>
				<xsl:apply-templates select="self::xs:*"/>
		        <xsl:value-of select="$crlf"/>       
			</xsl:for-each>
	        <xsl:value-of select="$crlf"/>
        </xsl:if>
               
               
		<!-- der Kopfkommentar -->
		<xsl:value-of select="api:header(0, concat($schema,' Definitionsstand'))"/>
		<xsl:value-of select="$crlf"/>
		<xsl:call-template name="api:docu"/>
	</xsl:template>


	<!-- ======================================================================
         alle Datentypen, die in einem Datenversorgungsmodul husstPersonal_Type 
         oder OePVTarifDB_Type vorkommen dürfen
	= =  ================================================================== = = -->
	<xsl:template match="xs:element[api:strip-ns(@type)=../xs:complexType/@name]">
<xsl:if test="contains(api:strip-ns(@type), 'Typehusst')">
	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR:','@type=', api:strip-ns(@type)))"/>
</xsl:if>
		<xsl:value-of select="api:setAnchor( api:strip-ns( @type ) )"/>
<!-- 		<xsl:value-of select="concat($crlf,'- - 1', $crlf)"/> -->
		<xsl:value-of select="$crlf"/>		
		<xsl:value-of select="api:header(1, @name)" />

		<xsl:apply-templates select="../xs:complexType[@name=api:strip-ns(current()/@type)]"/>
	</xsl:template>
	
	<xsl:template match="xs:complexType[parent::xs:schema]">
		<xsl:if test="not(@name=../xs:element/api:strip-ns(@type)) or @name='DynAttribut_Subtype'">
<xsl:sequence select="api:log('HINT', concat('SUBTYPE:xs:complextType/@name=', @name))"/>
<xsl:if test="contains(api:strip-ns(@name), 'Typehusst')">
	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR:','@name=', api:strip-ns(@name)))"/>
</xsl:if>		
			<xsl:value-of select="api:setAnchor( @name )"/>
<!-- 			<xsl:value-of select="concat($crlf,'- - 2', $crlf)"/> -->
			<xsl:value-of select="$crlf"/>		
			<xsl:value-of select="api:header(1, api:strip-type(@name))" />
		</xsl:if>
		<xsl:value-of select="$crlf"/>
		<xsl:call-template name="api:docu"/>
		
		<!-- [options="header,autonumber!"] -->
		<!-- |======================= -->
		<!-- |Eigenschaft|Beschreibung -->
		<!-- a|Bearbeitungdsatum  a| -->
		<!-- a|Lieferant a| das ist der Lieferant der Daten -->
		<!-- |=======================		 -->
		<xsl:value-of select="$crlf"/>
		<xsl:text>[options="header,autonumber!" cols="2%,20%,78%"]</xsl:text>
		<xsl:value-of select="$crlf"/>
		<xsl:text>|=======================</xsl:text>
		<xsl:value-of select="$crlf"/>
		<xsl:text>| |Eigenschaft|Beschreibung</xsl:text>
		<xsl:value-of select="$crlf"/>

		<!-- Elemente der Struktur dokumentieren -->
		<xsl:apply-templates select="xs:*/xs:element" mode="table"/>
		
		<xsl:text>|=======================</xsl:text>
		<xsl:value-of select="$crlf"/>
		<xsl:if test="count(xs:*/xs:element[@minOccurs > 0]) > 0">
			<xsl:text>&#160;&#160;★&#160;&#160;Pflichtelemente</xsl:text>
			<xsl:value-of select="$crlf"/>
			<xsl:value-of select="$crlf"/>
		</xsl:if>

        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="."/></xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xs:element" mode="table" >
		<xsl:variable name="type">
			<xsl:call-template name="type"/>
		</xsl:variable>

		<xsl:value-of select="concat(' a|', if (@minOccurs > 0) then '★&#160; a|' else ' a|', @name, api:strip-ns(@ref) )" />
		<xsl:value-of select="$crlf"/>

		<xsl:value-of select="$datentypCell"/>
		<!-- Doku ist für eigene Datentypen optional -->		
		<xsl:choose>
			<xsl:when test="contains($type, 'husst') ">
            	<xsl:call-template name="api:docu-table"/>
			</xsl:when>
			<xsl:otherwise>
            	<xsl:call-template name="api:docu-table"/>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:value-of select="$datentypIntro"/>
		<xsl:value-of select="$datentyp"/>
<!-- 		<xsl:text>Datentyp: </xsl:text> -->
<!-- <xsl:text> -->
<!-- #Datentyp:# -->
<!-- </xsl:text> -->
<!-- <xsl:value-of select="concat('$type=', $type, $crlf)"/>		 -->
<!-- <xsl:text> -->
<!-- #*****# -->
<!-- </xsl:text>		 -->

		<xsl:choose>
			<xsl:when test="contains($type, 'husst') ">
<!-- <xsl:if test="contains(api:strip-ns($type), 'Typehusst')"> -->
<!-- 	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR(1.0):','api:strip-ns(element/table/$type)=', api:strip-ns($type)))"/> -->
<!-- 	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR(1.1):','$type=', $type))"/> -->
<!-- </xsl:if> -->
				<xsl:value-of select="api:linkAnchor( $type )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="api:strip-ns( $type )"/>
			</xsl:otherwise>
		</xsl:choose>		 
		<xsl:value-of select="$datentypOutro"/>
		<xsl:value-of select="$crlf"/>
	</xsl:template>
	

	<!-- ======================================================================
	     Enumerationen und Bitfelder
	= =  ================================================================== = = -->
	<xsl:template match="xs:simpleType[@name=($simpleDomain|$enumDomain)/@name]">
<xsl:if test="contains(api:strip-ns(@name), 'Typehusst')">
	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR:','@name=', api:strip-ns(@name)))"/>
</xsl:if>		
		<xsl:value-of select="api:setAnchor( api:strip-ns( @name ) )"/>
<!-- 		<xsl:value-of select="concat($crlf,'- - 3', $crlf)"/> -->
		<xsl:value-of select="$crlf"/>		
		<xsl:value-of select="$crlf"/>
		<xsl:if test="(count(../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name) = 1) and contains(@name, 'HUSST')">
<xsl:if test="contains(api:strip-ns(../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name), 'Typehusst')">
	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR:','../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name=', api:strip-ns(../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name)))"/>
</xsl:if>		
			<xsl:value-of select="api:setAnchor( ../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name)"/>
<!-- 			<xsl:value-of select="concat($crlf,'- - 4', $crlf)"/> -->
			<xsl:value-of select="$crlf"/>		
		</xsl:if>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="api:header(1, api:captionText(@name))" />
<!-- <xsl:text>DEBUG</xsl:text> -->
				
<xsl:sequence select="api:log('DEBUG', concat('xs:simpleType=', @name ))" />
		
		<xsl:choose>
			<xsl:when test="contains(@name, 'HUSST')">
				<xsl:variable name="docu">
					<!-- erstmal die Doku von dem Union-Type holen -->
					<xsl:for-each select="../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]">
<!-- <xsl:text>(1)</xsl:text> -->
						<xsl:call-template name="api:docu-no-warning" />
					</xsl:for-each>
					<xsl:value-of select="$crlf"/>
					<!-- jetzt die eigene Doku holen -->
<!-- <xsl:text>(2)</xsl:text> -->
					<xsl:call-template name="api:docu-no-warning" />
				</xsl:variable>
				<xsl:value-of select="if ($docu > '') then concat($docu, $crlf) else $missingDocu"/>				
			</xsl:when>
			<xsl:otherwise>
<!-- <xsl:text>(3)</xsl:text> -->
				<xsl:call-template name="api:docu"/>
			</xsl:otherwise>
		</xsl:choose> 
		<xsl:if test="not(count(xs:*/xs:enumeration)=0)" >
			<!-- [options="header,autonumber!"] -->
			<!-- |======================= -->
			<!-- |Eigenschaft|Beschreibung -->
			<!-- |Bearbeitungdsatum  | -->
			<!-- |Lieferant| das ist der Lieferant der Daten -->
			<!-- |=======================		 -->
			<xsl:value-of select="$crlf"/>
			<xsl:text>[options="header,autonumber!" cols="20%,80%"]</xsl:text>
			<xsl:value-of select="$crlf"/>
			<xsl:text>|=======================</xsl:text>
			<xsl:value-of select="$crlf"/>
			<xsl:text>|Wert|Beschreibung</xsl:text>
			<xsl:value-of select="$crlf"/>
	
			<!-- einzelne Werte der Enumeration dokumentieren  -->
			<xsl:apply-templates select="xs:*/xs:enumeration" mode="table" />
			
			<xsl:text>|=======================</xsl:text>
			<xsl:value-of select="$crlf"/>
		</xsl:if>

		<xsl:variable name="typeNames" select=".|ancestor::xs:schema/xs:simpleType[xs:union/contains(@memberTypes, current()/@name)]" />
        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="$typeNames"/></xsl:call-template>
	</xsl:template>
		
	<xsl:template match="xs:enumeration" mode="table" >
		<xsl:value-of select="concat(' a|', @value, ' a|' )" />
		<xsl:value-of select="$crlf"/>
		
		<xsl:call-template name="api:docu-table" />
		<xsl:value-of select="$crlf"/>
	</xsl:template>
	
	<xsl:template match="xs:simpleType|xs:complexType">
<xsl:if test="contains(api:strip-ns(@name), 'Typehusst')">
	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR:','@name=', api:strip-ns(@name)))"/>
</xsl:if>		
		<xsl:value-of select="api:setAnchor( api:strip-ns( api:stripHUSST( @name ) ) )"/>
<!-- 		<xsl:value-of select="concat($crlf,'- - 5', $crlf)"/> -->
		<xsl:value-of select="$crlf"/>		
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="api:header(1, api:captionText(@name))" />
		<xsl:call-template name="api:docu"/>


        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="."/></xsl:call-template>
	</xsl:template>
	
	<xsl:template name="references">
		<xsl:param name="typeNames"/>
		
<!--<xsl:if test="@name='OePVTarifDB_Type'"> -->
<!--  <xsl:sequence select="api:log('DEBUG', concat('$typeNames=', string-join( $typeNames/@name, ',' )))"/> -->
<!--</xsl:if> -->

        <xsl:variable name="references" select="
	          $schemata//xs:element[api:strip-ns(@type) = $typeNames/@name]/ancestor::xs:complexType 
	         |$schemata//xs:complexType[xs:*/xs:element/api:strip-ns(@ref)=$schemata//xs:element[api:strip-ns(@type)=$typeNames/@name]/@name]
        "/>

<xsl:if test="@name='OePVTarifDB_Type'">
	<xsl:variable name="debugElements">
		<xsl:for-each select="$schemata//xs:element[@type]">
			<xsl:value-of select="concat(api:strip-ns(@type),',')"/>
		</xsl:for-each>
	</xsl:variable>
	
<xsl:sequence select="api:log('DEBUG', concat('$root(', count($root), ')=', string-join( $root/api:strip-ns(@type), ',' ))) "/>
<xsl:sequence select="api:log('DEBUG', concat('$references(', count($references), ')=', string-join( $references/@name, ',' ))) "/>
<xsl:sequence select="api:log('DEBUG', concat('$schemata//xs:element[@type]=', $debugElements)) "/>
<xsl:sequence select="api:log('DEBUG', concat('element::', $schemata//xs:element[api:strip-ns(@type) = $typeNames/@name]/@name )) "/>
<xsl:sequence select="api:log('DEBUG', concat('element-Owner::', $schemata//xs:element[api:strip-ns(@type) = $typeNames/@name]/ancestor::xs:complexType/@name )) "/>
</xsl:if>


		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
		<xsl:choose>
			<xsl:when test="(count($references) = 0 and $root/api:strip-ns(@type)=$typeNames/@name)">
				<xsl:value-of select="$verwendetAls"/>
				<xsl:text>Rootelement</xsl:text>
			</xsl:when>
			<xsl:when test="(count($references) = 0)">
<!-- 				<xsl:text>ohne Verwendung</xsl:text> -->
			</xsl:when>
			<xsl:when test="(count($references) > 30)">
				<xsl:value-of select="$verwendetIn"/>
				<xsl:value-of select="concat(count($references), ' Elementen ')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$verwendetIn"/>
				<xsl:value-of select="$crlf"/>
	           	<xsl:for-each select="$references[@name]">
	           		<xsl:sort select="@name"/>
           			<xsl:value-of select="if (position()=1) then '' else ', ' "/>
<xsl:if test="contains(api:strip-ns(@name), 'Typehusst')">
	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR:','simpleType/@name=', api:strip-ns(@name)))"/>
</xsl:if>
					<xsl:value-of select="api:linkAnchor(@name)"/>
	           	</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
	</xsl:template>
	
	<xsl:template name="type">
		<xsl:sequence>
			<xsl:value-of select="
			       if (@type)                                                              then @type 
			  else if (/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type)          then /xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type
			  else if ($schemata/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type) then $schemata/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type
			  else ''
			"/>
			
<!-- 			<xsl:value-of select="@type"/> -->
<!-- 			<xsl:value-of select="/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type"/> -->
<!-- 			<xsl:value-of select="$schemata/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type"/> -->
		</xsl:sequence>
	</xsl:template>

	<!-- ======================================================================
	     function api:header( ebene : xs:integer; text (: xs:integer) ) (: xs:string)
	     ======================================================================
         liefert "text" als Überschrift um "einstiegsebene" + "ebene" eingerückt
    	 "ebene" Zählung beginnt im Sub-Dokument mit 0
	= =  ================================================================== = = -->
	<xsl:function name="api:header">
		<xsl:param name="ebene" as="xs:integer"/>
		<xsl:param name="text"/>
		<xsl:sequence select="string-join(for $i in 1 to xs:integer($ebene + $einstiegsebene) return '=', '')"/>
		<xsl:value-of select="concat($prefixAnchor,$text)"/>			
		<xsl:value-of select="$crlf"/> 		
	</xsl:function>
	
	<!-- ======================================================================
	     function api:setAnchor( name : xs:string ) : xs:string
	     ======================================================================
         Setzt einen Ascii-Doc [[Anker]] zu dem von anderer Stelle aus hin
         verlinkt werden kann, wenn der text nicht leer ist.
	= =  ================================================================== = = -->
	<xsl:function name="api:setAnchor" as="xs:string">
		<xsl:param name="name"/>
		<xsl:sequence select="if ($name) then concat('[[', $prefixAnchor, $name ,']]') else ''"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:linkAnchor( name : xs:string ) : xs:string
	     ======================================================================
         Verlinkt zu einem zuvor gesetzten Ascii-Doc <<Anker>>.
	= =  ================================================================== = = -->
	<xsl:function name="api:linkAnchor" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>

<!-- <xsl:if test="contains(api:strip-ns($name), 'Typehusst')"> -->
<!-- 	<xsl:sequence select="api:log('DEBUG',concat('ANCHOR(0):','$name=', api:strip-ns($name)))"/> -->
<!-- </xsl:if> -->

	  <xsl:sequence select="concat('&lt;&lt;', $prefixAnchor, api:strip-ns($name), ',', $prefixAnchor, api:captionText($name), '>>')"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:strip-type( name : xs:string ) : xs:string
	     ======================================================================
         Entfernt eine mögliche "_Type" Endung von einem Namen:
           ID_Sortentyp_Type            - - > ID_Sortentyp 
           und ID_SortentypHUSST_Type   - - > ID_SortentypHUSST           
	= =  ================================================================== = = -->
	<xsl:function name="api:strip-type" as="xs:string">
		<xsl:param name="mithusst" as="xs:string"/>
		<xsl:variable name="name" select="api:stripHUSST($mithusst)"/>
		<xsl:sequence select="if (substring-before($name, '_Type')='') 
		  then if (substring-before($name, '_Subtype')='')
		    then $name
		    else substring-before($name, '_Subtype')
		  else substring-before($name, '_Type')"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:stripHUSST( name : xs:string ) : xs:string
	     ======================================================================
         Entfernt eine mögliche HUSST Erweiterung von einem String:
         VorgangsTypHUSST_Type wird zu:  VorgangsTyp_Type 
	= =  ================================================================== = = -->
	<xsl:function name="api:stripHUSST" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="if (substring-before($name, 'HUSST')='') then $name else concat(substring-before($name, 'HUSST'),substring-after($name, 'HUSST'))"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:captionText( name : xs:string ) : xs:string
	     ======================================================================
         Entfernt alle möglichen Typ artigen Endungen um einen Namen für 
         die Darstellung zu bereinigen. 
	= =  ================================================================== = = -->
	<xsl:function name="api:captionText" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="api:strip-ns(api:stripHUSST(api:strip-type($name)))"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:isEmpty( lines : xs:string* ) : xs:boolean
	     ======================================================================
         Liefert True, wenn keine der lines Text enthält. 
	= =  ================================================================== = = -->
	<xsl:function name="api:isEmpty" as="xs:boolean*">
		<xsl:param name="lines" as="xs:string*"/>
		
		<xsl:sequence select="not(some $line in $lines satisfies normalize-space($line) ne '')"/>
	</xsl:function>


	<!-- ======================================================================
	     template api:docu( warning : xs:integer* ) : xs:string
	     ======================================================================
         Liefert einen Text als Fließtext einer Doku. 
         Wenn der Text leeer ist, wird eine Warnung ausgegeben, dass hier noch
         ein Dokumentierer gesucht würde.
	= =  ================================================================== = = -->
	<xsl:template name="api:docu-default-element" >
		<xsl:param name="element" select="." as="element(xs:element)"/>
	
<!-- <xsl:text> -->
<!-- #_docu-default-element_# -->
<!-- </xsl:text> -->
	
	    <!-- versuche externe Datei zu laden -->
	    <xsl:if test="$element/@name">
			<xsl:variable name="filename" select="concat($pathTemplates,'Element_', $element/@name, '.adoc')" />
			<xsl:variable name="externalText" select="if (unparsed-text-available($filename)) then unparsed-text($filename, 'UTF-8') else ''" />
<xsl:sequence select="api:log('DEBUG', concat('lf-file:', string-join(string-to-codepoints(substring($externalText,1,20)),','), '::', $externalText))" />
			<xsl:value-of select="api:docuFormat($externalText)" />
<xsl:sequence select="api:log('DEBUG', concat('lf-file:', string-join(string-to-codepoints(substring($externalText,1,20)),','), '::', $externalText))" />

<xsl:if test="not(unparsed-text-available($filename))">
	<xsl:sequence select="api:log('HINT', concat('not found:', $filename ))"/>
</xsl:if>

<!-- <xsl:text> -->
<!-- #_docu_filename_# -->
<!-- </xsl:text> -->
<!-- <xsl:value-of select="concat($filename, $crlf)" /> -->
<!-- <xsl:if test="unparsed-text-available($filename)"> -->
<!-- <xsl:text> -->
<!-- #_TREFFER_# -->
<!-- </xsl:text> -->
<!-- </xsl:if> -->
      	</xsl:if>
	</xsl:template>
	
	<xsl:template name="api:docu-no-warning">
		<xsl:call-template name="api:docu"><xsl:with-param name="warning" select="''"/></xsl:call-template>
	</xsl:template>

	<xsl:template name="api:docu-table">
		<xsl:variable name="type">
			<xsl:call-template name="type"/>
		</xsl:variable>
		<xsl:variable name="typeObj" select="$schemata/xs:schema/xs:*[@name=$type]" />
		<xsl:variable name="needsNoDocu" select="contains($type,'husst') and not($needsDocu[@name=substring-after($type,':')])" />

<!-- <xsl:text> -->
<!-- #_docu-table_# -->
<!-- </xsl:text> -->
<!-- <xsl:value-of select="concat('needsNoDocu=', $needsNoDocu, $crlf, $crlf)"/> -->

<!-- <xsl:value-of select="concat('typename=', substring-after($type,':'), $crlf, $crlf)"/> -->

<!-- <xsl:value-of select="$needsDocu[@name=substring-after($type,':')]/@name" separator=", "/> -->


<!-- <xsl:value-of select="concat('$needsDocu.count=', count($needsDocu), $crlf)"/> -->
<!-- <xsl:for-each select="$needsDocu"> -->
<!-- 	<xsl:value-of select="concat(name(.),'=', @name, $crlf)"/> -->
<!-- </xsl:for-each> -->


<!-- <xsl:text> -->
<!-- #===# -->

<!-- </xsl:text> -->
	

		<xsl:variable name="warning">
			<xsl:value-of select="if ( $needsNoDocu ) then '' else $missingDocuTable"/>
		</xsl:variable>
		<xsl:call-template name="api:docu"><xsl:with-param name="warning" select="$warning"/></xsl:call-template>
	</xsl:template>
	
	<xsl:template name="api:docu">
		<xsl:param name="warning" select="$missingDocu"/>

		<xsl:variable name="lines">
			<xsl:choose>
				<!-- wenn ohne Doku und selbst Element, dann std-Doku suchen -->
				<xsl:when test="self::xs:element and api:isEmpty(xs:annotation/xs:documentation)">
					<xsl:call-template name="api:docu-default-element"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="xs:annotation/xs:documentation"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
			
		<xsl:variable name="isEmpty" select="api:isEmpty($lines)"/>
		<xsl:variable name="maybeEmpty" select="xs:annotation/xs:appinfo/api:noDocu"/>
		
        <xsl:choose>
        	<xsl:when test="not($isEmpty)"><xsl:value-of select="api:docuFormat($lines)"/>
<xsl:sequence select="api:log('DEBUG', concat('line-starts:', string-join(string-to-codepoints(substring(string-join($lines), 1, 20))), string-join($lines)))"/>        	
        	</xsl:when>
        	<xsl:when test="$maybeEmpty"/>
        	<xsl:otherwise>                <xsl:value-of select="api:docuFormat($warning)"/></xsl:otherwise>
        </xsl:choose>
        
        <xsl:apply-templates select="xs:annotation/xs:appinfo/api:example" mode="docu" />
       	<xsl:apply-templates select="xs:annotation/xs:appinfo/api:fieldexample" mode="docu" />
	</xsl:template>

	<xsl:template match="api:example" mode="docu">
<xsl:sequence select="api:log('DEBUG', concat($crlf, '.Note', $crlf, '====', api:docuFormat(.), $crlf, '====', $crlf, $crlf))" />
		<xsl:value-of select="concat($crlf, $crlf, '====', api:docuFormat(.), $crlf, '====', $crlf, $crlf)" />
	</xsl:template>

	<xsl:template match="api:fieldexample" mode="docu">
<xsl:sequence select="api:log('DEBUG', concat($crlf, '.Note', $crlf, '====', api:docuFormat(.), $crlf, '====', $crlf, $crlf))" />
		<!-- ==== -->
		<!-- .Beispielwerte Husst-Complex  -->
		<!-- [options="header,autonumber!" cols="20%,20%,60%"] -->
		<!-- |======================= -->
		<!-- |Eigenschaft|Wert|Hinweise -->
		<!--  a| ID_Ortspunkttyp a| 1 a|  -->
		<!--  a| Bezeichnung a| Haltestelle a| An einer Haltestelle können Fahrgäste in ein ÖPNV-Fahrzeug (Bus, Zug, ..) einsteigen oder daraus aussteigen. a| -->
		<!-- |======================= -->
		<!-- ==== -->
		
		<xsl:value-of select="$crlf" />                               <xsl:value-of select="$crlf" />
		<xsl:text>====</xsl:text>                                      <xsl:value-of select="$crlf" />
		<xsl:text>.Beispielwerte </xsl:text><xsl:value-of select="api:captionText(ancestor::xs:*[@name]/@name)" /> <xsl:value-of select="$crlf" />
		<xsl:text>[options="header,autonumber!" cols="20%,20%,60%"]</xsl:text>    <xsl:value-of select="$crlf" />
		<xsl:text>|=======================</xsl:text>                 <xsl:value-of select="$crlf" />
		<xsl:text>|Eigenschaft|Wert|Hinweise</xsl:text>               <xsl:value-of select="$crlf" />

		<xsl:for-each select="api:field">
			<xsl:text>// Zeile</xsl:text>               <xsl:value-of select="$crlf" />
			<xsl:text>a| </xsl:text> <xsl:value-of select="@name" /> <xsl:value-of select="$crlf" />
			<xsl:text>a| </xsl:text> <xsl:value-of select="." /> <xsl:value-of select="$crlf" />
			<xsl:text>a| </xsl:text> <xsl:value-of select="api:docuFormat(following-sibling::text()[1])" /> <xsl:value-of select="$crlf" />
		</xsl:for-each>

		<xsl:text>|=======================</xsl:text>                 <xsl:value-of select="$crlf" />
		<xsl:value-of select="$crlf" />                               <xsl:value-of select="$crlf" />
		<xsl:text>====</xsl:text>                                     <xsl:value-of select="$crlf" />
		<xsl:value-of select="$crlf" />                               <xsl:value-of select="$crlf" />
	</xsl:template>


	<xsl:function name="api:docuFormat" as="xs:string">
	    <xsl:param name="lines" as="xs:string*"/>
	
	    <xsl:variable name="joined" select="string-join($lines, $crlf)"/>
<xsl:sequence select="api:log('DEBUG', concat('lf-1:', string-join(string-to-codepoints(substring($joined,1,20)),','), '::', $joined))" />
	    <xsl:variable name="formatted" select="
			replace(
				replace(
(:					replace(    :)
					replace(
					replace(
					replace(
			    		replace($joined
(:deaktiviert   		, '(^|\n+)[ \t]+', '$1')                    :) (: führende Leerzeichen entfernen :)
			    		, '^[\n \t]+', $crlf)                          (: führende Leerzeichen entfernen :)
			    		, '(\n)[\n \t]+', $crlf)                       (: führende mehrfach Zeilenumbrüche und leerzeichen auf einen Zeilenumbruch reduzieren :)
			    	, '(^|\n+)([a-z]\. )', concat($crlf,'{nbsp}$2'))   (: /Zeichen/./Blank/ mit einem geschützen Leerzeichen vor Mißinterpretation als Aufzählung bewahren :)
	    	, '(\r?\n+)([*-])', concat($crlf, $crlf, '*'))            (: Aufzählungen mit zusätzliche Umbruch versehen :)
	    	, '([^\n\n])\n\n([^\n*-])', concat($crlf, $crlf, '$2'))    (: Fließextumbrüche entfernen :)
	, '(^\d+\.)', concat(codepoints-to-string((160)), '$1'))    (: führende Nummern sind keine Aufzählung :)
	    	"			
		/>
<xsl:sequence select="api:log('DEBUG', concat('lf-2:', string-join(string-to-codepoints(substring($formatted,1,20)),','), '::', $formatted))" />
	
	    <!-- 3. Gibt das formatierte Ergebnis zurück -->
	    <xsl:sequence select="$formatted"/>
	</xsl:function>


	<!-- ======================================================================
	     function api:doculine( line : xs:string*) : xs:string
	     ======================================================================
         Liefert eine für die Dokumentation eingerichtete Zeile Text zurück.
	= =  ================================================================== = = -->
	<xsl:function name="api:doculine" as="xs:string">
	  <xsl:param name="line" as="xs:string"/>
	  <xsl:sequence><xsl:value-of select="if (not($line) or $line='') then '' else concat(concat('', if (substring($line,1,2)='- ') then concat('* ', substring($line,3)) else $line), ' +')"/></xsl:sequence>
  	</xsl:function>


	<!-- ======================================================================
	     function api:strip-ns( names : xs:string*) : xs:string*
	     ======================================================================
         Liefert für jeden übergebenen Namen seine Variante garantiert ohne 
         Namespace Prefix.  
	= =  ================================================================== = = -->
    <xsl:function name="api:strip-ns" as="xs:string*">
	  <xsl:param name="names" as="xs:string*"/>
	  <xsl:sequence select="for $name in $names return  if (contains($name, ':')) then substring-after($name, ':') else $name"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:verFromUriHusst( name : xs:string?) : xs:string
	     ======================================================================
         Liefert die Version als <Hauptversion>_<Unterversion>_<Bugfix> 
         herausgelöst aus einer namespace Angabe für eine Husst-Version:
         <Irgendwas>/<Hauptversion>_<Unterversion>_<Bugfix>
         oder nix.
	= =  ================================================================== = = -->
    <xsl:function name="api:verFromUriHusst" as="xs:string">
	  <xsl:param name="name" as="xs:string?"/>
	  <xsl:sequence select="replace($name, '.*/([0-9]+_[0-9]+_[0-9]+)$', '$1')"/>
	</xsl:function>	

	<xsl:function name="api:logLevelValue" as="xs:integer">
	  <xsl:param name="level" as="xs:string"/>
	  <xsl:choose>
	    <xsl:when test="$level='ERROR'">5</xsl:when>
	    <xsl:when test="$level='WARNING'">4</xsl:when>
	    <xsl:when test="$level='INFO'">3</xsl:when> <!--  Default -->
	    <xsl:when test="$level='HINT'">2</xsl:when>
	    <xsl:when test="$level='DEBUG'">1</xsl:when>
	    <xsl:otherwise>3</xsl:otherwise>
      </xsl:choose>
	</xsl:function>

	<xsl:function name="api:log" as="xs:string?">
		<!--
		  gibt abhängig vom Loglevel eine Log-Msg aus 
		-->
		<xsl:param name="level" as="xs:string" />
		<xsl:param name="msg" as="xs:string*" />
	
		<xsl:variable name="lvValue"
			select="api:logLevelValue($level)" />
		<xsl:variable name="logLvValue"
			select="api:logLevelValue($loglevel)" />
	
		<xsl:if test="not($lvValue lt $logLvValue)">
			<xsl:variable name="full"
				select="string-join((concat($level, ':'), string-join($msg,'')), ' ')" />
			<xsl:message select="$full" />
		</xsl:if>
	</xsl:function>

	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>	
</xsl:stylesheet>
