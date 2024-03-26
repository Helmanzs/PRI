<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <!-- Template for matching the root node -->
    <xsl:template match="/">
        <section>
            <xsl:for-each select="studium/rocnik/semestr">
                <xsl:sort select="sum(predmet/kredity)" data-type="number" order="descending" />
                <xsl:variable name="totalCredits" select="sum(predmet/kredity)" />
                <div>
                    <xsl:value-of
                        select="concat('Ročník ', ../@cislo, ' - ', @nazev, ' - ', $totalCredits, ' kreditů')" />
                </div>
            </xsl:for-each>
        </section>
    </xsl:template>

</xsl:stylesheet>