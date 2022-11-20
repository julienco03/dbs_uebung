create sequence bewertungsnr increment by 1 start with 400000;

insert into dbsys41.Bewertung (bewertungsnr, kommentar, sterne, bewertungsdatum) values(
    bewertungsnr.nextval, 'Tolle Ferienwohnung und sehr gute Lage!', 5, date '2022-08-23'
);
insert into dbsys41.Bewertung (bewertungsnr, kommentar, sterne, bewertungsdatum) values(
    bewertungsnr.nextval, 'Die Wohnung war total verdreckt, nie wieder ...', 1, date '2022-11-25'
);
insert into dbsys41.Bewertung (bewertungsnr, kommentar, sterne, bewertungsdatum) values(
    bewertungsnr.nextval, 'Wir sind mit der Ferienwohnung sehr zufrieden gewesen, jedoch hat uns nachts der Lärm gestört.', 3, date '2022-09-16'
);
insert into dbsys41.Bewertung (bewertungsnr, kommentar, sterne, bewertungsdatum) values(
    bewertungsnr.nextval, 'Sauberkeit und Lage waren top, Preis könnte aber etwas niedriger sein.', 4, date '2022-07-30'
);
insert into dbsys41.Bewertung (bewertungsnr, kommentar, sterne, bewertungsdatum) values(
    bewertungsnr.nextval, 'Einfach nur großartig!', 5, date '2022-08-04'
);


COMMIT;
