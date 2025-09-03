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

	<!-- ======================================================================
		 globale Variablen 
	= =  ================================================================== = = -->
	<!-- die HusstVersion mit unterstrichen -->
	<xsl:variable name="small"/>
  
	<!-- die HusstVersion -->
	<xsl:variable name="nsHusst" select="if (namespace-uri-for-prefix('husstDV', /*) > '') then 'husstDV' else 'husst'" />
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
	<xsl:variable name="pathTemplates" select="concat('file:///', iri-to-uri( concat(translate($defaults, '\', '/'), if (ends-with($defaults, '/')) then '' else '/') ))" />
	
	<!-- Dateiname der aktuellen Inputdatei -->
	<xsl:variable name="documentName" select="concat('HUSST_Dv', $schema,'_', $verHusst_, '.xsd')" />
	 
	<!-- alle Schemata zu einem Dokument zusammengefasst -->
	<xsl:variable name="schemata" select="
	  if ($nsHusst='husstDV') then
		 document(concat('../../../HUSST_DvBasis_',        $verHusst_ , '.xsd'))
		|document(concat('../../../HUSST_DvTarifAngebot_', $verHusst_ , '.xsd'))
		|document(concat('../../../HUSST_DvVertrieb_',     $verHusst_ , '.xsd'))
	  else
	    document(concat('../../../HUSST_Ergebnisdaten_',  $verHusst_ , '.xsd'))
	"/>
		 
	<!-- das Schema -->
	<xsl:variable name="schema" select="if ($nsHusst='husstDV') then string-join(/xs:schema/xs:annotation/xs:appinfo/api:schema/@name) else 'Ergebnis'" />

	<!-- das/die Root-Element(e) -->
	<xsl:variable name="root"         select=" /xs:schema/xs:element[not(@name=$schemata//xs:*/substring-after(@ref,':'))]"/>

	<!-- die Elemente -->
	<xsl:variable name="elemDomain"   select="if ($nsHusst='husstDV') 
	  then /xs:schema/xs:element[not(@name=$root/@name)]
	  else /xs:schema/xs:complexType[not(@name=$root/api:strip-ns(@type))]" />
	
	<!-- die einfachen Datentypen -->
	<xsl:variable name="enumDomain"   select="/xs:schema/xs:simpleType[    xs:annotation/xs:appinfo/api:schema/@name  and     xs:*/xs:enumeration]"/>
	<xsl:variable name="simpleDomain" select="/xs:schema/xs:simpleType[    xs:annotation/xs:appinfo/api:schema/@name  and not(xs:*/xs:enumeration) and not(xs:union)]"/>
	<xsl:variable name="enumTech"     select="/xs:schema/xs:simpleType[not(xs:annotation/xs:appinfo/api:schema/@name) and     xs:*/xs:enumeration]"/>
	<xsl:variable name="simpleTech"   select="/xs:schema/xs:simpleType[not(xs:annotation/xs:appinfo/api:schema/@name) and not(xs:*/xs:enumeration) and not(xs:union)]"/>

	<!-- Husst-eigene Typen, die eigene Doku brauchen -->
	<xsl:variable name="needsDocu" select="$schemata/xs:schema/xs:*[@name and xs:annotation/xs:appinfo/api:needsDocu]"/>

    <xsl:variable name="missingDocuTable">[red]#_todo: Doku_#</xsl:variable>
    <xsl:variable name="missingDocu">IMPORTANT: _todo: Doku_</xsl:variable>
  
	<xsl:variable name="datentypV1" select="'&lt;T&gt;: '"/>
	<xsl:variable name="datentypV2" select="'Datentyp: '"/>
	<xsl:variable name="datentypV3" select="'image:t-angle-brackets-v2.svg[&lt;T&gt;,35,35,opts=inline] '"/>
	<xsl:variable name="datentyp" select="$datentypV3"/>
  
	<!-- ======================================================================
		 die gesamte Xsd 
	= =  ================================================================== = = -->
<!-- 	<xsl:template match="xs:schema"> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 		<xsl:value-of select="concat('nsHusst:', $nsHusst)" /> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 		<xsl:value-of select="concat('uriHusst:', $uriHusst)" /> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 		<xsl:value-of select="concat('schema:', $schema)" /> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 		<xsl:value-of select="concat('root:', $root/@name)" /> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 		<xsl:value-of select="concat('elemente:', count(xs:complexType[not(@name=api:strip-ns($root/@type))]))" /> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 		<xsl:value-of select="concat('enumDomain:', count($enumDomain), ' simpleDomain:', count($simpleDomain), ' enumTech:', count($enumTech), ' simpleTech:', count($simpleTech))" /> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!--         <xsl:value-of select="$crlf"/> -->
<!-- 	</xsl:template> -->
	
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
			<xsl:for-each select="$simpleDomain">
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
		<xsl:value-of select="api:setAnchor( api:strip-ns( @type ) )"/>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="api:header(1, @name)" />

		<xsl:apply-templates select="../xs:complexType[@name=api:strip-ns(current()/@type)]"/>
	</xsl:template>
	<xsl:template match="xs:complexType[parent::xs:schema]">
		<xsl:if test="not(@name=../xs:element/api:strip-ns(@type))">
			<xsl:value-of select="api:setAnchor( @name )"/>
			<xsl:value-of select="$crlf"/>
			<xsl:value-of select="api:header(1, @name)" />
		</xsl:if>
		<xsl:value-of select="$crlf"/>
		<xsl:call-template name="api:docu"/>
		
		<!-- [options="header"] -->
		<!-- |======================= -->
		<!-- |Eigenschaft|Beschreibung -->
		<!-- |Bearbeitungdsatum  | -->
		<!-- |Lieferant| das ist der Lieferant der Daten -->
		<!-- |=======================		 -->
		<xsl:value-of select="$crlf"/>
		<xsl:text>[options="header" cols="2%,20%,78%"]</xsl:text>
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

        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="@name"/></xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xs:element" mode="table" >
		<xsl:variable name="type">
			<xsl:call-template name="type"/>
		</xsl:variable>

		<xsl:value-of select="concat('|', if (@minOccurs > 0) then '★&#160;|' else ' |', @name, api:strip-ns(@ref), '|' )" />
		<xsl:value-of select="$crlf"/>

		<!-- Doku ist für eigene Datentypen optional -->		
		<xsl:choose>
			<xsl:when test="contains($type, 'husst') ">
            	<xsl:call-template name="api:docu-table"/>
			</xsl:when>
			<xsl:otherwise>
            	<xsl:call-template name="api:docu-table"/>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
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
				<xsl:value-of select="api:linkAnchor( $type )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="api:strip-ns( $type )"/>
			</xsl:otherwise>
		</xsl:choose>		 
		<xsl:value-of select="$crlf"/>
	</xsl:template>
	

	<!-- ======================================================================
	     Enumerationen und Bitfelder
	= =  ================================================================== = = -->
	<xsl:template match="xs:simpleType[@name=($simpleDomain|$enumDomain)/@name]">
		<xsl:value-of select="api:setAnchor( api:strip-ns( @name ) )"/>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
		<xsl:if test="(count(../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name) = 1) and contains(@name, 'HUSST')">
			<xsl:value-of select="api:setAnchor( ../xs:simpleType[contains(xs:union/@memberTypes, current()/@name)]/@name)"/>
			<xsl:value-of select="$crlf"/>
		</xsl:if>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="api:header(1, api:captionText(@name))" />
		<xsl:choose>
			<xsl:when test="contains(@name, 'husst')">
				<xsl:variable name="docu">
					<xsl:for-each select="xs:annotation/xs:documentation">
						<xsl:call-template name="api:docu-no-warning" />
					</xsl:for-each>
					<xsl:for-each select="../xs:simpleType[substring-before(xs:union/@memberTypes, current()/@name)>'']/xs:annotation/xs:documentation">
						<xsl:call-template name="api:docu-no-warning" />
					</xsl:for-each>
				</xsl:variable>
				<xsl:value-of select="if ($docu > '') then concat($docu, $crlf) else $missingDocu"/>				
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="api:docu"/>
			</xsl:otherwise>
		</xsl:choose> 
		<xsl:if test="not(count(xs:*/xs:enumeration)=0)" >
			<!-- [options="header"] -->
			<!-- |======================= -->
			<!-- |Eigenschaft|Beschreibung -->
			<!-- |Bearbeitungdsatum  | -->
			<!-- |Lieferant| das ist der Lieferant der Daten -->
			<!-- |=======================		 -->
			<xsl:value-of select="$crlf"/>
			<xsl:text>[options="header" cols="20%,80%"]</xsl:text>
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

		<xsl:variable name="typeNames" select="@name|ancestor::xs:schema/xs:simpleType[xs:union/contains(@memberTypes, current()/@name)]/@name" />
        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="$typeNames"/></xsl:call-template>
	</xsl:template>
		
	<xsl:template match="xs:enumeration" mode="table" >
		<xsl:value-of select="concat('|', @value, '|' )" />
		<xsl:value-of select="$crlf"/>
		
		<xsl:call-template name="api:docu-table" />
		<xsl:value-of select="$crlf"/>

        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="@name"/></xsl:call-template>
	</xsl:template>
	
	<xsl:template match="xs:simpleType|xs:complexType">
		<xsl:value-of select="api:setAnchor( api:strip-ns( @name ) )"/>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="api:header(1, api:captionText(@name))" />
		<xsl:call-template name="api:docu"/>


        <xsl:call-template name="references"><xsl:with-param name="typeNames" select="@name"/></xsl:call-template>
	</xsl:template>
	
	
	<xsl:template name="references">
		<xsl:param name="typeNames"/>
		
        <xsl:variable name="references" select="
          $schemata//xs:element[api:strip-ns(@type) = $typeNames]/ancestor::xs:complexType
         |$schemata//xs:complexType[xs:*/xs:element/api:strip-ns(@ref)=$schemata//xs:element[api:strip-ns(@type)=$typeNames]/@name]
        "/>
		
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
		<xsl:text>Verwendet in:</xsl:text>
		<xsl:choose>
			<xsl:when test="(count($references) = 0)">
				<xsl:text> ohne Verwendung</xsl:text>
				
			</xsl:when>
			<xsl:when test="(count($references) > 30)">
				<xsl:value-of select="concat(' ', count($references), ' Elementen')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$crlf"/>
	           	<xsl:for-each select="$references">
	           		<xsl:sort select="@name"/>
           			<xsl:value-of select="if (position()=1) then ' ' else ', ' "/>
					<xsl:value-of select="api:linkAnchor(@name)"/>
	           	</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="$crlf"/>
		<xsl:value-of select="$crlf"/>
	</xsl:template>
	
	<xsl:template name="type">
		<xsl:sequence>
			<xsl:value-of select="@type"/>
			<xsl:value-of select="/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type"/>
			<xsl:value-of select="$schemata/xs:schema/xs:*[@name=api:strip-ns(current()/@ref)]/@type"/>
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
		<xsl:value-of select="$text"/>			
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
		<xsl:sequence select="if ($name) then concat('[[', $name ,']]') else ''"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:linkAnchor( name : xs:string ) : xs:string
	     ======================================================================
         Verlinkt zu einem zuvor gesetzten Ascii-Doc <<Anker>>.
	= =  ================================================================== = = -->
	<xsl:function name="api:linkAnchor" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="concat('&lt;&lt;', api:strip-ns($name), ',', api:captionText($name), '>>')"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:strip_Type( name : xs:string ) : xs:string
	     ======================================================================
         Entfernt eine mögliche "_Type" Endung von einem Namen:
           ID_Sortentyp_Type            - - > ID_Sortentyp 
           und ID_SortentypHUSST_Type   - - > ID_SortentypHUSST           
	= =  ================================================================== = = -->
	<xsl:function name="api:strip_Type" as="xs:string">
		<xsl:param name="name" as="xs:string"/>
		<xsl:sequence select="if (substring-before($name, '_Type')='') then $name else substring-before($name, '_Type')"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:strip_Type( name : xs:string ) : xs:string
	     ======================================================================
         Entfernt eine mögliche HUSST Endung von einem String 
	= =  ================================================================== = = -->
	<xsl:function name="api:stripHUSST" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="if (substring-before($name, 'HUSST')='') then $name else substring-before($name, 'HUSST')"/>
	</xsl:function>	


	<!-- ======================================================================
	     function api:captionText( name : xs:string ) : xs:string
	     ======================================================================
         Entfernt alle möglichen Typ artigen Endungen um einen Namen für 
         die Darstellung zu bereinigen. 
	= =  ================================================================== = = -->
	<xsl:function name="api:captionText" as="xs:string">
	  <xsl:param name="name" as="xs:string"/>
	  <xsl:sequence select="api:strip-ns(api:stripHUSST(api:strip_Type($name)))"/>
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
			<xsl:value-of select="api:docuFormat($externalText)" />

			<xsl:if test="not(unparsed-text-available($filename))">
			  <xsl:message select="concat('WARNING: not found:', $filename )"/>
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
        	<xsl:when test="not($isEmpty)"><xsl:value-of select="api:docuFormat($lines)"/></xsl:when>
        	<xsl:when test="$maybeEmpty"/>
        	<xsl:otherwise>                <xsl:value-of select="api:docuFormat($warning)"/></xsl:otherwise>
        </xsl:choose>
        
        <xsl:apply-templates select="xs:annotation/xs:appinfo/api:example" mode="docu" />
	</xsl:template>

	<xsl:template match="api:example" mode="docu">
<!-- 		<xsl:message select="concat('DEBUG: ', $crlf, '.Note', $crlf, '====', api:docuFormat(.), $crlf, '====', $crlf, $crlf)" /> -->
		<xsl:value-of select="concat($crlf, $crlf, '====', api:docuFormat(.), $crlf, '====', $crlf, $crlf)" />
	</xsl:template>


	<xsl:function name="api:docuFormat" as="xs:string">
	    <xsl:param name="lines" as="xs:string*"/>
	
	    <xsl:variable name="joined" select="string-join($lines, $crlf)"/>
	    <xsl:variable name="formatted" select="
			replace(
				replace(
					replace(
			    		replace($joined
			    		, '(^|\n)[ \t]+', '$1')               (: führende Leerzeichen entfernen :)
			    	, '(^|\n)([a-z]\. )', '$1{nbsp}$2')       (: /Zeichen/./Blank/ mit einem geschützen Leerzeichen vor Mißinterpretation als Aufzählung bewahren :)
		    	, '(\n)([*-])', '$1$1*')                      (: Aufzählungen mit zusätzliche Umbruch versehen :)
	    	, '([^\n])\n([^\n*-])', '$1 $2')                  (: Fließextumbrüche entfernen :)
	    	"			
		/>
	
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


	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>	
</xsl:stylesheet>