<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:err="http://www.w3.org/2005/xqt-errors"
                exclude-result-prefixes="array fn map math xhtml xs err" version="3.0">

    <xsl:output method="html" version="4.01" doctype-public="-//W3C//DTD HTML 4.01 strictl//EN //www.w3.org/TR/html4/strict.dtd" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="DE">
            <head>
                <title>Offene Rechnungen</title>
                <meta charset="UTF-8"/>
            </head>
            <body style="margin: 2rem">
                <h1>Offene Rechnungen</h1>
                <xsl:for-each select="//Rechnung">
                    <xsl:if test="not (Zahlungseingang)">
                        <div>
                        <h2>Rechnung Nr. <xsl:value-of select="@ID"/></h2>
                        <p>Rechnungsdatum: <xsl:value-of select="Rechnungsdatum"/></p>
                        <p>Betrag: <xsl:value-of select="Betrag"/></p>

                        <xsl:variable name="BelegungsNr" select="BelegungsNr"/>
                        <xsl:variable name="Buchung" select="//Belegung[@ID = $BelegungsNr]"/>
                        <h4>Buchung Nr. <xsl:value-of select="$Buchung/@ID"/></h4>
                        <p>Buchungsdatum: <xsl:value-of select="$Buchung/Belegungsdatum"/></p>
                        <p>Dauer: <xsl:value-of select="$Buchung/von"/> - <xsl:value-of select="$Buchung/bis"/></p>

                        <xsl:variable name="Wohung" select="//Wohnung[@ID = $Buchung/WohnungsNr]"/>
                        <h4>Wohnung Nr. <xsl:value-of select="$Wohung/@ID"/></h4>
                        <p>Beschreibung: <xsl:value-of select="$Wohung/Beschreibung"/></p>

                        <xsl:variable name="Kunde" select="//Kunde[@ID = $Buchung/KundenNr]"/>
                        <h4>Kunde Nr. <xsl:value-of select="$Kunde/@ID"/></h4>
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
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
