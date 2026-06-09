-- Active: 1778695955083@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@estoquecomercial
CREATE DATABASE estoquecomercial;

USE estoquecomercial;

CREATE TABLE Itens_Estoque (
    idItem INT NOT NULL AUTO_INCREMENT,
    descricaoItem VARCHAR(200),
    setorItem VARCHAR(200),
    precoVendaItem DOUBLE(9, 2),
    estoqueItem INT,
    PRIMARY KEY (idItem)
);