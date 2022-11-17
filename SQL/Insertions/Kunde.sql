create sequence kundenID increment by 1 start with 100000;

insert into dbsys41.Kunde values (
    kundenID.nextval, 'maxmüller@web.de', 'Hfajkbf2384#', 'Max', 'Müller',
    'DE12340000000056789000', 'Y', 200000
);
insert into dbsys41.Kunde values (
    kundenID.nextval, 'carstenstahl@gmx.de', 'Dfsnx?5254', 'Carsten', 'Stahl',
    'DE12345000000069789000', 'N', 200001
);
insert into dbsys41.Kunde values (
    kundenID.nextval, 'danielamaier@web.de', 'Jlcnakc123!', 'Daniela', 'Maier',
    'DE77380000000012345000', 'Y', 200002
);
insert into dbsys41.Kunde values (
    kundenID.nextval, 'manuelneuer@gmail.com', 'FcBayern123!', 'Manuel', 'Neuer',
    'DE66490000000035678900', 'N', 200003
);

COMMIT;




