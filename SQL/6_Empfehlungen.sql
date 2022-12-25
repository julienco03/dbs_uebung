/* 
Geben Sie für einen Kunden Empfehlungen aus. Wenn ein Kunde K1 eine Wohnung W1 mit 5 Sterne
bewertet hat und ein Kunde K2 die Wohnung W1 ebenfalls mit 5 Sterne bewertet hat, dann sollen alle
weiteren Wohnungen, die K2 mit 5 Sternen bewertet hat als Empfehlung für K1 ausgegeben werden. 
*/

SELECT k.nachname, b1.fwname as Empfehlung, bw.sterne
FROM dbsys41.Kunde k, dbsys41.Buchung b1, dbsys41.Bewertung bw
WHERE k.kundenID = b1.kundenID
AND b1.bewertungsnr = bw.bewertungsnr
AND bw.sterne between 4 and 5
AND EXISTS (
    SELECT *
    FROM dbsys41.Buchung b2
    WHERE bw.sterne between 4 and 5
    AND b1.kundenID != b2.kundenID
);

/* === DEBUG === */
select b.kundenID, b.buchungsnr, b.fwname, bw.sterne
from Buchung b, Bewertung bw
where b.bewertungsnr = bw.bewertungsnr
and sterne in (4,5);