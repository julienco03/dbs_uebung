create sequence buchungsnr increment by 1 start with 300000;

insert into dbsys41.Buchung values (
    buchungsnr.nextval, 2022-01-01, 2022-08-01, 2022-08-15, 100260,
    'Mediterranean Barcelona Apartments', rechnungsnr, bewertungsnr
);


COMMIT;
