create table Kunde (
    kundenID    varchar2(6)  not null,
    mail        varchar2(50) not null unique,
    passwort    varchar2(20) not null,
    vorname     varchar2(20) not null,
    nachname    varchar2(20) not null,
    iban        varchar2(22) not null unique,
    newsletter  char(1) check (newsletter in ( 'Y', 'N' )) not null,
    adressID    varchar2(6) not null unique,
    constraint Kunde_pk primary key (kundenID),
    constraint Kunde_fk foreign key (adressID) references Adresse(adressID),
    constraint mail_format 
        check (regexp_like (mail, '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')),
    constraint iban_format
        check (regexp_like (iban, '^\w{2}\d{2} ?\d{4} ?\d{4} ?\d{4} ?\d{4} ?\d{2}$')),
    constraint passwort_format
        check (regexp_like (passwort, '^.{8,20}$'))
        /**check (regexp_like (passwort, '^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$'))*/
);
create table Adresse (
    adressID    varchar2(6)  not null,
    stadt       varchar2(20) not null,
    plz         varchar2(5)  not null,
    strasse     varchar2(20) not null,
    hausnr      varchar2(5)  not null,
    landname    varchar2(20) not null,
    constraint  Adresse_pk primary key (adressID),
    constraint  Adresse_fk foreign key (landname) references Land(landname),
    constraint plz_format
        check (regexp_like (plz, '^\d{5}$')) 
);
create table Land (
    landname    varchar2(20) not null,
    constraint Land_pk primary key (landname)
);
create table Ferienwohnung (
    fwname      varchar2(40) not null,
    zimmer      integer      not null,
    groesse     float        not null,
    preis       float        not null,
    adressID    varchar2(6) not null unique,
    constraint Ferienwohnung_pk primary key (fwname),
    constraint Ferienwohnung_fk foreign key (adressID) references Adresse(adressID),
    constraint zimmer_check check (zimmer > 0),
    constraint groesse_check check (groesse > 0),
    constraint preis_check check (preis > 0)
);
create table Bild (
    bildname    varchar2(20) not null ,
    fwname      varchar2(40) not null unique,
    constraint Bild_pk primary key (bildname),
    constraint Bild_fk foreign key (fwname) references Ferienwohnung(fwname),
    constraint bildname_format
        check (regexp_like (bildname, '^.*\.(jpg|jpeg|png)$'))
);
create table Ausstattung (
    ausstattungsname  varchar2(20) not null,
    constraint Ausstattung_pk primary key (ausstattungsname)
);
create table Attraktion (
    attraktionsname varchar2(20) not null,
    beschreibung    varchar2(250),
    constraint Attraktion_pk primary key (attraktionsname)
);
create table Buchung (
    buchungsnr      varchar2(6)  not null,
    buchungsdatum   date         not null,
    startdatum      date         not null,
    enddatum        date         not null,
    kundenID        varchar2(6)  not null,
    fwname          varchar2(40) not null,
    rechnungsnr     varchar2(6)  not null unique,
    bewertungsnr    varchar2(6)  not null unique,
    constraint Buchung_pk primary key (buchungsnr),
    constraint Buchung_fk1 foreign key (kundenID) references Kunde(kundenID),
    constraint Buchung_fk2 foreign key (fwname) references Ferienwohnung(fwname),
    constraint Buchung_fk3 foreign key (rechnungsnr) references Rechnung(rechnungsnr),
    constraint Buchung_fk4 foreign key (bewertungsnr) references Bewertung(bewertungsnr),
    constraint startdatum_check check (startdatum < enddatum),
    constraint enddatum_check check (startdatum < enddatum)
);
create table Rechnung (
    rechnungsnr     varchar2(6) not null,
    rechnungsdatum  date         not null,
    betragrechnung  float        not null,
    constraint Rechnnung primary key (rechnungsnr),
    constraint betragrechnung_check check (betragrechnung > 0)
);
create table Anzahlung (
    anzahlungsnr    varchar2(6) not null,
    zahlungsddatum  date         not null,
    betraganzahlung float        not null,
    rechnungsnr     varchar2(6) not null unique,
    constraint Anzahlung_pk primary key (anzahlungsnr),
    constraint Anzahlung_fk foreign key (rechnungsnr) references Rechnung(rechnungsnr),
    constraint betraganzahlung_check check (betraganzahlung > 0)
);
create table Bewertung (
    bewertungsnr    varchar2(6) not null,
    kommentar       varchar2(250),
    sterne          integer      not null,
    bewertungsdatum date         not null,
    constraint Bewertung_pk primary key (bewertungsnr),
    constraint sterne_check check (sterne between 1 and 5)
);
create table AusgestattetMit (
    fwname              varchar2(40) not null,
    ausstattungsname    varchar2(20) not null,
    constraint AusgestattetMit_pk primary key (fwname, ausstattungsname),
    constraint AusgestattetMit_fk1 foreign key (fwname)
        references Ferienwohnung(fwname) on delete cascade,
    constraint AusgestattetMit_fk2 foreign key (ausstattungsname)
        references Ausstattung(ausstattungsname) on delete cascade
);
create table NaheVon (
    attraktionsname     varchar2(20) not null,
    fwname              varchar2(40) not null,
    entfernung          float        not null,
    constraint NaheVon_pk primary key (attraktionsname, fwname),
    constraint NaheVon_fk1 foreign key (attraktionsname)
        references Attraktion(attraktionsname) on delete cascade,
    constraint NaheVon_fk2 foreign key (fwname)
        references Ferienwohnung(fwname) on delete cascade,
    constraint entfernung_check check (entfernung > 0)
);
create table StornierteBuchung (
    stornonr        varchar2(6)  not null,
    stornodatum     date         not null,
    buchungsnr      varchar2(6)  not null,
    buchungsdatum   date         not null,
    startdatum      date         not null,
    enddatum        date         not null,
    kundenID        varchar2(6)  not null,
    fwname          varchar2(40) not null,
    rechnungsnr     varchar2(6)  not null unique,
    bewertungsnr    varchar2(6)  not null unique,
    constraint StornierteBuchung_pk primary key (stornonr),
    constraint Buchungsnr_fk foreign key (buchungsnr) references Buchung(buchungsnr),
    constraint KundenID_fk foreign key (kundenID) references Kunde(kundenID),
    constraint Fwname_fk foreign key (fwname) references Ferienwohnung(fwname),
    constraint Rechnungsnr_fk foreign key (rechnungsnr) references Rechnung(rechnungsnr),
    constraint Bewertungsnr_fk foreign key (bewertungsnr) references Bewertung(bewertungsnr)
);

COMMIT;

/**
=== ZUM LÖSCHEN ALLER TABELLEN INKL. CONSTRAINTS ===
select 'drop table '||table_name||' cascade constraints;' from user_tables;
drop table ADRESSE cascade constraints;
drop table ANZAHLUNG cascade constraints;
drop table ATTRAKTION cascade constraints;
drop table AUSGESTATTETMIT cascade constraints;
drop table AUSSTATTUNG cascade constraints;
drop table BEWERTUNG cascade constraints;
drop table BILD cascade constraints;
drop table BUCHUNG cascade constraints;
drop table FERIENWOHNUNG cascade constraints;
drop table KUNDE cascade constraints;
drop table LAND cascade constraints;
drop table NAHEVON cascade constraints;
drop table RECHNUNG cascade constraints;
drop table STORNIERTEBUCHUNG cascade constraints;
COMMIT;
*/





































