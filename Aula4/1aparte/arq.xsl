<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:result-document href="site/index.html">
            <html>
                <head>
                    <title>Arqueossítios do NW português</title>
                </head>
                <body>
                    <h3>Índice</h3>
                    <ul>
                        <xsl:apply-templates select="//ARQELEM[not(CONCEL = preceding::CONCEL)]">
                            <xsl:sort select="normalize-space(CONCEL)"/>
                        </xsl:apply-templates>
                    </ul>
                </body>
            </html>
                
        </xsl:result-document>
        <xsl:apply-templates select="//ARQELEM" mode="individual"/>
        
    </xsl:template>
    
    <!-- TEMPLATE DO INDICE DE CONCELHOS -->
    <xsl:template match="ARQELEM">
        <xsl:variable name="c" select="CONCEL"/>
        <li>
            <xsl:value-of select="CONCEL"/>
            <ul>
                <xsl:apply-templates select="//ARQELEM[CONCEL=$c]" mode="subindice">
                    <xsl:sort select="IDENTI"/>
                </xsl:apply-templates>
            </ul>
        </li>
    </xsl:template>
    
    <!-- TEMPLATE DO INDICE DE INDENTI -->
    <xsl:template match="ARQELEM" mode="subindice">
        <li>
            <a href="{generate-id()}.html">
                <xsl:value-of select="IDENTI"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="ARQELEM" mode="individual">
        <xsl:result-document href="site/{generate-id()}.html">
            <html>
                <head>
                    <title><xsl:value-of select="IDENTI"/></title>
                </head>
                <body>
                    <dl> 
                        <xsl:for-each select="./*">
                            <dt><xsl:value-of select="name(.)"/></dt>
                            <dd><xsl:value-of select="."/></dd>
                        </xsl:for-each>
                    </dl>
                    <address>
                        [
                        <a href="index.html">VOLTAR AO ÍNDICE</a>
                        ]
                    </address>
                   
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>