<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <select name="kod_predmetu"
            class="flex-grow px-3 py-2 text-gray-700 border shadow focus:outline-none">
            <xsl:for-each select="//predmet">
                <option value="{@kod}">
                    <xsl:value-of select="@kod" /> - <xsl:value-of select="nazev" />
                </option>
            </xsl:for-each>
        </select>
    </xsl:template>

</xsl:stylesheet>