<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"

  xmlns:husstDVFrom="http://husst.de/Versorgungsdaten/3_4_1"
  xmlns:apiFrom="http://www.husst.de/Appinfo/3_4_1"

  xmlns:husstDVTo="http://husst.de/Versorgungsdaten/3_5_0"
  xmlns:apiTo="http://husst.de/Appinfo/3_5_0">

  <xsl:output encoding='UTF-8' method='xml' />

  <!--
    Diese Transformation organisiert ausschließlich die 
    Migration von einer Husst-Versionsnummer x1.y1.z1 zu einer x2.y2.z2   
  -->

  <!-- Quell- und Zielversionsnummer eintragen -->
  <xsl:param name="fromVer" select="'3.4.1'"/>
  <xsl:param name="toVer"   select="'3.5.0'"/>
  
  <xsl:variable name="fromVerDot" select="$fromVer" />
  <xsl:variable name="toVerDot"   select="$toVer" />


  <xsl:variable name="fromVerUl"
    select="translate($fromVerDot, '.', '_')" />
  <xsl:variable name="toVerUl"
    select="translate($toVerDot, '.', '_')" />

  <xsl:variable name="nsHusstDVTo"
    select="concat('http://husst.de/Versorgungsdaten/', $toVerUl)" />
  <xsl:variable name="nsApiTo"
    select="concat('http://husst.de/Appinfo/', $toVerUl)" />

  <!--   Wandelt alle Quellverisonsangaben in einem String in Zielveresionsangaben um -->
  <xsl:template
    match="xs:documentation[contains(., $fromVerDot) or contains(., $fromVerUl)]">
    <xsl:copy copy-namespaces="no">
      <xsl:value-of select="replace(replace(.,$fromVerUl, $toVerUl), replace($fromVerDot,'\.','\\.'), $toVerDot)" />      
    </xsl:copy>
  </xsl:template>

  <xsl:template
    match="@type[parent::xs:element[@name='ID_DynAttributDef']]">
    <xsl:copy>
      husstDV:INT4
    </xsl:copy>
  </xsl:template>

  <xsl:template match="apiFrom:*">
    <xsl:if test="parent::apiFrom:*">
      <xsl:value-of
        select="preceding-sibling::text()[position()=last()]" />
    </xsl:if>
    <xsl:element name="api:{local-name()}"
      namespace="{$nsApiTo}">
      <xsl:namespace name="api" select="$nsApiTo" />
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="*" />
    </xsl:element>
    <xsl:if
      test="parent::apiFrom:* and not(following-sibling::apiFrom:*)">
      <xsl:value-of
        select="following-sibling::text()[position()=last()]" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="xs:schema">
    <xsl:copy copy-namespaces="no">
      <xsl:namespace name="api" select="$nsApiTo" />
      <xsl:namespace name="husstDV" select="$nsHusstDVTo" />
      <xsl:apply-templates
        select="@*[not(@name='targetNamespace')]" />
      <xsl:attribute name="targetNamespace"
        select="$nsHusstDVTo" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <!-- standard copy template -->
  <xsl:template match="@*|node()">
    <xsl:copy copy-namespaces="no">
      <!-- <xsl:copy> -->
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>