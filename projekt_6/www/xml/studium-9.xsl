<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:variable name="maxCredits">
            <xsl:for-each select="/studium/rocnik/semestr">
                <xsl:sort select="sum(predmet/kredity)" data-type="number" order="descending" />
                <xsl:if test="position()=1">
                    <xsl:value-of select="sum(predmet/kredity)" />
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>

        <xsl:for-each select="/studium/rocnik/semestr">
            <xsl:if test="sum(predmet/kredity) = $maxCredits">
                <xsl:text>
                    Seznam předmětů pro semestr s nejvyšším celkovým počtem kreditů: 
                </xsl:text>
                <span> ( <xsl:value-of select="../@cislo" />. ročník, <xsl:value-of
                        select="@nazev" />) </span>
                <xsl:apply-templates select="predmet" />

            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="predmet">
        <div>
            <xsl:value-of select="nazev" />
        </div>
    </xsl:template>

</xsl:stylesheet>