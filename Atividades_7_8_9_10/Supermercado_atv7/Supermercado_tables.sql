CREATE DATABASE SupermercadoDB;
USE SupermercadoDB;

CREATE TABLE Categorias (
   id_categoria INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Fornecedores (
   id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   contato VARCHAR(100),
   endereco VARCHAR(200)
);

CREATE TABLE Filiais (
   id_filial INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   endereco VARCHAR(200) NOT NULL
);

CREATE TABLE Produtos (
   id_produto INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
   quantidade_estoque INT NOT NULL CHECK (quantidade_estoque >= 0),
   id_categoria INT NOT NULL,
   id_fornecedor INT NOT NULL,
   id_filial INT NOT NULL,
   FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
   FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor),
   FOREIGN KEY (id_filial) REFERENCES Filiais(id_filial)
);

CREATE TABLE Funcionarios (
   id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   cargo VARCHAR(50) NOT NULL,
   salario DECIMAL(10,2) NOT NULL CHECK (salario >= 0),
   data_contratacao DATE NOT NULL,
   id_filial INT NOT NULL,
   FOREIGN KEY (id_filial) REFERENCES Filiais(id_filial)
);

CREATE TABLE Clientes (
   id_cliente INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   telefone CHAR(11) UNIQUE,
   endereco VARCHAR(200),
   pontos_fidelidade INT DEFAULT 0 CHECK (pontos_fidelidade >= 0)
);

CREATE TABLE Compras (
   id_compra INT PRIMARY KEY AUTO_INCREMENT,
   data DATE NOT NULL,
   total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
   id_fornecedor INT NOT NULL,
   id_filial INT NOT NULL,
   FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor),
   FOREIGN KEY (id_filial) REFERENCES Filiais(id_filial)
);

CREATE TABLE ItensCompra (
   id_item_compra INT PRIMARY KEY AUTO_INCREMENT,
   id_compra INT NOT NULL,
   id_produto INT NOT NULL,
   quantidade INT NOT NULL CHECK (quantidade > 0),
   subtotal DECIMAL(10,2) NOT NULL CHECK (subtotal >= 0),
   FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
   FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

CREATE TABLE Vendas (
   id_venda INT PRIMARY KEY AUTO_INCREMENT,
   data DATE NOT NULL,
   total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
   id_cliente INT,
   id_funcionario INT NOT NULL,
   id_filial INT NOT NULL,
   FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
   FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
   FOREIGN KEY (id_filial) REFERENCES Filiais(id_filial)
);

CREATE TABLE ItensVenda (
   id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
   id_venda INT NOT NULL,
   id_produto INT NOT NULL,
   quantidade INT NOT NULL CHECK (quantidade > 0),
   subtotal DECIMAL(10,2) NOT NULL CHECK (subtotal >= 0),
   FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
   FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
