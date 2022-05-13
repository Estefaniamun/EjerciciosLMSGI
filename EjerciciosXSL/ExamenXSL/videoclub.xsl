<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="/videoclub">


        <html>
            <head>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <table border="1" width="100%">
                    <tr>
                        <th>Titulo</th>
                        <th>Pegi</th>
                        <th>Duración/Plataforma</th>
                        <th>Alquiler diario</th>
                    </tr>
                    <xsl:call-template name="TablaPrimera"/>
                </table>



                <table border="1">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i">1</xsl:with-param>
                    </xsl:call-template>
                </table>
            </body>
        </html>

    </xsl:template>
    <xsl:template name="css">
        <style>
            th {
                background-color: blue;
                color: white;
            }</style>
    </xsl:template>

    <xsl:template name="TablaPrimera">

        <xsl:for-each select="/videoclub/Peliculas/pelicula">
            <xsl:sort select="@order"/>
            <tr>
                <xsl:attribute name="style">
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 1"> background-color: yellow; </xsl:when>
                        <xsl:otherwise> background-color: lightyellow; </xsl:otherwise>
                    </xsl:choose>

                </xsl:attribute>
                <td>
                    <xsl:value-of select="@titulo"/>
                </td>
                <td>
                    <xsl:value-of select="@pegi"/>
                </td>
                <td>
                    <xsl:value-of select="@duracionEnMinutos"/> min </td>
                <td>
                    <xsl:value-of select="@alquilerDiario"/>
                </td>

            </tr>


        </xsl:for-each>
        <xsl:for-each select="/videoJuego">
            <xsl:sort select="@order"/>
            <tr>
                <xsl:attribute name="style">
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 1"> background-color: green; </xsl:when>
                        <xsl:otherwise> background-color: lightgreen; </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <td>
                    <xsl:value-of select="."/>
                </td>
                <td>
                    <xsl:value-of select="@pegi"/>
                </td>
                <td>
                    <xsl:value-of select="@plataforma"/>
                </td>
                <td>
                    <xsl:value-of select="@alquilerDiario"/>
                </td>
            </tr>
        </xsl:for-each>
        <xsl:for-each select="/videoclub/videojuegos/videoJuego">
            <xsl:sort select="@order"/>
            <tr>
                <xsl:attribute name="style">
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 1"> background-color: green; </xsl:when>
                        <xsl:otherwise> background-color: lightgreen; </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <td>
                    <xsl:value-of select="."/>
                </td>
                <td>
                    <xsl:value-of select="@pegi"/>
                </td>
                <td>
                    <xsl:value-of select="@plataforma"/>
                </td>
                <td>
                    <xsl:value-of select="@alquilerDiario"/>
                </td>
            </tr>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 5">
            <tr>
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
        <xsl:if test="$j &lt;= 5">
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
            <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                <xsl:call-template name="color">
                    <xsl:with-param name="a">videojuegos</xsl:with-param>
                </xsl:call-template>
                <xsl:if test="@x = $y and @y = $x">
                    <xsl:call-template name="seleccionar">
                        <xsl:with-param name="valor"><xsl:value-of select="idImg/@valor"
                            /></xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="."/>
                    Pegi: <xsl:value-of select="@pegi"/> 
                     Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
                <xsl:for-each
                    select="/videoclub/Peliculas/pelicula/coordenadas[$x = @y and $y = @x]">
                    <xsl:call-template name="color">
                        <xsl:with-param name="b">peliculas</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="seleccionarImagenPeli">
                        <xsl:with-param name="id"><xsl:value-of
                                select="/videoclub/Peliculas/pelicula/@idimg"/></xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="../@titulo"/>
                    Pegi: <xsl:value-of select="../@pegi"/>
                    Alquiler: <xsl:value-of select="../@alquilerDiario"/>
                </xsl:for-each>
            </xsl:for-each>


        </td>
    </xsl:template>

    <xsl:template name="color">
        <xsl:param name="a"/>
        <xsl:param name="b"/>
        <xsl:choose>
            <xsl:when test="color[@identificador = $a]">
                <xsl:attribute name="style"> background-color: <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:when>
            <xsl:when test="color[@identificador = $b]">
                <xsl:attribute name="style"> background-color: <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="imagen">
        <xsl:param name="valor"/>
        <xsl:for-each select="/videoclub/bancoDeImagenes/imagen">
            <xsl:if test="$valor = @identificador">
                <img src="{.}" style="width:50%"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="seleccionar">
        <xsl:param name="valor"/>

        <xsl:if test="idImg[$valor = @valor]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">juegoAssasins</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="idImg[$valor = @valor]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">juegoFarCry</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="idImg[$valor = @valor]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">juegoGodOfWar</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="idImg[$valor = @valor]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">juegoZelda</xsl:with-param>
            </xsl:call-template>
        </xsl:if>

    </xsl:template>

    <xsl:template name="seleccionarImagenPeli">
        <xsl:param name="id"/>

        <xsl:if test="pelicula[$id = @idimg]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">peliIt</xsl:with-param>
            </xsl:call-template>

        </xsl:if>

        <xsl:if test="pelicula[$id = @id]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">peliDespertar</xsl:with-param>
            </xsl:call-template>

        </xsl:if>
        <xsl:if test="pelicula[$id = @id]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">peliVengadores</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="pelicula[$id = @id]">
            <xsl:call-template name="imagen">
                <xsl:with-param name="valor">peliUltron</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
