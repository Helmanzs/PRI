<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <header>
            <h1>Seznam všech předmětů:</h1>
        </header>
        <section>
            <ol>
                <xsl:apply-templates select="//predmet" />
            </ol>
        </section>
    </xsl:template>

    <xsl:template match="predmet">
        <li> (<xsl:value-of select="@katedra" />/<xsl:value-of
                select="@kod" />) - <xsl:value-of select="nazev" />
        </li>
    </xsl:template>
</xsl:stylesheet>