<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <body style="margin:2.1rem">
            <h1>Übersicht Kunden</h1>
            <xsl:for-each select="//Kunde">
                <xsl:variable name="kundenID" select="@ID"/>
                <b>Kunde Nr. <xsl:value-of select="$kundenID"/></b>
                <p>Name: <span><xsl:value-of select="Vorname"/> <xsl:value-of select="Name"/> </span></p>
                <p>Geburtsdatum: <span><xsl:value-of select="Geburtsdatum"/></span></p>
                <p>Adresse: <span><xsl:value-of select="Adresse/Ort"/></span>, <span><xsl:value-of select="Adresse/Land"/></span></p>
                <xsl:if test="@ID= ../following-sibling::Belegungen/Belegung/KundenNr">
                    <b>Buchungen</b>
                    <xsl:for-each select='//Belegung[KundenNr=$kundenID and @Art="Buchung"]'>
                        <p>Nr:<xsl:value-of select="@ID"/></p>
                        <p>Belegungsdatum <xsl:value-of select="Belegungsdatum"/></p>
                        <p>Dauer: <xsl:value-of select="von"/> - <xsl:value-of select="bis"/></p>
                        <xsl:variable name="wohnungNr" select="WohnungsNr"/>
                        <p>Ferienwohnung</p>
                        <xsl:variable name="Fewo" select="//Wohnung[@ID=$wohnungNr]"/>
                        <p>Nr: <xsl:value-of select="$Fewo/@ID"/></p>
                        <p>Besch. <xsl:value-of select="$Fewo/Beschreibung"/></p>
                        <p>Größe <xsl:value-of select="$Fewo/Größe"/></p>
                        <p>Zimmer <xsl:value-of select="$Fewo/ZimmerAnzahl"/></p>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
