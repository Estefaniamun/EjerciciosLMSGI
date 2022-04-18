<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"></xsl:output>
    
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>Horario</title>
            </head>
            <body>
                <table border="1">
                   <tr>
                       <td></td>
                       <td>8:30-9:30</td>
                       <td>9:30-10:30</td>
                       <td>10:30-11:30</td>
                       <td>12:00-13:00</td>
                       <td>13:00-14:00</td>
                       <td>14:00-15:00</td>
                   </tr>
                    
                    <xsl:for-each select="horario/dia">
                        <tr>
                            <td><xsl:value-of select="@desc"/></td>
                            <xsl:for-each select="hora">
                                <xsl:sort select="@orden" order="ascending"/>
                                <td>
                                    <xsl:if test="position() mod 2 = 1">
                                        <xsl:attribute name="style">background-color: lightblue;</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="."/></td>
                              
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
    
   
       
</xsl:stylesheet>