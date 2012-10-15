<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 15, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> olendorf</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/bookstore">
        <html>
            <head>
                <title>Books By Subject</title>
            </head>
            <body>
                <xsl:apply-templates select="book" />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="book">
        <div>
            <h2>Category: <xsl:value-of select="@category" /></h2>
            <div>
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="title">
        <p><strong>Title: </strong><xsl:value-of select="current()"></xsl:value-of></p>
        <xsl:apply-templates select="ancestor-or-self::bookstore"></xsl:apply-templates>
    </xsl:template>
</xsl:stylesheet>