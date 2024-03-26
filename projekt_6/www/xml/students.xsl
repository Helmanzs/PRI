<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <hr class="my-4" />
        <h2 class="text-2xl font-bold">Students</h2>
        <xsl:for-each select="students/student">
            <div class="border border-black rounded-lg p-4 m-4">
                <div class="font-bold text-lg">
                    <xsl:value-of select="concat(name, ' ', surname)" />
                </div>
                <div class="text-sm text-gray-600">
                    (                    
                    <xsl:value-of select="student_id" />
                    )
                </div>
                <hr class="my-4" />
                <div class="text-base">
                    <xsl:value-of select="email" />
                </div>
                <div class="text-sm text-gray-600">
                            Faculty: <xsl:value-of select="faculty" />
                </div>
                <div class="text-sm text-gray-600">
                            Address: <xsl:value-of select="concat(address/street, ' - ', address/town)" />
                </div>
                <hr class="my-4" />
                <ol class="list-disc pl-4">
                    <xsl:for-each select="courses/course">
                        <xsl:sort select="@completed = '1'"/>
                        <li>
                            <xsl:attribute name="class">
                                <xsl:if test="@completed = '1'">text-green-600</xsl:if>
                            </xsl:attribute>
                            <xsl:value-of select="." />
                        </li>
                    </xsl:for-each>
                </ol>
                <br />
            </div>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
