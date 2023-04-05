SELECT 
  MIN(P.valor) "faturamento_minimo",
  MAX(P.valor) "faturamento_maximo",
  ROUND(AVG(P.valor), 2) "faturamento_medio",
  ROUND(SUM(P.valor), 2) "faturamento_total" 
FROM plano P
INNER JOIN 
  pessoa_usuaria PU ON PU.plano_id = P.plano_id;