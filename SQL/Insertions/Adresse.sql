create sequence adressID increment by 1 start with 200000;

insert into dbsys41.Adresse values(
    adressID.nextval, 'Überlingen', '88662', 'Parkstraße', '5', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Konstanz', '78462', 'Feldweg', '3', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'München', '80331', 'Schlossallee', '2A', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Stuttgart', '70173', 'Lindenstraße', '15', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Berlin', '10115', 'Theaterstraße', '38', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Hamburg', '20095', 'Altstädter Straße', '11', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Madrid', '28001', 'C. de los Jardines', '14', 'Spanien'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Barcelona', '08001', 'C. de Sevilla', '9', 'Spanien'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Barcelona', '08001', 'C. de Valencia', '17', 'Spanien'
);

COMMIT;