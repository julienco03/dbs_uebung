/** Wie viele Ferienwohnungen wurden noch nie gebucht? */
select count(*)
from dbsys41.Ferienwohnung
where fwname not in (select fwname from dbsys41.Buchung);


/** Welche Kunden haben eine Ferienwohnung bereits mehrmals gebucht? */
select distinct b1.kundenID
from dbsys41.Buchung b1
where exists (
    select kundenID
    from dbsys41.Buchung b2
    where b1.kundenID = b2.kundenID
    and b1.buchungsnr != b2.buchungsnr
    and b1.fwname = b2.fwname
);

-- ALTERNATIVE --
select kundenID, count(*) as Buchungen
from dbsys41.Buchung
group by kundenID
having count(*) >= 2;


/** Welche Ferienwohnungen in Spanien haben durchschnittlich mehr als 4 Sterne erhalten? */
select b.fwname, avg(bw.sterne) as Durchschnittliche_Sterne
from dbsys41.Buchung b, dbsys41.Adresse a, dbsys41.Ferienwohnung f, dbsys41.Bewertung bw
where b.fwname = f.fwname
and f.adressID = a.adressID
and b.bewertungsnr = bw.bewertungsnr
and a.landname = 'Spanien'
group by b.fwname
having avg(sterne) > 4;

-- DEBUG --
select fwname, sterne
from dbsys41.Buchung b, dbsys41.Bewertung bw
where b.bewertungsnr = bw.bewertungsnr;


/** Welche Ferienwohnung hat die meisten Ausstattungen? Falls mehrere Ferienwohnungen das
    Maximum an Ausstattungen erreichen, sollen diese alle ausgegeben werden. */
with MEISTE_AUSSTATTUNGEN as 
    (select f.fwname, count(a.ausstattungsname) as anzahl
    from dbsys41.Ferienwohnung f, dbsys41.AusgestattetMit a
    where f.fwname = a.fwname
    group by f.fwname)
select fwname
from MEISTE_AUSSTATTUNGEN m
where m.anzahl = (
    select max(anzahl) from MEISTE_AUSSTATTUNGEN
);

-- DEBUG --
select f.fwname, count(a.ausstattungsname) as anzahl
from dbsys41.Ferienwohnung f, dbsys41.AusgestattetMit a
where f.fwname = a.fwname
group by f.fwname;

    

/** Wie viele Reservierungen gibt es für die einzelnen Länder? Länder, in denen keine Reservierungen
    existieren, sollen mit der Anzahl 0 ebenfalls aufgeführt werden. Das Ergebnis soll nach der Anzahl
    Reservierungen absteigend sortiert werden. */
select a.landname, nvl(count(b.buchungsnr), 0) as Anzahl_Reservierungen
from dbsys41.Adresse a
left join Ferienwohnung f on a.adressID = f.adressID
left join Buchung b on f.fwname = b.fwname
group by a.landname
order by nvl(count(b.buchungsnr), 0) desc;


/** Wie viele Ferienwohnungen sind pro Stadtnamen gespeichert? */
select a.stadt, count(*) as Anzahl_Ferienwohnungen
from dbsys41.Ferienwohnung f, dbsys41.Adresse a
where f.adressID = a.adressID
group by stadt;

/** Untersuchen Sie, ob es Doppelbuchungen gibt. Geben Sie dazu alle Ferienwohnungen aus, für die es
    zwei Buchungen gibt, die die Ferienwohnung am gleichen Tag reservieren. Hinweis: es ist kein
    Problem, wenn ein Kunde die Ferienwohnung verlässt, und am gleichen Tag ein anderer Kunde
    einzieht. */
select b.fwname
from dbsys41.Buchung b, dbsys41.Buchung b2
where b.buchungsnr != b2.buchungsnr
and b.fwname = b2.fwname
and (
    b.enddatum = b2.startdatum
    or b.startdatum between b2.startdatum and b2.enddatum
    or b2.startdatum between b.startdatum and b.enddatum);
    

/** Welche Ferienwohnungen mit Sauna sind in Spanien in der Zeit vom 1.11.2022 – 21.11.2022 noch
    frei? Geben Sie den Ferienwohnungs-Namen und deren durchschnittliche Bewertung an.
    Ferienwohnungen mit guten Bewertungen sollen zuerst angezeigt werden. Ferienwohnungen ohne
    Bewertungen sollen am Ende ausgegeben werden. */
select b.fwname, avg(bw.sterne) as Durchschnitt_Sterne
from dbsys41.Buchung b, dbsys41.Ferienwohnung f, dbsys41.AusgestattetMit am, dbsys41.Adresse a, dbsys41.Bewertung bw
where b.fwname = am.fwname
and b.fwname = f.fwname
and f.adressID = a.adressID
and b.bewertungsnr = bw.bewertungsnr
and a.landname = 'Spanien'
and am.ausstattungsname = 'Sauna'
and not exists (
    select b2.buchungsnr
    from dbsys41.Buchung b2
    where b2.startdatum <= to_date('01.11.22', 'DD.MM.YY')
    and b2.enddatum >= to_date('21.11.22', 'DD.MM.YY')
)
group by b.fwname
order by avg(bw.sterne) desc;

-- DEBUG --
select * from dbsys41.AusgestattetMit where ausstattungsname = 'Sauna';


/** Test Abfragen vom Kundenaccount*/
select * from dbsys41.Land;
select * from dbsys41.Adresse;
select * from dbsys41.Kunde;
select * from dbsys41.Ferienwohnung;
select * from dbsys41.Ausstattung;
select * from dbsys41.Attraktion;
select * from dbsys41.Bewertung;
select * from dbsys41.Rechnung;
select * from dbsys41.Buchung;
select * from dbsys41.NaheVon;
select * from dbsys41.AusgestattetMit;
