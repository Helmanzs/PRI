<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="kodPredmetu" />

    <xsl:template match="/">
        <xsl:apply-templates select="//predmet[@kod=$kodPredmetu]" />
    </xsl:template>

    <xsl:template match="predmet">
        <div>
            <div class="text-lg font-semibold mb-2"> Kód: <span class="text-green-500">
                    <xsl:value-of select="@kod" />
                </span>
            </div>
            <hr />
            <div class="my-2"> Název: <span class="font-semibold">
                    <xsl:value-of select="nazev" />
                </span>
            </div>
            <div class="mb-2">
                <div class="font-semibold">Vyučující: </div>
                <div class="ml-2">
                    <div>
                        <span class="font-semibold">Jméno: </span>
                        <xsl:value-of select="vyucujici/jmeno" />
                    </div>
                    <div>
                        <span class="font-semibold">Telefon: </span>
                        <xsl:value-of select="vyucujici/telefon" />
                    </div>
                    <div>
                        <span class="font-semibold">Email: </span>
                        <xsl:value-of select="vyucujici/email" />
                    </div>
                </div>
            </div>
            <div class="mb-2"> Kredity: <span class="font-semibold">
                    <xsl:value-of select="kredity" />
                </span>
            </div>
            <div class="mb-2"> Status: <span class="font-semibold">
                    <xsl:value-of select="status" />
                </span>
            </div>
            <div> Zakončení: <span class="font-semibold">
                    <xsl:value-of select="zakonceni" />
                </span>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>