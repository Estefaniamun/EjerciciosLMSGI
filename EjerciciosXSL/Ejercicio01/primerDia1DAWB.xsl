<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"></xsl:output>
    
    
    <xsl:template match="/primerDia1DAW">
        <html>
            <head>
                <title>Estructura</title>
            </head>
            <body>
                
                <table border="1" width="20%">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>
                
                
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 11">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/> 
        <xsl:if test="$j &lt;= 8">
            <xsl:call-template name="celda">
                <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
                <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
                <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="estructuraAula/bloque">
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:call-template name="colorEstructura">
                        <xsl:with-param name="tipo" select="@tipo"/>
                    </xsl:call-template>
                    <p><xsl:value-of select="@tipo"/></p>
                </xsl:if>
            </xsl:for-each>
            
            <xsl:for-each select="alumnado/alumno">
                
                <xsl:if test="@x = $x and @y = $y">
                    <xsl:choose>
                        <xsl:when test="@sexo = 'H'">
                            <xsl:attribute name="style">background: purple;</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background: orange;</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:call-template name="imagenAlumno">
                        <xsl:with-param name="sexo" select="@sexo"/>
                    </xsl:call-template>
                    <p><xsl:value-of select="."/></p>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    <xsl:template name="colorEstructura">
    <xsl:param name="tipo"/>
    <xsl:for-each select="/primerDia1DAW/estructuraAula/color">
        <xsl:if test="@tipo = $tipo">
            <xsl:attribute name="style">background:#<xsl:value-of select="."/>;</xsl:attribute>
        </xsl:if>
    </xsl:for-each>    
    </xsl:template>
    
    <xsl:template name="imagenAlumno">
        <xsl:param name="sexo"/>
        <xsl:for-each select="/primerDia1DAW/alumnado/imagen">
            <xsl:if test="@sexo = $sexo">
            <img src="{.}" width="50%"></img>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>