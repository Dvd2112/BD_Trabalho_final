CREATE DATABASE AssistenciaTecnica;
USE AssistenciaTecnica;

CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(11),
  cnpj VARCHAR(14),
  ddd VARCHAR(3) NOT NULL,
  telefone VARCHAR(10) NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  CHECK ((cpf IS NOT NULL AND cnpj IS NULL) OR (cpf IS NULL AND cnpj IS NOT NULL)),
  UNIQUE (cpf),
  UNIQUE (cnpj)
);

CREATE TABLE Tecnico (
  id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  especialidade VARCHAR(100) NOT NULL,
  status ENUM('ativo', 'inativo') NOT NULL DEFAULT 'ativo'
);

CREATE TABLE Servico (
  id_servico INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0)
);

CREATE TABLE Peca (
  id_peca INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  codigo VARCHAR(20) NOT NULL UNIQUE,
  valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario >= 0),
  qtd_estoque INT NOT NULL DEFAULT 0 CHECK (qtd_estoque >= 0)
);

CREATE TABLE OrdemServico (
  id_os INT PRIMARY KEY AUTO_INCREMENT,
  data_abertura DATE NOT NULL,
  previsao_entrega DATE,
  status ENUM('aberta', 'em andamento', 'finalizada', 'cancelada') NOT NULL DEFAULT 'aberta',
  id_cliente INT NOT NULL,
  id_tecnico INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_tecnico)
);

CREATE TABLE Servico_OS (
  id_os INT,
  id_servico INT,
  PRIMARY KEY (id_os, id_servico),
  FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
  FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Peca_OS (
  id_os INT,
  id_peca INT,
  qtd_utilizada INT NOT NULL CHECK (qtd_utilizada > 0),
  PRIMARY KEY (id_os, id_peca),
  FOREIGN KEY (id_os) REFERENCES OrdemServico(id_os),
  FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);

