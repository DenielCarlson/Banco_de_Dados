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
-- INSERTS DA TABELA FORNECEDOR
INSERT INTO FORNECEDOR(NOME, EMAIL, CNPJ, TELEFONE, ENDERECO)
VALUES('Fornecedor de refrigerantes', 'refrigerantes@gmail.com', ' 01. 234. 567/0001-20',  
'(11) 9 8765-4321', 'Rua dos fornecedores, 3000 - Centro - SP-SP');

-- ------------------------------------------------------------------
INSERT INTO FORNECEDOR(NOME, EMAIL, CNPJ, TELEFONE, ENDERECO)
VALUES('Fornecedor de bebidas alcoólica', 'bebidasalcoolicas@gmail.com', ' 02. 345.578/0001-50',  
'(31) 9 5678-1234', 'Rua dos sonhos, 4000 - Pampulha - BH-MG');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- INSERTS DA TABELA USUARIO
-- CLIENTES
INSERT INTO USUARIO(LOGIN, SENHA, EMAIL)
VALUES ('Marcos', 'marcos123', 'marcosantonio@gmail.com');

-- ------------------------------------------------------------------
INSERT INTO USUARIO(LOGIN, SENHA, EMAIL)
VALUES ('Júlio', 'julio123', 'juliomattos@gmail.com');

-- ------------------------------------------------------------------
INSERT INTO USUARIO(LOGIN, SENHA, EMAIL)
VALUES ('Bárbara', 'babi321', 'babi_babi@gmail.com');

-- ------------------------------------------------------------------
INSERT INTO USUARIO(LOGIN, SENHA, EMAIL)
VALUES ('Larissa', 'larissa12#', 'larissaoliveira@gmail.com');

-- ------------------------------------------------------------------
-- VENDEDORES
INSERT INTO USUARIO(LOGIN, SENHA, EMAIL)
VALUES ('Alexandre', 'alex2030', 'alexandre@gmail.com');

-- ------------------------------------------------------------------
INSERT INTO USUARIO(LOGIN, SENHA, EMAIL)
VALUES ('Maria', 'mariaEdu1020', 'mariaeduarda@gmail.com');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- INSERTS DA TABELA CLIENTE
INSERT INTO CLIENTE(COD_USUARIO, NOME, CPF, TELEFONE, ENDERECO)
VALUES ((SELECT COD_USUARIO FROM USUARIO WHERE LOGIN LIKE 'Marcos%' AND EMAIL LIKE 'marcos%'), 
'Marcos Antônio', '123.345.567-89', '(31) 9 5867-1423', 'Rua dos clientes, 10 - Clientela - BH-MG ');

-- ------------------------------------------------------------------
INSERT INTO CLIENTE(COD_USUARIO, NOME, CPF, TELEFONE, ENDERECO)
VALUES ((SELECT COD_USUARIO FROM USUARIO WHERE LOGIN LIKE 'Jú%' AND EMAIL LIKE 'juliomatt%'), 
'Júlio Mattos', '321.345.576-', '(31) 9 1423-5867', 'Rua dos clientes, 20 - Clientela - BH-MG ');

-- ------------------------------------------------------------------
INSERT INTO CLIENTE(COD_USUARIO, NOME, CPF, TELEFONE, ENDERECO)
VALUES ((SELECT COD_USUARIO FROM USUARIO WHERE LOGIN LIKE 'Bárbara%' AND EMAIL LIKE 'babi_babi%'), 
'Bárbara Andrade', '987.654.874-87', '(31) 9 4132-5867', 'Rua dos clientes, 30 - Clientela - BH-MG ');

-- ------------------------------------------------------------------
INSERT INTO CLIENTE(COD_USUARIO, NOME, CPF, TELEFONE, ENDERECO)
VALUES ((SELECT COD_USUARIO FROM USUARIO WHERE LOGIN LIKE 'Larissa%' AND EMAIL LIKE 'larissaoliveira%'), 
'Larissa Oliveira', '348.853.098-98', '(31) 9 8543-0932', 'Rua dos clientes, 40 - Clientela - BH-MG ');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- INSERTS NA TABELA VENDEDOR
INSERT INTO VENDEDOR(COD_USUARIO, COD_LOJA, NOME, CPF, TELEFONE, ENDERECO, ISADMIN)
VALUES ((SELECT COD_USUARIO FROM USUARIO WHERE LOGIN LIKE 'Alex%' AND EMAIL LIKE 'alexandre@%'), 1,
'Alexandre', '109.209.007-07', '(31) 9 8561-0091', 'Rua dos funcionários, 1000 - Trabalhadores - BH-MG', TRUE);

-- ------------------------------------------------------------------
INSERT INTO VENDEDOR(COD_USUARIO, COD_LOJA, NOME, CPF, TELEFONE, ENDERECO, ISADMIN)
VALUES ((SELECT COD_USUARIO FROM USUARIO WHERE LOGIN LIKE 'Maria%' AND EMAIL LIKE '%riaeduarda@%'), 2,  
'Maria Eduarsd', '850.212.876-18', '(31) 9 5810-9151', 'Rua dos funcionários, 2000 - Trabalhadores - BH-MG', TRUE);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- INSERTS NA TABELA PRODUTO
-- BEBIDAS ALCOÓLICAS
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%bebidas alcoóli%'), 'Heiken', 14.00);

-- ------------------------------------------------------------------
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%bebidas alcoóli%'), 'Brahma', 7.00);

-- ------------------------------------------------------------------
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%bebidas alcoóli%'), 'Skol', 6.50);

-- ------------------------------------------------------------------
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%bebidas alcoóli%'), 'Corona', 12.00);

-- ------------------------------------------------------------------
-- REFRIGERANTES
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%refrigeran%'), 'Coca-cola', 9.00);

-- ------------------------------------------------------------------
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%refrigeran%'), 'Pepsi', 8.00);

-- ------------------------------------------------------------------
INSERT INTO PRODUTO(COD_FORNECEDOR, NOME, VLR_PRODUTO)
VALUES ((SELECT COD_FORNECEDOR FROM FORNECEDOR WHERE NOME LIKE '%refrigeran%'), 'Guaraná', 8.00);

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- UPDATES
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA LOJA
UPDATE LOJA SET TELEFONE = '(31) 9 4321-8765' WHERE NOME LIKE '%Centro' AND ENDERECO LIKE '%Centro, BH%';

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA FORNECEDOR
UPDATE FORNECEDOR SET NOME = 'Fornecedor de bebidas alcoólicas' WHERE CNPJ LIKE '%345.578/0001%' AND TELEFONE LIKE '%5678-1234';

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA USUARIO
UPDATE USUARIO SET SENHA = 'Larissa123' WHERE SENHA = (SELECT SENHA FROM USUARIO WHERE LOGIN  = 'Larissa');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA CLIENTE
UPDATE CLIENTE SET CPF = '321.345.576-95' WHERE NOME = (SELECT NOME FROM CLIENTE WHERE NOME LIKE '%úlio Mat%');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA VENDEDOR
UPDATE VENDEDOR SET NOME = 'Maria Eduarda' WHERE TELEFONE = (SELECT TELEFONE FROM CLIENTE WHERE TELEFONE = '(31) 9 5810-9151');

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--UPDATE NOS REGISTROS DA TABELA PRODUTO
UPDATE PRODUTO SET NOME = 'Heineken' WHERE NOME = (SELECT NOME FROM PRODUTO WHERE NOME LIKE 'Hei%'); 

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
-- DELETE DOS REGISTROS DE ID = 1 EM CADA TABELA
-- ------------------------------------------------------------------
-- DELETE DO REGISTRO DA TABELA LOJA 
DELETE FROM LOJA WHERE COD_LOJA = 1;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DELE DO REGISTRO NA TABELA FORNECEDOR
DELETE FROM FORNECEDOR WHERE COD_FORNECEDOR = 1;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DELE DO REGISTRO NA TABELA USUARIO
DELETE FROM USUARIO WHERE COD_USUARIO = 1;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DELE DO REGISTRO NA TABELA CLIENTE
DELETE FROM CLIENTE WHERE COD_CLIENTE = 1;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DELE DO REGISTRO NA TABELA VENDEDOR
DELETE FROM VENDEDOR WHERE COD_VENDEDOR = 1;

-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
-- DELE DO REGISTRO NA TABELA PRODUTO
DELETE FROM PRODUTO WHERE COD_PRODUTO = 1;

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

