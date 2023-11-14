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
