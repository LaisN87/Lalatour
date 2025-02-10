-- Tabela de Destinos
CREATE TABLE Destino (
    id_destino INT PRIMARY KEY IDENTITY(1,1),
    destino VARCHAR(100) NOT NULL
    );

-- Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100),
    forma_pagamento VARCHAR(50),
    destino_id INT,
    data DATE,
    FOREIGN KEY (destino_id) REFERENCES Destinos(id_destino)
);
