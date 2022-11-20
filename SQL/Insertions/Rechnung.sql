create sequence rechnungsnr increment by 1 start with 300000;

insert into dbsys41.Rechnung values(
    rechnungsnr.nextval, date '2022-07-18', 1725.0
);
insert into dbsys41.Rechnung values(
    rechnungsnr.nextval, date '2022-08-08', 805.0
);
insert into dbsys41.Rechnung values(
    rechnungsnr.nextval, date '2022-06-05', 3486.0
);
insert into dbsys41.Rechnung values(
    rechnungsnr.nextval, date '2022-09-29', 1218.0
);
insert into dbsys41.Rechnung values(
    rechnungsnr.nextval, date '2022-05-31', 1218.0
);

COMMIT;