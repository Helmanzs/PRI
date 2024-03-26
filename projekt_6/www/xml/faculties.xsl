<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:apply-templates select="faculties/faculty"/>
        <hr class="h-px bg-gray-200 border-0 dark:bg-gray-700" />
    </xsl:template>

    <xsl:template match="faculty">
        <hr class="my-4"/>
        <header class="name text-4xl font-bold">
            <xsl:value-of select="name"/>
        </header>
        <div class="dean text-sm italic text-gray-500">
            <xsl:value-of select="dean"/>
        </div>
        <div class="departments mt-8 space-y-8">
            <xsl:apply-templates select="departments/department"/>
        </div>
    </xsl:template>

    <xsl:template match="department">
        <div class="department-name text-2xl">
            <xsl:value-of select="name"/>
        </div>
        <div class="dean text-sm italic text-gray-500">
            <xsl:value-of select="head"/>
        </div>
        <h3 class="mt-4 text-lg font-bold">Employees</h3>
        <table class="w-full mt-4">
            <tr class="bg-gray-200">
                <th class="px-4 py-2">Name</th>
                <th class="px-4 py-2">Contact</th>
                <th class="px-4 py-2">Position</th>
                <th class="px-4 py-2">Titles</th>
            </tr>
            <xsl:apply-templates select="employees/employee"/>
        </table>
        <br/>
    </xsl:template>

    <xsl:template match="employee">
        <tr class="border-b">
            <td class="px-4 py-2">
                <xsl:value-of select="name"/>
            </td>
            <td class="px-4 py-2">
                <xsl:value-of select="contact"/>
            </td>
            <td class="px-4 py-2">
                <xsl:value-of select="position"/>
            </td>
            <td class="px-4 py-2">
                <xsl:for-each select="titles/title">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
