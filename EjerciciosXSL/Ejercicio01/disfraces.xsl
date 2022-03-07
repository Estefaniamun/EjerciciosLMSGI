<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/Disfraces">
        <html>
            <head>
                <title>Disfraces</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="leon">
        <h1>El león hace: <xsl:value-of select="."/></h1>
    </xsl:template>
    
    <xsl:template match="peppapig">
        <h1>Peppa Pig hace: <xsl:value-of select="."/></h1>
    </xsl:template> 
    <xsl:template match="caballitodemar">
        <h1>El caballito de mar hace: <xsl:value-of select="."/></h1>
   
    </xsl:template>
</xsl:stylesheet>