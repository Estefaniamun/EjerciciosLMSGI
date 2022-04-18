<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>

    <xsl:template match="/juegoTanques">
        <html>
            <head>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1" width="100%">
                    <tr>
                        <th>Nº Jugada</th>
                        <th>Jugador</th>
                        <th>Tanque</th>
                        <th>Jugada</th>
                    </tr>
                   <xsl:apply-templates select="jugadasDescritas/jugada"/>

                </table>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="jugada">
        <tr>
            <xsl:if test="position() mod 2 = 1">
                <xsl:attribute name="style">background:lightblue;</xsl:attribute>
            </xsl:if>
            <td><xsl:value-of select="position()"/></td>
            <td><xsl:value-of select="@jugador"/></td>
            <td>
                <xsl:call-template name="imagenTanque">
                    <xsl:with-param name="jugador" select="@jugador"/>
                </xsl:call-template>
            </td>
            <td><xsl:value-of select="@desc"/></td>
        </tr>
    </xsl:template>

    <xsl:template name="imagenTanque">
        <xsl:param name="jugador"/>
        <xsl:for-each select="/juegoTanques/tanques/imagenTanque">
            <xsl:if test="@jugador = $jugador">
                <img src="{.}"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>



    <xsl:template name="css">
        <style>
            img {
                width: 50px;
            }
            th {
                color: white;
                background: blue;
            }</style>
    </xsl:template>
</xsl:stylesheet>
