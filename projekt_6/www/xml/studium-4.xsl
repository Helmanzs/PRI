<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <div class="container mx-auto">
            <h2 class="text-2xl font-bold mb-4">AMAT Data</h2>
            <table class="border-collapse border border-gray-300 table-fixed">
                <tbody>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 bg-gray-200">Kód</td>
                        <td class="border border-gray-300 px-4 py-2">
                            <xsl:value-of select="//predmet[@kod='AMAT']/@kod" />
                        </td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 bg-gray-200">Název</td>
                        <td class="border border-gray-300 px-4 py-2">
                            <xsl:value-of select="//predmet[@kod='AMAT']/nazev" />
                        </td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 bg-gray-200">Katedra</td>
                        <td class="border border-gray-300 px-4 py-2">
                            <xsl:value-of select="//predmet[@kod='AMAT']/@katedra" />
                        </td>
                    </tr>
                    <xsl:apply-templates select="//predmet[@kod='AMAT']/vyucujici" />
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 bg-gray-200">Kredity</td>
                        <td class="border border-gray-300 px-4 py-2">
                            <xsl:value-of select="//predmet[@kod='AMAT']/kredity" />
                        </td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 bg-gray-200">Status</td>
                        <td class="border border-gray-300 px-4 py-2">
                            <xsl:value-of select="//predmet[@kod='AMAT']/status" />
                        </td>
                    </tr>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 bg-gray-200">Zakončení</td>
                        <td class="border border-gray-300 px-4 py-2">
                            <xsl:value-of select="//predmet[@kod='AMAT']/zakonceni" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="vyucujici">
        <tr>
            <td class="border border-gray-300 px-4 py-2 bg-gray-200">Vyučující</td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="jmeno" />
            </td>
        </tr>
        <tr>
            <td class="border border-gray-300 px-4 py-2 bg-gray-200">Telefon</td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="telefon" />
            </td>
        </tr>
        <tr>
            <td class="border border-gray-300 px-4 py-2 bg-gray-200">Email</td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="email" />
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>