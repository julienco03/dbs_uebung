/*
Angenommen, der Befehl aus Aufgabe 5h ist zu langsam. Definieren Sie Indexe,
die die Suche beschleunigen.
*/

CREATE INDEX Land_Index
  ON dbsys41.Adresse
    (landname ASC);
    
CREATE INDEX Ausstattung_Index
  ON dbsys41.AusgestattetMit
    (ausstattungsname ASC); 
    
COMMIT;   

