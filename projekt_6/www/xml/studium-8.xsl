<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <section>
            <xsl:apply-templates select="studium/rocnik[1]/semestr[1]" />
        </section>
    </xsl:template>

    <xsl:template match="semestr">
        <table class="w-full border-collapse border border-gray-300 table-fixed">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border border-gray-300 px-4 py-2">Název předmětu</th>
                    <th class="border border-gray-300 px-4 py-2">Vyučující</th>
                    <th class="border border-gray-300 px-4 py-2">Telefon</th>
                    <th class="border border-gray-300 px-4 py-2">Email</th>
                    <th class="border border-gray-300 px-4 py-2" style="width:6%">Kredity</th>
                    <th class="border border-gray-300 px-4 py-2" style="width:6%">Status</th>
                    <th class="border border-gray-300 px-4 py-2" style="width:10%">Zakončení</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="predmet" />
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="predmet">
        <tr class="">
            <xsl:variable name="katedra">
                <xsl:choose>
                    <xsl:when test="@katedra = 'KI'">bg-green-100</xsl:when>
                    <xsl:when test="@katedra = 'KBI'">bg-red-100</xsl:when>
                    <xsl:when test="@katedra = 'CNB'">bg-white-100</xsl:when>
                    <xsl:when test="@katedra = 'KTV'">bg-blue-100</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:attribute name="class">
                <xsl:text>text-center border border-gray-300 px-4 py-2 </xsl:text>
                <xsl:value-of select="$katedra" />
            </xsl:attribute>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" nazev" /> (<xsl:value-of select=" @katedra" />/<xsl:value-of
                    select=" @kod" />) </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" vyucujici/ jmeno" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" vyucujici/ telefon" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" vyucujici/ email" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" kredity" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" status" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select=" zakonceni" />
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>