SELECT 
  COUNT(H.usuario_id) "musicas_no_historico" 
FROM 
  pessoa_usuaria PU
INNER JOIN 
  historico_usuario H 
ON
  H.usuario_id = PU.pessoa_id
WHERE
  PU.nome = "Barbara Liskov";