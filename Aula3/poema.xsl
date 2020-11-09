<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Poema de Álvaro de Campos</title>
            </head>
            <body>
                <h2><xsl:value-of select="poema/titulo"/></h2>
                <h3><xsl:value-of select="poema/autor"/></h3>
                <h4><xsl:value-of select="poema/data"/></h4>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>