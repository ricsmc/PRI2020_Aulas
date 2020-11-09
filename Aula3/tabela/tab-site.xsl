<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <xsl:result-document hrefs="tabsite/index.html">
    <html>
      <head>
        <title>Tabela Periódica</title>
      </head>
      <body>

              <h3>Tabela Periódica dos Elementos</h3>
              <ul>
                <xsl:apply-templates mode="indice" select="//ATOM">
                  <xsl:sort select="SYMBOL"/>
                </xsl:apply-templates>
              </ul>
      </body>
    </html>
    </xsl:result-document>
    <xsl:apply-templates/>
    
  </xsl:template>
  
  <!-- TEMPLATE PARA INDICE ....................................................-->
  <xsl:template match="ATOM" mode="indice">
    <li>
      <a href="{generate-id()}.html"/>
      <xsl:value-of select="SYMBOL"/>
      -
      <xsl:value-of select="NAME"/>
      
    </li>
  </xsl:template>
  
  <!-- TEMPLATE PARA CONTEUDO ....................................................-->
  <xsl:template match="ATOM">
    <xsl:result-document hrefs="tabsite/{generate-id()}.html">
      <html>
        <head>
          <title><xsl:value-of select="NAME"/></title>
        </head>
        <body>
          <p><b>Nome: </b></p>
          <p><b>Peso atómico: </b><xsl:value-of select="ATOMIC_WEIGHT"/></p>
          <p><b>Número atómico: </b><xsl:value-of select="ATOMIC_NUMBER"/></p>
          <xsl:if test="HEAT_OF_FUSION">
            <p><b>Ponto de fusão: </b>
            <xsl:value-of select="HEAT_OF_FUSION"/>
            <xsl:value-of select="HEAT_OF_FUSION/@UNITS"/>
            </p>
          </xsl:if>
          <address>[<a href="index.html">Voltar ao índice</a>]</address>
        </body>
      </html>
    </xsl:result-document>


  </xsl:template>

</xsl:stylesheet>
