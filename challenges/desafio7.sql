SELECT 
  A.nome "artista", AL.nome "album", COUNT(PS.pessoa_id) "pessoas_seguidoras" 
FROM
  artista A 
INNER JOIN
  seguindo PS ON PS.artista_id = A.artista_id
INNER JOIN 
  album AL ON AL.artista_id = A.artista_id
  GROUP BY artista, album
  ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;