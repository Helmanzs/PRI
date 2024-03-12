<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html xsl:version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
            <head>
                <style>
                    .root {
                    font-size: 28;
                    }

                    .student {
                    display: flex;
                    flex-direction: column;
                    border: 1px solid black;
                    display: inline-block;
                    margin: 4px;
                    padding: 4px;
                    justify-content: space-around;
                    align-items: center;
                    }

                    .name {
                    font-weight: bold;
                    font-size: 20px;
                    text-align: center;
                    margin: 4px;
                    }

                    .student_number {
                    color: gray;
                    font-size: 14px;
                    text-align: center;
                    }

                    .element {
                    margin: 0px 4px 0px 4px;
                    }

                    .course {
                    list-style: none;
                    margin: 0;
                    padding: 0;
                    }

                    .completed {
                    color: green;
                    }
                </style>
            </head>
            <body>
                <hr />
                <h2 class="root">Students</h2>
                <xsl:for-each select="students/student">
                    <div class="student">
                        <div class="name element">
                            <xsl:value-of select="name" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="surname" />
                        </div>
                        <div class="student_number element"> (<xsl:value-of select="student_id" />) </div>
                        <hr />
                        <div class="email element">
                            <xsl:value-of select="email" />
                        </div>
                        <div class="faculty element"> Faculty: <xsl:value-of select="faculty" />
                        </div>
                        <div class="address element"> Address: <xsl:value-of select="address/street" />
                            - <xsl:value-of select="address/town" />
                        </div>
                        <hr />
                        <ol class="course">
                            <xsl:for-each select="courses/course">
                                <xsl:sort select="@completed" />
                                <li>
                                    <xsl:attribute name="class">
                                        <xsl:if test="@completed = '1'">completed </xsl:if>
                                    </xsl:attribute>
                                    <xsl:value-of select="." />
                                </li>
                            </xsl:for-each>
                        </ol>
                        <br />
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>