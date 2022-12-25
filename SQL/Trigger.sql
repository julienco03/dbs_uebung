CREATE SEQUENCE stornonr INCREMENT BY 1 START WITH 900000;

CREATE OR REPLACE TRIGGER BuchungStorniert
    BEFORE DELETE ON dbsys41.Buchung
    FOR EACH ROW
    BEGIN 
        INSERT INTO dbsys41.StornierteBuchung VALUES (
            stornonr.nextval,
            sysdate,
            :old.buchungsnr,
            :old.buchungsdatum,
            :old.startdatum,
            :old.enddatum,
            :old.kundenID,
            :old.fwname,
            :old.rechnungsnr,
            :old.bewertungsnr
        );
    END;
/

COMMIT;

/* === TEST === */
delete from dbsys41.Buchung where kundenID = '100260';
select * from dbsys41.Buchung;
select * from dbsys41.StornierteBuchung;
    