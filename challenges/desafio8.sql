SELECT 
  A.nome "artista", AL.nome "album" 
FROM 
  artista A 
INNER JOIN 
  album AL ON AL.artista_id = A.artista_id 
WHERE A.nome = "Elis Regina";