<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <OffeneRechnungen>
            <xsl:for-each select="//Rechnung">
            <xsl:if test="not (Zahlungseingang)">
                <Rechnung>
                    <RechnungsNr>
                        <xsl:value-of select="@ID"/>
                    </RechnungsNr>
                    <Rechnungsdatum>
                        <xsl:apply-templates select="Rechnungsdatum"/>
                    </Rechnungsdatum>
                    <Rechnungsbetrag>
                        <xsl:apply-templates select="Betrag"/>
                    </Rechnungsbetrag>

                    <xsl:variable name="BelegungsNr" select="BelegungsNr"/>
                    <xsl:variable name="Buchung" select="//Belegung[@ID = $BelegungsNr]"/>
                    <Buchung>
                        <xsl:attribute name="Datum">
                            <xsl:value-of select="$Buchung/Belegungsdatum"/>
                        </xsl:attribute>
                        <BuchungsNr>
                            <xsl:value-of select="$Buchung/@ID"/>
                        </BuchungsNr>
                        <von>
                            <xsl:value-of select="$Buchung/von"/>
                        </von>
                        <bis>
                            <xsl:value-of select="$Buchung/bis"/>
                        </bis>
                        <xsl:variable name="Wohnung" select="//Wohnung[@ID = $Buchung/WohnungsNr]"/>
                        <Ferienwohnung>
                            <FerienwohnungsNr>
                                <xsl:value-of select="$Wohnung/@ID"/>
                            </FerienwohnungsNr>
                            <Beschreibung>
                                <xsl:value-of select="$Wohnung/Beschreibung"/>
                            </Beschreibung>
                        </Ferienwohnung>
                    </Buchung>

                    <xsl:variable name="Kunde" select="//Kunde[@ID = $Buchung/KundenNr]"/>
                    <Kunde>
                        <KundenNr>
                            <xsl:value-of select="$Kunde/@ID"/>
                        </KundenNr>
                        <Vorname>
                            <xsl:value-of select="$Kunde/Vorname"/>
                        </Vorname>
                        <Nachname>
                            <xsl:value-of select="$Kunde/Name"/>
                        </Nachname>
                        <Email>
                            <xsl:value-of select="$Kunde/Email"/>
                        </Email>
                        <Telefon>
                            <xsl:value-of select="$Kunde/Telefon"/>
                        </Telefon>
                        <Adresse>
                            <Straße>
                                <xsl:value-of select="$Kunde/Adresse/Straße"/>
                            </Straße>
                            <PLZ>
                                <xsl:value-of select="$Kunde/Adresse/PLZ"/>
                            </PLZ>
                            <Ort>
                                <xsl:value-of select="$Kunde/Adresse/Ort"/>
                            </Ort>
                            <Land>
                                <xsl:value-of select="$Kunde/Adresse/Land"/>
                            </Land>
                        </Adresse>
                        <Bankverbindung>
                            <IBAN>
                                <xsl:value-of select="$Kunde/Bankverbindung/IBAN"/>
                            </IBAN>
                            <BIC>
                                <xsl:value-of select="$Kunde/Bankverbindung/BIC"/>
                            </BIC>
                        </Bankverbindung>
                    </Kunde>

                </Rechnung>
            </xsl:if>
            </xsl:for-each>
        </OffeneRechnungen>
    </xsl:template>
</xsl:stylesheet>
