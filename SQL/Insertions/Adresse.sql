create sequence adressID increment by 1 start with 200000;

insert into dbsys41.Adresse values(
    adressID.nextval, 'M�nchen', '80331', 'Schlossallee', '2A', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Stuttgart', '70173', 'Lindenstra�e', '15', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Berlin', '10115', 'Theaterstra�e', '38', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Hamburg', '20095', 'Altst�dter Stra�e', '11', 'Deutschland'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Madrid', '28001', 'C. de los Jardines', '14', 'Spanien'
);
insert into dbsys41.Adresse values(
    adressID.nextval, 'Barcelona', '08001', 'C. de Sevilla', '9', 'Spanien'
);

COMMIT;