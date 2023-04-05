SELECT 
  M.nome "cancao", COUNT(H.musica_id) "reproducoes" 
FROM 
  musica M 
INNER JOIN
  historico_usuario H 
ON H.musica_id = M.musica_id
GROUP BY 
  cancao 
ORDER BY 
  reproducoes DESC, cancao ASC LIMIT 2;