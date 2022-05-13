<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="/cine">
        <html>
            <head>
                
            </head>
            <body>
                <div style="width:1000px; margin: 0 auto;">
                    <h1><xsl:value-of select="@nombre"/></h1>
                    <img src="{titulo/imagen/.}" style="width: 500px;"></img>
                    <h2><xsl:value-of select="/cine/titulo/@nombre"/></h2>
                    <h3>Estreno: <xsl:value-of select="/cine/titulo/@estreno"/></h3>
                    <table border="1" style="width: 100%; text-align:center;">
                        <xsl:apply-templates select="/cine/sesiones"/>
                    </table>
                </div>
                
            </body>
        </html>
        
        
        
        
        
        
    </xsl:template>
    
    
    <xsl:template match="/cine/sesiones">
        <xsl:for-each select="sesion">
            <tr>
                <td>
                    <xsl:attribute name="style">
                        <xsl:if test="position() mod 2 = 1">
                            background-color: lightblue;
                        </xsl:if>   
                    </xsl:attribute>
                Sesion <xsl:value-of select="position()"/>
                - Hora: <xsl:value-of select="@hora"/>
                    <table border="1" style="width: 50%; align:center; margin:0 auto">
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i">1</xsl:with-param>
                        </xsl:call-template>
                    </table>
                </td>
            </tr>
        </xsl:for-each>
        
    </xsl:template>
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 4">
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
        <xsl:if test="$j &lt;= 4">
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
             
                  <xsl:choose>
                      <xsl:when test="ocupado[$x = @asiento and $y = @fila]">
                          <xsl:call-template name="imagen">
                          <xsl:with-param name="id">ocupado</xsl:with-param>
                          </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:call-template name="imagen">
                              <xsl:with-param name="id">libre</xsl:with-param>
                          </xsl:call-template>
                      </xsl:otherwise>
                  </xsl:choose>
              
          </td>
      
    </xsl:template>
    
   <xsl:template name="imagen">
     <xsl:param name="id"/>
       <xsl:for-each select="/cine/imagenes/imagen">
          <xsl:if test="$id = @id">
              <img src="{.}"></img>
          </xsl:if>
      </xsl:for-each>
   </xsl:template>
    
</xsl:stylesheet>