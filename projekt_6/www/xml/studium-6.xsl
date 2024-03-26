<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <section>
            <xsl:apply-templates select="studium/rocnik" />
        </section>
    </xsl:template>

    <xsl:template match="rocnik">
        <div class="my-8">
            <header>
                <h2 class="text-3xl font-semibold mb-4"> Ročník <xsl:value-of select="@cislo" />
                </h2>
            </header>
            <section>
                <xsl:apply-templates select="semestr[@nazev='zimni']" />
                <xsl:apply-templates select="semestr[@nazev='letni']" />
            </section>
        </div>
    </xsl:template>

    <xsl:template match="semestr[@nazev='zimni']">
        <h3 class="text-xl font-bold my-4">Zimní semestr</h3>
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
                <xsl:apply-templates select="predmet[kredity > 2]" />
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="semestr[@nazev='letni']">
        <h3 class="text-xl font-bold my-4">Letní semestr</h3>
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
                <xsl:apply-templates select="predmet[kredity > 2]" />
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="predmet">
        <tr class="text-center">
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="nazev" /> (<xsl:value-of select="@katedra" />/<xsl:value-of
                    select="@kod" />) </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="vyucujici/jmeno" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="vyucujici/telefon" />
            </td>
            <td class="border border-gray-300 px-4 py-2">
                <xsl:value-of select="vyucujici/email" />
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
        </tr>
    </xsl:template>

</xsl:stylesheet>