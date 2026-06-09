-- Active: 1778695955083@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@ecommerce

-- comando UPDATE
/* 
-- modificar dados que já
estão armazenados em uma tabela
do banco de dados; modificações emum ou mais linhas.
*/

DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE categoria (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT,
    nome VARCHAR(150),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);
