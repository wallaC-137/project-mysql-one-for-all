
SELECT 
  COUNT(musica_id) AS cancoes,
  COUNT(DISTINCT AR.artista_id) AS artistas,
  COUNT(DISTINCT AL.album_id) AS albuns
FROM 
  musica 
INNER JOIN 
  album AL ON musica.album_id = AL.album_id
INNER JOIN 
  artista AR ON AL.artista_id = AR.artista_id;
