-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELAS 
-- ------------------------------------------------------------------
-- TABELA DAS LOJAS (FILIAIS)
CREATE TABLE IF NOT EXISTS [LOJA]
(
[COD_LOJA] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_LOJA] PRIMARY KEY([COD_LOJA] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_LOJA] ON LOJA([COD_LOJA]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DOS FORNECEDORES
CREATE TABLE IF NOT EXISTS [FORNECEDOR]
(
[COD_FORNECEDOR] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[EMAIL] VARCHAR(100) NOT NULL,
[CNPJ] VARCHAR(20) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_FORNECEDOR] PRIMARY KEY([COD_FORNECEDOR] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_FORNECEDOR] ON FORNECEDOR([COD_FORNECEDOR]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DE USUÁRIOS 
CREATE TABLE IF NOT EXISTS [USUARIO]
(
[COD_USUARIO] INTEGER NOT NULL,
[LOGIN] VARCHAR(100) NOT NULL,
[SENHA] VARCHAR(100) NOT NULL,
[EMAIL] VARCHAR(100) NOT NULL,
CONSTRAINT [PK_USUARIO] PRIMARY KEY([COD_USUARIO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_USUARIO] ON USUARIO([COD_USUARIO]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DO CLIENTE
CREATE TABLE IF NOT EXISTS [CLIENTE]
(
[COD_CLIENTE] INTEGER NOT NULL,
[COD_USUARIO] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[CPF] VARCHAR(20),
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_CLIENTE] PRIMARY KEY([COD_CLIENTE] AUTOINCREMENT),
CONSTRAINT [FK_USUARIO] FOREIGN KEY([COD_USUARIO]) REFERENCES USUARIO([COD_USUARIO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_CLIENTE] ON CLIENTE([COD_CLIENTE]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DO VENDEDOR
CREATE TABLE IF NOT EXISTS [VENDEDOR]
(
[COD_VENDEDOR] INTEGER NOT NULL,
[COD_USUARIO] INTEGER NOT NULL,
[COD_LOJA] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[CPF] VARCHAR(20) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
[ISADMIN] BOOLEAN NOT NULL,
CONSTRAINT [PK_VENDEDOR] PRIMARY KEY([COD_VENDEDOR] AUTOINCREMENT),
CONSTRAINT [FK_USUARIO] FOREIGN KEY([COD_USUARIO]) REFERENCES USUARIO([COD_USUARIO]),
CONSTRAINT [FK_LOJA] FOREIGN KEY([COD_LOJA]) REFERENCES LOJA([COD_LOJA])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_VENDEDOR] ON VENDEDOR([COD_VENDEDOR]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DO PRODUTO
CREATE TABLE IF NOT EXISTS [PRODUTO]
(
[COD_PRODUTO] INTEGER NOT NULL,
[COD_FORNECEDOR] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[VLR_PRODUTO] DOUBLE NOT NULL,
CONSTRAINT [PK_PRODUTO] PRIMARY KEY([COD_PRODUTO] AUTOINCREMENT),
CONSTRAINT [FK_FORNECEDOR] FOREIGN KEY([COD_FORNECEDOR]) REFERENCES FORNECEDOR([COD_FORNECEDOR])
);

CREATE UNIQUE INDEX IF NOT EXISTS[IPK_PRODUTO] ON PRODUTO([COD_PRODUTO]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DO PEDIDO
CREATE TABLE IF NOT EXISTS [PEDIDO]
(
[COD_PEDIDO] INTEGER NOT NULL,
[COD_CLIENTE] INTEGER NOT NULL,
[COD_VENDEDOR] INTEGER NOT NULL,
[COD_LOJA] INTEGER NOT NULL,
[DES_STATUS] VARCHAR(100) NOT NULL,
[TEMPO_ESPERA] TIME NOT NULL,
[VLR_PEDIDO] DOUBLE NOT NULL,
[DATA_PEDIDO] DATETIME NOT NULL,
CONSTRAINT [PK_PEDIDO] PRIMARY KEY([COD_PEDIDO] AUTOINCREMENT),
CONSTRAINT [FK_CLIENTE] FOREIGN KEY([COD_CLIENTE]) REFERENCES CLIENTE([COD_CLIENTE]),
CONSTRAINT [FK_VENDEDOR] FOREIGN KEY([COD_VENDEDOR]) REFERENCES VENDEDOR([COD_VENDEDOR]),
CONSTRAINT [FK_LOJA] FOREIGN KEY([COD_LOJA]) REFERENCES LOJA([COD_LOJA])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_PEDIDO] ON PEDIDO([COD_PEDIDO]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DO ITEM_PEDIDO
CREATE TABLE IF NOT EXISTS [ITEM_PEDIDO]
(
[COD_ITEM_PEDIDO] INTEGER NOT NULL,
[COD_PEDIDO] INTEGER NOT NULL,
[COD_PRODUTO] INTEGER NOT NULL,
[QTD_PRODUTO] INTEGER NOT NULL,
CONSTRAINT [PK_ITEM_PEDIDO] PRIMARY KEY([COD_ITEM_PEDIDO] AUTOINCREMENT),
CONSTRAINT [FK_PEDIDO] FOREIGN KEY([COD_PEDIDO]) REFERENCES PEDIDO([COD_PEDIDO]),
CONSTRAINT [FK_PRODUTO] FOREIGN KEY([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_ITEM_PEDIDO] ON ITEM_PEDIDO([COD_PEDIDO]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DO ESTOQUE
CREATE TABLE IF NOT EXISTS [ESTOQUE]
(
[COD_ESTOQUE] INTEGER NOT NULL,
[COD_PRODUTO] INTEGER NOT NULL,
[COD_LOJA] INTEGER NOT NULL,
[QTD_PRODUTO] INTEGER NOT NULL,
CONSTRAINT [PK_ESTOQUE] PRIMARY KEY([COD_ESTOQUE] AUTOINCREMENT),
CONSTRAINT [FK_PRODUTO] FOREIGN KEY([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO]),
CONSTRAINT [FK_LOJA] FOREIGN KEY([COD_LOJA]) REFERENCES LOJA([COD_LOJA])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_ESTOQUE] ON ESTOQUE([COD_ESTOQUE]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- TABELA DE RELATÓRIO
CREATE TABLE IF NOT EXISTS [RELATORIO]
(
[COD_RELATORIO] INTEGER NOT NULL,
[COD_LOJA] INTEGER NOT NULL,
[VLR_TOTAL] DOUBLE NOT NULL,
[DATA_INICIO] DATETIME NOT NULL,
[DATA_FIM] DATETIME NOT NULL,
CONSTRAINT [PK_RELATORIO] PRIMARY KEY([COD_RELATORIO] AUTOINCREMENT),
CONSTRAINT [FK_LOJA] FOREIGN KEY([COD_LOJA]) REFERENCES LOJA([COD_LOJA])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_RELATORIO] ON RELATORIO([COD_RELATORIO]);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- INSERTS
-- ------------------------------------------------------------------
-- INSERTS DA TABELA LOJA
-- ------------------------------------------------------------------
-- REGISTROS DA TABELA LOJA
INSERT INTO LOJA(NOME, TELEFONE, ENDERECO)
VALUES ('Zé Delivery - Caiçaras', '(31) 9 1234-5678', 'Av. Catalão, 1000 - Caiçaras, BH - MG');

-- ------------------------------------------------------------------
INSERT INTO LOJA(NOME, TELEFONE, ENDERECO)
VALUES ('Zé Delivery - Centro', '(31) 8 4321-8765', 'Av. Afonso Pena, 2000 - Centro, BH - MG');

-- ------------------------------------------------------------------
INSERT INTO LOJA(NOME, TELEFONE, ENDERECO)
VALUES ('Zé Delivery - Liberdade', '(11) 9 1324-5768', 'Rua Galvão Bueno, 2000 - Liberdade, SP - SP');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- UPDATES
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA LOJA
UPDATE LOJA SET TELEFONE = '(31) 9 4321-8765' WHERE NOME LIKE '%Centro' AND ENDERECO LIKE '%Centro, BH%';

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECTS 
-- ------------------------------------------------------------------
--SELECT DOS REGISTROS DA TABELA LOJA
SELECT * FROM LOJA;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--SELECT DOS REGISTROS DA TABELA FORNECEDOR
SELECT * FROM FORNECEDOR;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA USUARIO
SELECT * FROM USUARIO;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA CLIENTE
SELECT * FROM CLIENTE;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA VENDEDOR
SELECT * FROM VENDEDOR;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA PRODUTO
SELECT * FROM PRODUTO;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA PEDIDO
SELECT * FROM PEDIDO;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA ITEM_PEDIDO
SELECT * FROM ITEM_PEDIDO;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA ESTOQUE
SELECT * FROM ESTOQUE;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA RELATORIO
SELECT * FROM RELATORIO;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP DAS TABELAS
-- ------------------------------------------------------------------
--DROP DA TABELA LOJA
DROP TABLE IF EXISTS [LOJA];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP DA TABELA FORNECEDOR
DROP TABLE IF EXISTS [FORNECEDOR];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP DA TABELA USUARIO
DROP TABLE IF EXISTS [USUARIO];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP NA TABELA CLIENTE
DROP TABLE IF EXISTS [CLIENTE]; 

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--DROP NA TABELA VENDEDOR
DROP TABLE IF EXISTS [VENDEDOR];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP NA TABELA PRODUTO
DROP TABLE IF EXISTS [PRODUTO];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP NA TABELA PEDIDO
DROP TABLE IF EXISTS [PEDIDO];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP NA TABELA ITEM_PEDIDO
DROP TABLE IF EXISTS [ITEM_PEDIDO];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP NA TABELA ESTOQUE
DROP TABLE IF EXISTS [ESTOQUE];

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP NA TABELA RELATORIO
DROP TABLE IF EXISTS [RELATORIO];
