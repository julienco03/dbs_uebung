create sequence kundenID increment by 1 start with 100000;
insert into dbsys41.Kunde values (
    kundenID.nextval, "maxm�ller@web.de", "Fcbayern123#", "Max", "M�ller",
    "DE1234000000005678900", "Y", "123"
);
create sequence adressID increment by 1 start with 200000;
insert into dbsys41.Adresse values(
    adressID.nextval, "M�nchen", "80331", "Schlossallee", "2", "Deutschland"
);
