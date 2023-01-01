<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <ÜbersichtKunden>
            <xsl:for-each select="//Kunde">
                <Kunde>
                    <KundenInfo>
                        <KundenNr>
                            <xsl:apply-templates select="@ID"/>
                        </KundenNr>
                        <Vorname>
                            <xsl:apply-templates select="Vorname"/>
                        </Vorname>
                        <Nachname>
                            <xsl:apply-templates select="Name"/>
                        </Nachname>
                        <Geburtsdatum>
                            <xsl:apply-templates select="Geburtsdatum"/>
                        </Geburtsdatum>
                        <Ort>
                            <xsl:apply-templates select="Adresse/Ort"/>
                        </Ort>
                        <Landname>
                            <xsl:apply-templates select="Adresse/Land"/>
                        </Landname>
                    </KundenInfo>

                    <xsl:variable name="KundenNr" select="@ID"/>
                    <xsl:variable name="Belegungen" select='//Belegung[KundenNr= $KundenNr]'/>
                    <xsl:if test='$Belegungen[@Art="Buchung"]'>
                        <Buchungen>
                            <xsl:for-each select='$Belegungen[@Art="Buchung"]'>
                                <Buchung>
                                    <xsl:attribute name="Datum">
                                        <xsl:value-of select="Belegungsdatum"/>
                                    </xsl:attribute>
                                    <BuchungsNr>
                                        <xsl:apply-templates select="@ID"/>
                                    </BuchungsNr>
                                    <von>
                                        <xsl:apply-templates select="von"/>
                                    </von>
                                    <bis>
                                        <xsl:apply-templates select="bis"/>
                                    </bis>

                                    <xsl:variable name="Buchung" select="."/>
                                    <xsl:variable name="Wohnung" select="//Wohnung[@ID=$Buchung/WohnungsNr]"/>
                                    <Ferienwohnung>
                                        <FerienwohnungsNr>
                                            <xsl:apply-templates select="$Wohnung/@ID"/>
                                        </FerienwohnungsNr>
                                        <Beschreibung>
                                            <xsl:apply-templates select="$Wohnung/Beschreibung"/>
                                        </Beschreibung>
                                        <Größe>
                                            <xsl:apply-templates select="$Wohnung/Größe"/>
                                        </Größe>
                                        <Zimmerzahl>
                                            <xsl:apply-templates select="$Wohnung/ZimmerAnzahl"/>
                                        </Zimmerzahl>
                                    </Ferienwohnung>
                                    <xsl:variable name="Rechnung" select="//Rechnung[BelegungsNr=$Buchung/@ID]"/>
                                    <xsl:if test="$Rechnung">
                                        <Rechnung>
                                            <xsl:attribute name="Datum">
                                                <xsl:value-of select="$Rechnung/Rechnungsdatum"/>
                                            </xsl:attribute>
                                            <RechnungsNr>
                                                <xsl:apply-templates select="$Rechnung/@ID"/>
                                            </RechnungsNr>
                                            <Betrag>
                                                <xsl:apply-templates select="$Rechnung/Betrag"/>
                                            </Betrag>
                                            <xsl:if test="$Rechnung/Zahlungseingang">
                                                <Zahlungseingang>
                                                    <xsl:apply-templates select="$Rechnung/Zahlungseingang"/>
                                                </Zahlungseingang>
                                            </xsl:if>
                                        </Rechnung>
                                    </xsl:if>
                                </Buchung>
                            </xsl:for-each>
                        </Buchungen>
                    </xsl:if>
                    <xsl:if test='$Belegungen[@Art="Reservierung"]'>
                        <Reservierungen>
                            <xsl:for-each select='$Belegungen[@Art="Reservierung"]'>
                                <Reservierung>
                                    <xsl:attribute name="Datum">
                                        <xsl:value-of select="Belegungsdatum"/>
                                    </xsl:attribute>
                                    <ReservierungsNr>
                                        <xsl:apply-templates select="@ID"/>
                                    </ReservierungsNr>
                                    <von>
                                        <xsl:apply-templates select="von"/>
                                    </von>
                                    <bis>
                                        <xsl:apply-templates select="bis"/>
                                    </bis>

                                    <xsl:variable name="WohnungNr" select="WohnungsNr"/>
                                    <xsl:variable name="Wohnung" select="//Wohnung[@ID=$WohnungNr]"/>
                                    <Ferienwohnung>
                                        <FerienwohnungsNr>
                                            <xsl:apply-templates select="$Wohnung/@ID"/>
                                        </FerienwohnungsNr>
                                        <Beschreibung>
                                            <xsl:apply-templates select="$Wohnung/Beschreibung"/>
                                        </Beschreibung>
                                        <Größe>
                                            <xsl:apply-templates select="$Wohnung/Größe"/>
                                        </Größe>
                                        <Zimmerzahl>
                                            <xsl:apply-templates select="$Wohnung/ZimmerAnzahl"/>
                                        </Zimmerzahl>
                                    </Ferienwohnung>
                                </Reservierung>
                            </xsl:for-each>
                        </Reservierungen>
                    </xsl:if>
                </Kunde>
            </xsl:for-each>
        </ÜbersichtKunden>
    </xsl:template>
</xsl:stylesheet>
