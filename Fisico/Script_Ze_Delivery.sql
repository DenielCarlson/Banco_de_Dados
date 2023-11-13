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
-- ------------------------------------------------------------------
-- SELECTS 
-- ------------------------------------------------------------------
--SELECT DOS REGISTROS DA TABELA LOJA
SELECT * FROM LOJA;

-- ------------------------------------------------------------------
--SELECT DOS REGISTROS DA TABELA FORNECEDOR
SELECT * FROM FORNECEDOR;

-- ------------------------------------------------------------------
-- SELECT DOS REGISTROS DA TABELA USUARIO
SELECT * FROM USUARIO;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DROP DAS TABELAS
-- ------------------------------------------------------------------
--DROP DA TABELA LOJA
DROP TABLE IF EXISTS [LOJA];

-- ------------------------------------------------------------------
-- DROP DA TABELA FORNECEDOR
DROP TABLE IF EXISTS [FORNECEDOR];

-- ------------------------------------------------------------------
-- DROP DA TABELA USUARIO
DROP TABLE IF EXISTS [USUARIO];
