<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body style="margin: 2rem">
                <h1>Offene Rechnungen</h1>
                <xsl:for-each select="//Rechnung">
                    <xsl:if test="not (Zahlungseingang)">
                        <h2>Rechnung Nr. <xsl:value-of select="@ID"/></h2>
                        <p>Rechnungsdatum: <xsl:value-of select="Rechnungsdatum"/></p>
                        <p>Betrag: <xsl:value-of select="Betrag"/></p>

                        <xsl:variable name="BelegungsNr" select="BelegungsNr"/>
                        <xsl:variable name="Buchung" select="//Belegung[@ID = $BelegungsNr]"/>
                        <b>Buchung Nr. <xsl:value-of select="$Buchung/@ID"/></b>
                        <p>Buchungsdatum: <xsl:value-of select="$Buchung/Belegungsdatum"/></p>
                        <p>Dauer: <xsl:value-of select="$Buchung/von"/> - <xsl:value-of select="$Buchung/bis"/></p>

                        <xsl:variable name="Wohung" select="//Wohnung[@ID = $Buchung/WohnungsNr]"/>
                        <b>Wohnung Nr. <xsl:value-of select="$Wohung/@ID"/></b>
                        <p>Beschreibung: <xsl:value-of select="$Wohung/Beschreibung"/></p>

                        <xsl:variable name="Kunde" select="//Kunde[@ID = $Buchung/KundenNr]"/>
                        <b>Kunde Nr. <xsl:value-of select="$Kunde/@ID"/></b>
                        <p><xsl:value-of select="$Kunde/Vorname"/> <xsl:value-of select="$Kunde/Name"/></p>
                        <p>Email: <xsl:value-of select="$Kunde/Email"/></p>
                        <p>Telefon: <xsl:value-of select="$Kunde/Telefon"/></p>
                        <b>Adresse:</b>
                        <p><xsl:value-of select="$Kunde/Adresse/Straße"/></p>
                        <p><xsl:value-of select="$Kunde/Adresse/PLZ"/>, <xsl:value-of select="$Kunde/Adresse/Ort"/></p>
                        <p><xsl:value-of select="$Kunde/Adresse/Land"/></p>
                        <b>Bankverbindung</b>
                        <p>IBAN: <xsl:value-of select="$Kunde/Bankverbindung/IBAN"/></p>
                        <p>IBAN: <xsl:value-of select="$Kunde/Bankverbindung/BIC"/></p>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
