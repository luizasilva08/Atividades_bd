CREATE DATABASE clinica; 
USE clinica;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE especie (
id_especie INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(50) NOT NULL
);

CREATE TABLE raca (
id_raca INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(100) NOT NULL,
id_especie INT,
FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);

CREATE TABLE animal (
id_animal INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idade INT,
descricao TEXT,
id_raca INT,
id_cliente INT,
FOREIGN KEY (id_raca) REFERENCES raca(id_raca),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


CREATE TABLE veterinario (
id_vet INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
cfmv VARCHAR(20)
);

CREATE TABLE especialidade (
id_espec INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(100)
);

CREATE TABLE especialidade_vet (
id_vet INT,
id_espec INT,
PRIMARY KEY (id_vet, id_espec),
FOREIGN KEY (id_vet) REFERENCES veterinario(id_vet),
FOREIGN KEY (id_espec) REFERENCES especialidade(id_espec)
);

CREATE TABLE consulta (
id_consulta INT PRIMARY KEY AUTO_INCREMENT,
data DATE,
anotacoes TEXT,
id_animal INT,
id_vet INT,
FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
FOREIGN KEY (id_vet) REFERENCES veterinario(id_vet)
);


CREATE TABLE exame (
id_exame INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(100),
valor DECIMAL(10,2)
);

CREATE TABLE medicacao (
id_medicacao INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(100),
valor DECIMAL(10,2)
);

CREATE TABLE exame_realizado (
id_consulta INT,
id_exame INT,
quantidade INT,
PRIMARY KEY (id_consulta, id_exame),
FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
FOREIGN KEY (id_exame) REFERENCES exame(id_exame)
);

CREATE TABLE medicacao_fornecida (
id_consulta INT,
id_medicacao INT,
quantidade INT,
PRIMARY KEY (id_consulta, id_medicacao),
FOREIGN KEY (id_consulta) REFERENCES consulta(id_consulta),
FOREIGN KEY (id_medicacao) REFERENCES medicacao(id_medicacao)
);