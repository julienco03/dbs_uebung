create sequence buchungsnr increment by 1 start with 300000;

insert into dbsys41.Buchung values (
    buchungsnr.nextval, date '2022-01-01', date '2022-08-01', date '2022-08-15', 100260,
    'Mediterranean Barcelona Apartments', 300000, 400000
);
insert into dbsys41.Buchung values (
    buchungsnr.nextval, date '2022-08-05', date '2022-09-20', date '2022-09-27', 100260,
    'Mediterranean Barcelona Apartments', 300001, 400002
);
insert into dbsys41.Buchung values (
    buchungsnr.nextval, date '2022-05-28', date '2022-07-10', date '2022-07-24', 100263,
    'Sensation Sagrada Familia', 300002, 400004
);
insert into dbsys41.Buchung values (
    buchungsnr.nextval, date '2022-01-29', date '2022-11-01', date '2022-11-15', 100261,
    'Plaza Mayor Suites Apartments', 300003, 400001
);
insert into dbsys41.Buchung values (
    buchungsnr.nextval, date '2022-04-07', date '2022-06-12', date '2022-06-26', 100262,
    'Plaza Mayor Suites Apartments', 300004, 400005
);


COMMIT;
