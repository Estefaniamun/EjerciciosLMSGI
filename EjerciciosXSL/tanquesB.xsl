<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>

    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <style>
                    td {
                        width: 30px;
                        height: 30px;
                    }</style>
            </head>
            <body>
                <xsl:for-each select="jugadasGraficas/jugadaGrafica">
                    <table border="1">
                        <tr style="background: blue; color: white;">
                            <td/>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>8</td>
                        </tr>
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i" select="1"/>
                        </xsl:call-template>
                    </table>
                    <p/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>


    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 8">
            <tr>
                <td style="background: blue; color: white;">
                    <xsl:value-of select="$i"/>
                </td>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i"/>
                    </xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:if test="$j &lt;= 8">
            <xsl:call-template name="celda">
                <xsl:with-param name="x">
                    <xsl:value-of select="$j"/>
                </xsl:with-param>
                <xsl:with-param name="y">
                    <xsl:value-of select="$i"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i"/>
                </xsl:with-param>
                <xsl:with-param name="j">
                    <xsl:value-of select="$j + 1"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="posicion">
                <xsl:if test="$x = @x and $y = @y">
                    <xsl:choose>
                        <xsl:when test="@tipo = 'tanque'">
                            <xsl:attribute name="style">background: red;</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background: black;</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>


</xsl:stylesheet>
