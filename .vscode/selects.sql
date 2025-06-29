SELECT 
  os.id_os, 
  os.status, 
  c.nome AS cliente, 
  CONCAT('(', c.ddd, ') ', c.telefone) AS telefone_cliente,
  t.nome AS tecnico
FROM OrdemServico os
JOIN Cliente c ON os.id_cliente = c.id_cliente
JOIN Tecnico t ON os.id_tecnico = t.id_tecnico;

SELECT 
  s.nome AS servico, 
  s.valor
FROM Servico_OS so
JOIN Servico s ON so.id_servico = s.id_servico
WHERE so.id_os = 1;

SELECT 
  p.nome AS peca, 
  p.valor_unitario, 
  po.qtd_utilizada, 
  (p.valor_unitario * po.qtd_utilizada) AS total
FROM Peca_OS po
JOIN Peca p ON po.id_peca = p.id_peca
WHERE po.id_os = 1;

SELECT 
  id_peca, 
  nome, 
  codigo, 
  qtd_estoque
FROM Peca
WHERE qtd_estoque < 5;

SELECT
  os.id_os,
  COALESCE(SUM(DISTINCT s.valor), 0) + 
  COALESCE(SUM(p.valor_unitario * po.qtd_utilizada), 0) AS valor_total_estimado
FROM OrdemServico os
LEFT JOIN Servico_OS so ON os.id_os = so.id_os
LEFT JOIN Servico s ON so.id_servico = s.id_servico
LEFT JOIN Peca_OS po ON os.id_os = po.id_os
LEFT JOIN Peca p ON po.id_peca = p.id_peca
GROUP BY os.id_os;

SELECT 
  os.id_os, os.data_abertura, os.status, c.nome
FROM OrdemServico os
JOIN Cliente c ON os.id_cliente = c.id_cliente
WHERE c.cpf = '12345678900';

SELECT 
  os.id_os, os.status, os.data_abertura, t.nome AS tecnico
FROM OrdemServico os
JOIN Tecnico t ON os.id_tecnico = t.id_tecnico
WHERE t.nome = 'Técnico 1';