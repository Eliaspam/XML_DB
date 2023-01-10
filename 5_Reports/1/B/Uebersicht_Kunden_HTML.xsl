<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html lang="DE">
        <head>
            <title>Übersicht Kunden</title>
            <meta charset="UTF-8"/>
        </head>
        <body style="margin: 2rem">
            <h1>Übersicht Kunden</h1>
            <xsl:for-each select="//Kunde">
                <div>
                <xsl:variable name="kundenID" select="@ID"/>
                <b>Kunde Nr. <xsl:value-of select="$kundenID"/></b>
                <p>Name: <span><xsl:value-of select="Vorname"/> <xsl:value-of select="Name"/> </span></p>
                <p>Geburtsdatum: <span><xsl:value-of select="Geburtsdatum"/></span></p>
                <p>Adresse: <span><xsl:value-of select="Adresse/Ort"/></span>, <span><xsl:value-of select="Adresse/Land"/></span></p>
                <xsl:if test='@ID= ../following-sibling::Belegungen/Belegung[@Art="Buchung"]/KundenNr'>
                    <b>Buchungen</b>
                    <xsl:for-each select='//Belegung[KundenNr=$kundenID and @Art="Buchung"]'>
                        <xsl:variable name="wohnungNr" select="WohnungsNr"/>
                        <xsl:variable name="Fewo" select="//Wohnung[@ID=$wohnungNr]"/>
                        <p>Nr:<xsl:value-of select="@ID"/></p>
                        <p>Belegungsdatum <xsl:value-of select="Belegungsdatum"/></p>
                        <p>Dauer: <xsl:value-of select="von"/> - <xsl:value-of select="bis"/></p>
                        <p>Ferienwohnung</p>
                        <p>Nr: <xsl:value-of select="$Fewo/@ID"/></p>
                        <p>Besch. <xsl:value-of select="$Fewo/Beschreibung"/></p>
                        <p>Größe <xsl:value-of select="$Fewo/Größe"/></p>
                        <p>Zimmer <xsl:value-of select="$Fewo/ZimmerAnzahl"/></p>
                        <xsl:if test='@ID = //Rechnung/BelegungsNr'>
                            <b>Rechnung:</b>
                            <p>Nr: <xsl:value-of select="//Rechnung[BelegungsNr = @ID]/@ID"/></p>
                            <p>Rechnungsdatum: <xsl:value-of select="//Rechnung[BelegungsNr = @ID]/Rechnungsdatum"/></p>
                            <p>Betrag: <xsl:value-of select="//Rechnung[BelegungsNr = @ID]/Betrag"/></p>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test='@ID= ../following-sibling::Belegungen/Belegung[@Art="Reservierung"]/KundenNr'>
                    <b>Reservierungen</b>
                    <xsl:for-each select='//Belegung[KundenNr=$kundenID and @Art="Reservierung"]'>
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
                </div>
            </xsl:for-each>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>
