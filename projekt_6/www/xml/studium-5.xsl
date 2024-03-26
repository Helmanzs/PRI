<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">

        <h2 class="text-2xl font-bold mb-4">Seznam předmětů v posledním semestru</h2>
        <table class="w-full border-collapse border border-gray-300">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border border-gray-300 px-4 py-2">Kód</th>
                    <th class="border border-gray-300 px-4 py-2">Název</th>
                    <th class="border border-gray-300 px-4 py-2">Kredity</th>
                    <th class="border border-gray-300 px-4 py-2">Status</th>
                    <th class="border border-gray-300 px-4 py-2">Zakončení</th>
                    <th class="border border-gray-300 px-4 py-2">Vyučující</th>
                    <th class="border border-gray-300 px-4 py-2">Telefon</th>
                    <th class="border border-gray-300 px-4 py-2">Email</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates
                    select="//rocnik[@cislo='3']/semestr[@nazev='letni']/predmet">
                    <xsl:sort select="@kod" order="ascending" />
                </xsl:apply-templates>
            </tbody>
        </table>
        <p class="mt-4">
            <strong>Celkem kreditních bodů = </strong>
            <xsl:value-of
                select="sum(//rocnik[@cislo='3']/semestr[@nazev='letni']/predmet/kredity)" />
        </p>
    </xsl:template>

    <xsl:template match="predmet">
        <tr>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="@kod" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="nazev" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="kredity" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="status" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="zakonceni" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="vyucujici/jmeno" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="vyucujici/telefon" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="vyucujici/email" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>