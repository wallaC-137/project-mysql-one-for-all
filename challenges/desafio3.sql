SELECT 
  p.nome "pessoa_usuaria", COUNT(h.usuario_id) "musicas_ouvidas", ROUND(SUM(m.duracao / 60), 2) "total_minutos"   
FROM 
  SpotifyClone.pessoa_usuaria p
INNER JOIN
  SpotifyClone.historico_usuario h ON h.usuario_id = p.pessoa_id
INNER JOIN 
  SpotifyClone.musica m ON m.musica_id = h.musica_id
GROUP BY p.nome ORDER BY pessoa_usuaria ASC;
