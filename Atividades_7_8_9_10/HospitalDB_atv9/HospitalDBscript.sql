-- Active: 1779906056041@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@HospitalDB
CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

CREATE TABLE Hospitais (
   id_hospital INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   cidade VARCHAR(100),
   estado CHAR(2),
   endereco VARCHAR(200)
);

CREATE TABLE Especialidades (
   id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Medicos (
   id_medico INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   crm VARCHAR(20) UNIQUE NOT NULL,
   telefone VARCHAR(20),
   email VARCHAR(100),
   salario DECIMAL(10,2),

   id_especialidade INT NOT NULL,
   id_hospital INT NOT NULL,

   FOREIGN KEY (id_especialidade)
       REFERENCES Especialidades(id_especialidade),

   FOREIGN KEY (id_hospital)
       REFERENCES Hospitais(id_hospital)
);

CREATE TABLE Pacientes (
   id_paciente INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   cpf CHAR(11) UNIQUE,
   data_nascimento DATE,
   telefone VARCHAR(20),
   email VARCHAR(100),
   endereco VARCHAR(200),
   tipo_sanguineo VARCHAR(5),
   alergias TEXT
);

CREATE TABLE Convenios (
   id_convenio INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   telefone VARCHAR(20),
   cobertura TEXT
);

CREATE TABLE PacienteConvenio (
   id_paciente_convenio INT PRIMARY KEY AUTO_INCREMENT,

   id_paciente INT NOT NULL,
   id_convenio INT NOT NULL,

   numero_carteira VARCHAR(50),

   FOREIGN KEY (id_paciente)
       REFERENCES Pacientes(id_paciente),

   FOREIGN KEY (id_convenio)
       REFERENCES Convenios(id_convenio)
);

CREATE TABLE Consultas (
   id_consulta INT PRIMARY KEY AUTO_INCREMENT,

   data_consulta DATETIME NOT NULL,
   diagnostico TEXT,
   observacoes TEXT,
   valor DECIMAL(10,2),

   id_paciente INT NOT NULL,
   id_medico INT NOT NULL,

   FOREIGN KEY (id_paciente)
       REFERENCES Pacientes(id_paciente),

   FOREIGN KEY (id_medico)
       REFERENCES Medicos(id_medico)
);

CREATE TABLE Medicamentos (
   id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL,
   fabricante VARCHAR(100),
   estoque INT,
   preco DECIMAL(10,2)
);

CREATE TABLE Receitas (
   id_receita INT PRIMARY KEY AUTO_INCREMENT,

   id_consulta INT NOT NULL,

   data_receita DATE,
   observacoes TEXT,

   FOREIGN KEY (id_consulta)
       REFERENCES Consultas(id_consulta)
);

CREATE TABLE ReceitaMedicamento (
   id_receita_medicamento INT PRIMARY KEY AUTO_INCREMENT,

   id_receita INT NOT NULL,
   id_medicamento INT NOT NULL,

   dosagem VARCHAR(100),
   frequencia VARCHAR(100),

   FOREIGN KEY (id_receita)
       REFERENCES Receitas(id_receita),

   FOREIGN KEY (id_medicamento)
       REFERENCES Medicamentos(id_medicamento)
);

CREATE TABLE Exames (
   id_exame INT PRIMARY KEY AUTO_INCREMENT,

   nome VARCHAR(100),
   resultado TEXT,
   data_exame DATE,

   id_paciente INT NOT NULL,
   id_medico INT NOT NULL,

   FOREIGN KEY (id_paciente)
       REFERENCES Pacientes(id_paciente),

   FOREIGN KEY (id_medico)
       REFERENCES Medicos(id_medico)
);

CREATE TABLE Quartos (
   id_quarto INT PRIMARY KEY AUTO_INCREMENT,

   numero VARCHAR(10),
   tipo VARCHAR(50),
   capacidade INT,
   status_quarto VARCHAR(50),

   id_hospital INT NOT NULL,

   FOREIGN KEY (id_hospital)
       REFERENCES Hospitais(id_hospital)
);

CREATE TABLE Internacoes (
   id_internacao INT PRIMARY KEY AUTO_INCREMENT,

   data_entrada DATETIME,
   data_saida DATETIME,
   motivo TEXT,

   id_paciente INT NOT NULL,
   id_quarto INT NOT NULL,

   FOREIGN KEY (id_paciente)
       REFERENCES Pacientes(id_paciente),

   FOREIGN KEY (id_quarto)
       REFERENCES Quartos(id_quarto)
);

CREATE TABLE Setores (
   id_setor INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(100) NOT NULL
);

CREATE TABLE Funcionarios (
   id_funcionario INT PRIMARY KEY AUTO_INCREMENT,

   nome VARCHAR(100),
   cpf CHAR(11),
   cargo VARCHAR(100),
   salario DECIMAL(10,2),

   id_setor INT NOT NULL,
   id_hospital INT NOT NULL,

   FOREIGN KEY (id_setor)
       REFERENCES Setores(id_setor),

   FOREIGN KEY (id_hospital)
       REFERENCES Hospitais(id_hospital)
);

CREATE TABLE Pagamentos (
   id_pagamento INT PRIMARY KEY AUTO_INCREMENT,

   valor DECIMAL(10,2),
   data_pagamento DATE,
   forma_pagamento VARCHAR(50),

   id_consulta INT,

   FOREIGN KEY (id_consulta)
       REFERENCES Consultas(id_consulta)
);

CREATE TABLE UsuariosSistema (
   id_usuario INT PRIMARY KEY AUTO_INCREMENT,

   usuario VARCHAR(50) UNIQUE,
   senha_hash VARCHAR(255),
   nivel_acesso VARCHAR(50)
);

CREATE TABLE Logs (
   id_log INT PRIMARY KEY AUTO_INCREMENT,

   acao TEXT,
   data_log DATETIME,

   id_usuario INT,

   FOREIGN KEY (id_usuario)
       REFERENCES UsuariosSistema(id_usuario)
);
