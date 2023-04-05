SELECT 
  P.nome "pessoa_usuaria", 
  IF(MAX(YEAR(H.data_historico)) >= 2021, "Ativa", "Inativa") "status_pessoa_usuaria"
FROM 
  pessoa_usuaria P
INNER JOIN 
  historico_usuario H ON H.usuario_id = P.pessoa_id 
  GROUP BY pessoa_usuaria
  ORDER BY pessoa_usuaria ASC;