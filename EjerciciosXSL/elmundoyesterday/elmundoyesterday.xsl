<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/periodico">
        <html>
            <head>
                <title>
                    <xsl:value-of select="@nombre"/>
                </title>
                <xsl:call-template name="css"/>
            </head>
            <body>
                <div>
                    <xsl:attribute name="style">width: 1000px; margin: 0 auto;</xsl:attribute>
                    <div>
                        <xsl:attribute name="style">width: 1000px;</xsl:attribute>
                        <img src="{@logo}"/>
                    </div>
                    <div>
                        <xsl:attribute name="id">menu</xsl:attribute>
                        <xsl:attribute name="style">width: 1000px; margin: 0px; padding:
                            0px;</xsl:attribute>
                        <ul>
                           <xsl:call-template name="menu"/>
                        </ul>
                    </div>
                    <div>
                      <xsl:call-template name="noticias"/>
                        
                    </div>
                    <div><xsl:call-template name="anuncios"></xsl:call-template>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="menu">
        <xsl:for-each select="menu/enlace">
            <li>
                <xsl:attribute name="style">
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 1"> background:
                            #DDE640; </xsl:when>
                        <xsl:otherwise> background: #F27E2B; </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <a href="@href">
                    <xsl:value-of select="."/>
                </a>
            </li>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="noticias">
        <xsl:attribute name="style">width: 700px; float: left;</xsl:attribute>
        
        <xsl:for-each select="/periodico/noticias/noticia">
            <div>
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="@dobleAncho = 's'">
                            noticiaDobleAncho
                        </xsl:when>
                        <xsl:otherwise>
                            noticia
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <h2><xsl:value-of select="titular"/></h2>
                <h4><xsl:value-of select="subtitular"/></h4>
                <img src="{@imagen}"></img>
            </div>
        </xsl:for-each>
      
    </xsl:template>
    <xsl:template name="anuncios">
        <div>
            <xsl:attribute name="style">width: 295px; float: right;</xsl:attribute>
            <xsl:for-each select="/periodico/publicidad/anuncio">
                <div>
                    <xsl:attribute name="class">divPublicidad</xsl:attribute>
                    <img src="{@imagen}"></img> 
                </div>
            </xsl:for-each>
        </div> 
    </xsl:template>
    <xsl:template name="css">
        <style>
            body {
                font-family: Arial;
                font-size: 12px;
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
            }
            
            .divPublicidad img {
                width: 200px;
            }</style>
    </xsl:template>
</xsl:stylesheet>
