CREATE OR REPLACE VIEW Kundenstatistik(kundenID, anzahl_buchungen, anzahl_storno, summe_zahlungen)
AS
SELECT k.kundenID
        ,nvl(count(b.buchungsnr),0)
        ,nvl(count(s.kundenID),0)
        ,nvl(SUM(r.betragrechnung),0)
FROM dbsys41.Kunde k
LEFT JOIN dbsys41.Buchung b ON k.kundenID = b.kundenID
LEFT JOIN dbsys41.StornierteBuchung s ON b.buchungsnr = s.buchungsnr
LEFT JOIN dbsys41.Rechnung r ON b.rechnungsnr = r.rechnungsnr
GROUP BY k.kundenID
ORDER BY k.kundenID;

/* === TEST === */
SELECT * FROM Kundenstatistik;


