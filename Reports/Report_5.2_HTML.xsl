<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body style="margin: 2rem">
                <h1>Offene Rechnungen</h1>
                <xsl:for-each select="//Rechnung">
                        <b>Rechnung</b>
                        <p>Nr.: <xsl:value-of select="@ID"/></p>
                        <p>Rechnungsdatum: <xsl:value-of select="Rechnungsdatum"/></p>
                        <p>Betrag: <xsl:value-of select="Betrag"/></p>

                        <xsl:variable name="Buchung" select="//Belegung[@ID = BelegungsNr]"/>
                        <b>Buchung:</b>
                        <p>Nr.: <xsl:value-of select="$Buchung/@ID"/></p>
                        <p>Buchungsdatum: <xsl:value-of select="$Buchung/Belegungsdarum"/></p>
                        <p>Dauer: <xsl:value-of select="$Buchung/von"/> - <xsl:value-of select="$Buchung/bis"/></p>

                        <xsl:variable name="Wohung" select="//Wohung[@ID = $Buchung/WohnungsNr]"/>
                        <b>Wohnung:</b>
                        <p>Nr.: <xsl:value-of select="$Wohung/@ID"/></p>
                        <p>Beschreibung: <xsl:value-of select="$Wohung/Beschreibung"/></p>

                        <xsl:variable name="Kunde" select="//Kunde[@ID = $Buchung/KundenNr]"/>
                        <b>Kunde:</b>
                        <p>Nr.: <xsl:value-of select="$Kunde/@ID"/></p>
                        <p><xsl:value-of select="$Kunde/Name"/>, <xsl:value-of select="$Kunde/Nachname"/></p>
                        <p>Email: <xsl:value-of select="$Kunde/Email"/></p>
                        <p>Telefon: <xsl:value-of select="$Kunde/Telefon"/></p>
                        <b>Adresse:</b>
                        <p>Straße: <xsl:value-of select="$Kunde/Adresse/Straße"/></p>
                        <p>PLZ: <xsl:value-of select="$Kunde/Adresse/PLZ"/></p>
                        <p>Ort: <xsl:value-of select="$Kunde/Adresse/Ort"/></p>
                        <p>Land: <xsl:value-of select="$Kunde/Adresse/Land"/></p>
                        <b>Bankverbindung</b>
                        <p>IBAN: <xsl:value-of select="$Kunde/Bankverbindung/IBAN"/></p>
                        <p>IBAN: <xsl:value-of select="$Kunde/Bankverbindung/BIC"/></p>

                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
