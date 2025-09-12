<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:husstDV="http://husst.de/Versorgungsdaten/3_7_0"
    xmlns:api="http://husst.de/Appinfo/3_7_0"
>
	<xsl:output method="text" encoding="UTF-8" />

	<!-- 	Test-Script zum Test von einzelnen Techniken für die Doku Generierung
	-->

	<!-- ======================================================================
		 Parameter und globale Variablen 
	= =  ================================================================== = = -->
	<!-- die Menü-Ebene, ab der die Überschriften aus der Xsd beginnen
		 wird von außen vorgegeben (z.Zt. 3)
	 -->
	<xsl:param name="einstiegsebene" as="xs:integer">0</xsl:param>
	<!-- Pfad zu den Default-Templates -->
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
	
	<!-- Pfade zu den Vorlagedateien -->
	<xsl:variable name="pathTemplates" select="$defaults"/>
	<xsl:variable name="pathTemplatesGlobal" select="$defaults"/>
	
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

    <xsl:variable name="missingDocuTable">[red]#_todo: Doku_#</xsl:variable>
    <xsl:variable name="missingDocu">IMPORTANT: _todo: Doku_</xsl:variable>
	
	<!-- standard copy template -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
	<!-- == Funktionen ============================================================ -->
		


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

  
  	<xsl:function name="api:out" as="xs:string?">
  		<xsl:param name="text" as="xs:string?" />
  		<xsl:message select="concat('DEBUG: ', $text)"/>
  		<xsl:sequence select="concat($text, $crlf, $crlf)" />
  	</xsl:function>
  
	<xsl:template match="xs:schema">
		<xsl:text>
		# xs:schema #	
		</xsl:text>

<!-- 		<xsl:variable name="def" select="$defaults" />		 -->
		<xsl:variable name="def" select="if ( ends-with($defaults, '\')) then substring($defaults, 1, string-length($defaults)-1) else '' " />		
		
<!-- 		<xsl:variable name="path"   select="concat('', $def)"/> -->
		<xsl:variable name="path"   select="concat(translate($def, '\', '/'), if (ends-with($defaults, '/')) then '' else '/')"/>
		
		<xsl:variable name="pathTemplate" select="concat('file:///', iri-to-uri( concat(translate($def, '\', '/'), if (ends-with($defaults, '/')) then '' else '/') ))" />
		
		<xsl:variable name="iri"    select="iri-to-uri(      $path )"/>
		<xsl:variable name="escape" select="escape-html-uri( $path )"/>
		<xsl:variable name="encode" select="encode-for-uri(  $path )"/>

		<xsl:variable name="fn-iri"    select="concat('file:///', $iri,     'Element_Deaktiviert.adoc')"/>
		<xsl:variable name="fn-escape" select="concat('file:///', $escape , 'Element_Deaktiviert.adoc')"/>
		<xsl:variable name="fn-encode" select="concat('file:///', $encode,  'Element_Deaktiviert.adoc')"/>


		<xsl:variable name="found-iri"    select="if (unparsed-text-available($fn-iri))    then 'found    ' else 'not found'"/>
		<xsl:variable name="found-escape" select="if (unparsed-text-available($fn-escape)) then 'found    ' else 'not found'"/>
		<xsl:variable name="found-encode" select="if (unparsed-text-available($fn-encode)) then 'found    ' else 'not found'"/>

		<xsl:value-of select="api:out(concat('def=',  $def))"/>
		<xsl:value-of select="api:out(concat('path=', $path))"/>
		<xsl:value-of select="api:out(concat('      iri-to-uri=[', $found-iri    , ']', $iri,    '->', $fn-iri   ))"/>
		<xsl:value-of select="api:out(concat(' escape-html-uri=[', $found-escape , ']', $escape, '->', $fn-escape))"/>
		<xsl:value-of select="api:out(concat('  encode-for-uri=[', $found-encode , ']', $encode, '->', $fn-encode))"/>
		
	</xsl:template>

</xsl:stylesheet>