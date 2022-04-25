<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html"/>

    <xsl:template match="/partidoBaloncesto">
        <html>
            <head>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <div>
                    <xsl:attribute name="style">witdth: 1000px; margin: 0 auto;</xsl:attribute>
                    <h1>
                        <xsl:attribute name="align">center</xsl:attribute> Baloncesto: <xsl:value-of
                            select="/partidoBaloncesto/equipo[@tipo = 'Local']/@nombre"/> -
                            <xsl:value-of
                            select="/partidoBaloncesto/equipo[@tipo = 'Visitante']/@nombre"/></h1>
                </div>

                <xsl:call-template name="TablaPrimera"/>
                <xsl:call-template name="cancha"/>
                <xsl:call-template name="TablaSegunda"/>

            </body>
        </html>



    </xsl:template>

<!-- Tabla Jugadores -->
    <xsl:template name="TablaPrimera">
        <table border="1" width="100%">
            <tr>
                <th>Equipo</th>
                <th>Jugador</th>
                <th>Dorsal</th>
                <th>Apodo</th>
                <th>Puntos</th>
                <th>Rebotes</th>
                <th>Asistencias</th>
            </tr>
            <xsl:for-each select="/partidoBaloncesto/equipo">
                <xsl:for-each select="jugador">
                    <xsl:sort select="@nombre"/>
                    <tr>
                        <xsl:attribute name="style">
                            <xsl:choose>
                                <xsl:when test="../@tipo = 'Local'">
                                    <xsl:if test="position() mod 2 = 1"> background-color: #d8e7ff; </xsl:if>

                                </xsl:when>
                                <xsl:when test="../@tipo = 'Visitante'">
                                    <xsl:if test="position() mod 2 = 1"> background-color: #d8ffcc; </xsl:if>

                                </xsl:when>
                            </xsl:choose>

                        </xsl:attribute>
                        <td>
                            <img src="{../@imagen}"/>
                        </td>
                        <td>
                            <xsl:value-of select="@nombre"/>
                        </td>
                        <td>
                            <xsl:value-of select="@dorsal"/>
                        </td>
                        <td>
                            <xsl:value-of select="@apodo"/>
                        </td>
                        <td>
                            <xsl:value-of select="@puntos"/>
                        </td>
                        <td>
                            <xsl:value-of select="@rebotes"/>
                        </td>
                        <td>
                            <xsl:value-of select="@asistencias"/>
                        </td>
                    </tr>
                </xsl:for-each>

            </xsl:for-each>
        </table>
    </xsl:template>
<!-- Pista -->
    <xsl:template name="cancha">
        <xsl:call-template name="css"/>
        <table width="1000px" class="pista" align="center">
         
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
        </table>
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
                <xsl:call-template name="bucleForFila">
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i + 1"/>
                    </xsl:with-param>
                </xsl:call-template>
            </tr>
        </xsl:if>
    </xsl:template>


    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:if test="$j &lt;= 10">
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
            <xsl:for-each select="/partidoBaloncesto/equipo/jugador">
                <xsl:if test="@posicionX = $x and @posicionY = $y">
                    <img src="{../@imagen}"/>
                    <xsl:value-of select="@nombre"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>




 <!-- Segunda Tabla -->

    <xsl:template name="TablaSegunda">
        <table border="1" width="50%" align="center">
            <tr>
                <th>Tiempo</th>
                <th>Jugador</th>
                <th>Apodo</th>
                <th>Descripción</th>
                <th>Icono</th>
            </tr>
            <xsl:for-each select="historico/entrada">
                <xsl:variable name="tipo">
                    <xsl:value-of select="@tipo"/>
                </xsl:variable>
                <xsl:variable name="jugador">
                    <xsl:value-of select="@jugador"/>
                </xsl:variable>
                <tr>
                    <td>
                        <xsl:value-of select="@tiempo"/>
                    </td>
                    <td>
                        <xsl:value-of select="@jugador"/>
                    </td>
                    <td>
                        <xsl:value-of
                            select="/partidoBaloncesto/equipo/jugador[@nombre = $jugador]/@apodo"/>
                    </td>
                    <td>
                        <xsl:value-of select="."/>
                    </td>
                    <td>
                        <img src="{/partidoBaloncesto/historico/imagen[@tipo=$tipo]}"/>
                    </td>
                </tr>
            </xsl:for-each>


        </table>
    </xsl:template>
    <xsl:template name="css">
        <style>
            body {
                font-family: Arial;
                font-size: 11px;
            }
            
            table img {
                width: 40px;
            }
            
            th {
                background: #1e3356;
                color: #FFFFFF;
            }
            
            #tablaCancha {
                color: #eff4fc;
            }
            
            ol,
            ul
            {
                margin-top: 10px;
                margin-left: 0px;
            }
            
            #menu li
            {
                margin-left: 0px;
                display: inline;
                list-style-type: none;
                padding: 10px 50px;
            }
            
            .noticia {
                /* border: #000 solid 1px; */
                padding: 10px 5px;
                float: left;
                width: 338px;
            }
            
            .noticia img {
                width: 338px;
            }
            
            .noticiaDobleAncho {
                /* border: #000 solid 1px; */
                padding: 10px 5px;
                float: left;
                width: 690px;
            }
            
            .noticiaDobleAncho img {
                width: 690px;
            }
            
            .fechaNoticia {
                color: #A3A34B;
            }
            
            .comentariosNoticia {
                color: #A3A34B;
                padding-left: 20px;
            }
            
            .divPublicidad {
                /* border: #000 solid 1px; */
                padding: 10px 5px;
                float: right;
                width: 280px;
            }
            
            .divPublicidad img {
                width: 200px;
                }
                
              .pista{
              background-image: url(<xsl:value-of select="/partidoBaloncesto/pista/."/>);
             margin-top:20px;
             margin-bottom: 20px;
              }
        </style>
    </xsl:template>
</xsl:stylesheet>
