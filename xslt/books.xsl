<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0">
    <xsl:template match="/bookstore/book">
        <html>
            <head>
                <title>Books By Subject</title>
            </head>
            <body>
                <h3><xsl:value-of select="title" /></h3>
                <p><strong>By - </strong>
                    <xsl:apply-templates select="author" />
                </p>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>