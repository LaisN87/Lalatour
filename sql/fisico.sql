- Geração de Modelo físico

CREATE DATABASE Lalatour;

use Lalatour;

-- TABELAS RELACIONADAS À EMPRESA/FUNCIONÁRIOS

CREATE TABLE Empresa (
    Cnpj VARCHAR(14) default '11111111111111',
    Razao_Social VARCHAR(20) default 'Lalatour',
    Nome_Fantasia VARCHAR(30) default 'Agência de Viagens Lalatour',
    Cod_Unid INTEGER PRIMARY KEY auto_increment,
    Unidade VARCHAR(20) not null,
    Telefone VARCHAR(15) not null,
    Email VARCHAR(50) not null,
    Endereco VARCHAR(50) not null
);


CREATE TABLE Departamento (
    Cod_Departamento INTEGER PRIMARY KEY auto_increment,
    Nome_Departamento VARCHAR(15) not null,
    Cod_Unid INTEGER not null,
    FOREIGN KEY (Cod_unid) REFERENCES Empresa (Cod_Unid)
);


CREATE TABLE Funcionario (
    Mat_Func INTEGER PRIMARY KEY auto_increment,
    Nome_Func VARCHAR(50) not null,
    Cargo_Func VARCHAR(20) not null,
    Salario_Func DOUBLE not null default '0',
    Cod_Departamento INTEGER not null,
    FOREIGN KEY (Cod_Departamento) REFERENCES Departamento (Cod_Departamento)
);

-- TABELAS RELACIONADAS AO CLIENTE/USUÁRIO

CREATE TABLE Cliente (
    Cpf_Cli VARCHAR(11) not null,
    Nome_Cli VARCHAR(50) not null,
    Email_Cli VARCHAR(50) not null,
    Telefone_Cli VARCHAR(11) not null,
    PRIMARY KEY (Cpf_Cli)
);


create table usuario (
id int auto_increment,
nome varchar(50) not null,
cpf varchar(11) unique not null,
telefone varchar(11) default '',
email varchar(50) unique not null,
senha varchar(12) not null,
dataCadastro date, 
dataAtualizacaoCadastro date,
Primary key (id)
);


-- TABELAS RELACIONADAS AO PEDIDO

CREATE TABLE Destino (
    Id_Destino INTEGER auto_increment,
	Nome_Destino VARCHAR(20) not null,
    Preco_Destino DOUBLE not null,
    Categoria_Destino VARCHAR(20) not null,
    Qtd_Disponivel INTEGER not null,
    Condicao VARCHAR(20) not null default 'Sem desconto',
    PRIMARY KEY (Id_Destino)
);


CREATE TABLE Passagem (
    Id_Passagem INTEGER PRIMARY KEY auto_increment,
    Quantidade INTEGER not null,
    Id_Destino INTEGER not null,
	FOREIGN KEY (Id_Destino) REFERENCES Destino (Id_Destino)
 
);


CREATE TABLE Pedido (
    Num_Pedido INTEGER PRIMARY KEY auto_increment,
	Data_Pedido DATE not null,
    Mat_Func INTEGER not null,
    idUsuario INTEGER not null,
    PrecoTotal DOUBLE not null,
    Forma_Pag VARCHAR(20) not null default 'Cartão de Crédito',
    statusPedido VARCHAR(20) default 'Em processamento',
    FOREIGN KEY (Mat_Func) REFERENCES Funcionario (Mat_Func),
    FOREIGN KEY (idUsuario) REFERENCES Usuario (id)
);


-- INSERIR EM DESTINO
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ("RECIFE", 500.00, "NACIONAL", 250, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('PORTO DE GALINHAS', 650.00, 'NACIONAL', 300, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('SALVADOR', 700.00, 'NACIONAL', 320, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('RIO DE JANEIRO', 889.00, 'NACIONAL', 155, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('SÃO PAULO', 729.00, 'NACIONAL', 189, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('CURITIBA', 250.00, 'NACIONAL', 50, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('JOÃO PESSOA', 859.00, 'NACIONAL', 75, default);
INSERT INTO DESTINO (Nome_Destino, Preco_Destino, Categoria_Destino, Qtd_Disponivel, Condicao) VALUES ('MACAÉ', 950.00, 'NACIONAL', 120, default);