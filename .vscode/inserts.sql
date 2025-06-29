-- Clientes
INSERT INTO Cliente (nome, cpf, cnpj, ddd, telefone, endereco) VALUES
('João Silva', '12345678900', NULL, '41', '999999999', 'Rua A, 100'),
('Maria Souza', '98765432100', NULL, '41', '888888888', 'Av. B, 200'),
('Empresa XYZ', NULL, '11222333444455', '41', '33334444', 'Rua Comercial, 300'),
('Carlos Lima', '11122233344', NULL, '41', '77776666', 'Rua C, 400'),
('Ana Costa', '99988877766', NULL, '41', '55554444', 'Rua D, 500');

-- Técnicos
INSERT INTO Tecnico (nome, email, especialidade, status) VALUES
('Técnico 1', 'tec1@assist.com', 'Hardware', 'ativo'),
('Técnico 2', 'tec2@assist.com', 'Software', 'ativo'),
('Técnico 3', 'tec3@assist.com', 'Redes', 'inativo'),
('Técnico 4', 'tec4@assist.com', 'Formatação', 'ativo'),
('Técnico 5', 'tec5@assist.com', 'Montagem', 'ativo');

-- Serviços
INSERT INTO Servico (nome, valor) VALUES
('Formatação de PC', 150.00),
('Troca de HD', 200.00),
('Limpeza Interna', 100.00),
('Instalação de Sistema', 180.00),
('Atualização de Drivers', 80.00);

-- Peças
INSERT INTO Peca (nome, codigo, valor_unitario, qtd_estoque) VALUES
('HD 1TB', 'HD1000', 250.00, 10),
('Memória RAM 8GB', 'RAM8', 200.00, 15),
('Fonte 500W', 'FNT500', 180.00, 8),
('Placa-mãe', 'MB001', 450.00, 5),
('Cooler', 'CLR123', 50.00, 20);

-- Ordens de Serviço
INSERT INTO OrdemServico (data_abertura, previsao_entrega, status, id_cliente, id_tecnico) VALUES
('2025-06-20', '2025-06-25', 'aberta', 1, 1),
('2025-06-21', '2025-06-26', 'em andamento', 2, 2),
('2025-06-22', '2025-06-27', 'finalizada', 3, 3),
('2025-06-23', '2025-06-28', 'cancelada', 4, 4),
('2025-06-24', '2025-06-29', 'aberta', 5, 5);

-- Serviços por OS
INSERT INTO Servico_OS (id_os, id_servico) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- Peças por OS
INSERT INTO Peca_OS (id_os, id_peca, qtd_utilizada) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(5, 5, 2);
