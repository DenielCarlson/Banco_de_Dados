-- TABELA DO CLIENTE
CREATE TABLE IF NOT EXISTS [CLIENTE]
(
[COD_CLIENTE] INTEGER NOT NULL,
[NOME_CLIENTE] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_CLIENTE] PRIMARY KEY([COD_CLIENTE] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_CLIENTE] ON CLIENTE([COD_CLIENTE]);

-- TABELA DO VENDEDOR 
CREATE TABLE IF NOT EXISTS [VENDEDOR]
(
[COD_VENDEDOR] INTEGER NOT NULL,
[NOME_VENDEDOR] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_VENDEDOR] PRIMARY KEY([COD_VENDEDOR] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_VENDEDOR] ON VENDEDOR([COD_VENDEDOR]);

-- TABELA DO FORNECEDOR
CREATE TABLE IF NOT EXISTS [FORNECEDOR]
(
[COD_FORNECEDOR] INTEGER NOT NULL,
[NOME_FORNECEDOR] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_FORNECEDOR] PRIMARY KEY([COD_FORNECEDOR] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_FORNECEDOR] ON FORNECEDOR([COD_FORNECEDOR]);

-- TABELA DO TIPO DO PRODUTO
CREATE TABLE IF NOT EXISTS [TIPO_PRODUTO]
(
[COD_TIPO_PRODUTO] INTEGER NOT NULL,
[DES_TIPO_PRODUTO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_TIPO_PRODUTO] PRIMARY KEY([COD_TIPO_PRODUTO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_TIPO_PRODUTO] ON TIPO_PRODUTO([COD_TIPO_PRODUTO]);

-- TABELA DA SITUAÇÃO DO PEDIDO
CREATE TABLE IF NOT EXISTS [SITUACAO_PEDIDO]
(
[COD_SITUACAO_PEDIDO] INTEGER NOT NULL,
[DES_STATUS_PEDIDO] VARCHAR(50) NOT NULL,
[DES_STATUS_PAGAMENTO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_SITUACAO_PEDIDO] PRIMARY KEY([COD_SITUACAO_PEDIDO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_SITUACAO_PEDIDO] ON SITUACAO_PEDIDO([COD_SITUACAO_PEDIDO]);

-- TABELA DA FORMA DE PAGAMENTO DO PEDIDO
CREATE TABLE IF NOT EXISTS [FORMA_PAGAMENTO]
(
[COD_FORMA_PAGAMENTO] INTEGER NOT NULL,
[DES_FORMA_PAGAMENTO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_FORMA_PAGAMENTO] PRIMARY KEY([COD_FORMA_PAGAMENTO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_FORMA_PAGAMENTO] ON FORMA_PAGAMENTO([COD_FORMA_PAGAMENTO]);

-- TABELA DO PRODUTO
CREATE TABLE IF NOT EXISTS [PRODUTO]
(
[COD_PRODUTO] INTEGER NOT NULL,
[COD_TIPO_PRODUTO] INTEGER NOT NULL,
[NOME_PRODUTO] VARCHAR(100) NOT NULL,
[VLR_PRODUTO_COMPRA] DOUBLE NOT NULL,
[VLR_PRODUTO_VENDA] DOUBLE NOT NULL,
CONSTRAINT [PK_PRODUTO] PRIMARY KEY([COD_PRODUTO] AUTOINCREMENT),
CONSTRAINT [FK_TIPO_PRODUTO] FOREIGN KEY([COD_TIPO_PRODUTO]) REFERENCES TIPO_PRODUTO([COD_TIPO_PRODUTO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_PRODUTO] ON PRODUTO([COD_PRODUTO]);

-- TABELA DA VENDA DO PEDIDO
CREATE TABLE IF NOT EXISTS [PEDIDO_VENDA]
(
[COD_PEDIDO_VENDA] INTEGER  NOT NULL,
[COD_CLIENTE] INTEGER NOT NULL,
[COD_VENDEDOR] INTEGER NOT NULL,
[COD_SITUACAO_PEDIDO] INTEGER NOT NULL,
[COD_FORMA_PAGAMENTO] INTEGER NOT NULL,
[DATA_PEDIDO] DATETIME NOT NULL,
[VLR_PEDIDO_VENDA] DOUBLE NOT NULL,
CONSTRAINT [PK_PEDIDO_VENDA] PRIMARY KEY([COD_PEDIDO_VENDA] AUTOINCREMENT),
CONSTRAINT [FK_CLIENTE] FOREIGN KEY([COD_CLIENTE]) REFERENCES CLIENTE([COD_CLIENTE]),
CONSTRAINT [FK_VENDEDOR] FOREIGN KEY([COD_VENDEDOR]) REFERENCES VENDEDOR([COD_VENDEDOR]),
CONSTRAINT [FK_SITUACAO_PEDIDO] FOREIGN KEY([COD_SITUACAO_PEDIDO]) REFERENCES SITUACAO_PEDIDO([COD_SITUACAO_PEDIDO]),
CONSTRAINT [FK_FORMA_PAGAMENTO] FOREIGN KEY ([COD_FORMA_PAGAMENTO]) REFERENCES FORMA_PAGAMENTO([COD_FORMA_PAGAMENTO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_PEDIDO_VENDA] ON PEDIDO_VENDA([COD_PEDIDO_VENDA]);

-- TABELA ITEM_PEDIDO_VENDA
CREATE TABLE IF NOT EXISTS [ITEM_PEDIDO_VENDA]
(
[COD_ITEM_PEDIDO_VENDA] INTEGER NOT NULL,
[COD_PEDIDO_VENDA] INTEGER NOT NULL,
[COD_PRODUTO] INTEGER NOT NULL,
[QTD_ITEM_PEDIDO_VENDA] DOUBLE NOT NULL,
CONSTRAINT [PK_ITEM_PEDIDO_VENDA] PRIMARY KEY([COD_ITEM_PEDIDO_VENDA] AUTOINCREMENT),
CONSTRAINT [FK_PEDIDO_VENDA] FOREIGN KEY([COD_PEDIDO_VENDA]) REFERENCES PEDIDO_VENDA([COD_PEDIDO_VENDA]),
CONSTRAINT [FK_PRODUTO] FOREIGN KEY([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_ITEM_PEDIDO_VENDA] ON ITEM_PEDIDO_VENDA([COD_ITEM_PEDIDO_VENDA]);

-- TABELA DE COTACAO DO PRODUTO FORNECIDO
CREATE TABLE IF NOT EXISTS [COTACAO]
(
[COD_COTACAO] INTEGER NOT NULL,
[COD_PRODUTO] INTEGER NOT NULL,
[COD_FORNECEDOR] INTEGER NOT NULL,
[VLR_COTACAO] DOUBLE NOT NULL,
[UNIDADE_MEDIDA] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_COTACAO] PRIMARY KEY([COD_COTACAO] AUTOINCREMENT),
CONSTRAINT [FK_PRODUTO] FOREIGN KEY ([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO]),
CONSTRAINT [FK_FORNECEDOR] FOREIGN KEY ([COD_FORNECEDOR]) REFERENCES FORNECEDOR([COD_FORNECEDOR])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_COTACAO] ON COTACAO([COD_COTACAO]);

-- TABELA DE PEDIDO COMPRA 
CREATE TABLE IF NOT EXISTS [PEDIDO_COMPRA]
(
[COD_PEDIDO_COMPRA] INTEGER NOT NULL,
[COD_FORNECEDOR] INTEGER NOT NULL,
[VLR_PEDIDO_COMPRA] DOUBLE NOT NULL,
CONSTRAINT [PK_PEDIDO_COMPRA] PRIMARY KEY([COD_PEDIDO_COMPRA] AUTOINCREMENT),
CONSTRAINT [FK_FORNECEDOR] FOREIGN KEY([COD_FORNECEDOR]) REFERENCES FORNECEDOR([COD_FORNECEDOR])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_PEDIDO_COMPRA] ON PEDIDO_COMPRA([COD_PEDIDO_COMPRA]);

-- TABELA ITEM_PEDIDO_COMPRA
CREATE TABLE IF NOT EXISTS [ITEM_PEDIDO_COMPRA]
(
[COD_ITEM_PEDIDO_COMPRA] INTEGER NOT NULL,
[COD_PEDIDO_COMPRA] INTEGER NOT NULL,
[COD_PRODUTO] INTEGER NOT NULL,
[QTD_ITEM_PEDIDO_COMPRA] INTEGER NOT NULL,
CONSTRAINT [PK_ITEM_PEDIDO_COMPRA] PRIMARY KEY([COD_ITEM_PEDIDO_COMPRA] AUTOINCREMENT),
CONSTRAINT [FK_PEDIDO_COMPRA] FOREIGN KEY([COD_PEDIDO_COMPRA]) REFERENCES PEDIDO_COMPRA([COD_PEDIDO_COMPRA]),
CONSTRAINT [FK_PRODUTO] FOREIGN KEY([COD_PRODUTO]) REFERENCES PRODUTO([COD_PRODUTO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_ITEM_PEDIDO_COMPRA] ON ITEM_PEDIDO_COMPRA([COD_ITEM_PEDIDO_COMPRA]);

-- --------------------------------------------------------------------------------------------------------------
-- RESGISTRO DO CLIENTE
INSERT INTO CLIENTE(NOME_CLIENTE, TELEFONE, ENDERECO)
VALUES('Deniel Carlson de Oliveira Andrade', '(31) 9 1234-5678', 'Baixada das Pulgas');

-- REGISTRO DO VENDEDOR
INSERT INTO VENDEDOR(NOME_VENDEDOR, TELEFONE, ENDERECO)
VALUES('Sor Davos Seaworth', '(31) 8 4321-8765', 'Baixada das Pulgas');

-- REGISTRO DA TABELA DO FORNECEDOR
INSERT INTO FORNECEDOR(NOME_FORNECEDOR, TELEFONE, ENDERECO)
VALUES('Fornecedor de bebidas', '(31) 6 8765-4321', 'Rua x, 12 - Bairro y, BH-MG');

-- REGISTRO DA TABELA DO TIPO DO PRODUTO
INSERT INTO TIPO_PRODUTO(DES_TIPO_PRODUTO)
VALUES ('Bebidas');

-- REGITRO DA TABELA DA SITUACAO DO PEDIDO
INSERT INTO SITUACAO_PEDIDO(DES_STATUS_PEDIDO, DES_STATUS_PAGAMENTO)
VALUES('Em rota de entrega', 'Confirmado');

-- REGISTEO DA TABELA DA FORMA DE PAGAMENTO
INSERT INTO FORMA_PAGAMENTO(DES_FORMA_PAGAMENTO)
VALUES ('Cartão');

-- REGISTRO DA TABELA DO PRODUTO
INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME_PRODUTO, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (1, 'HENEKEN', 5.00, 10.00);

-- REGISTRO DA TABELA DA VENDA DO PEDIDO
INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES(1, 1, 1, 1, '2023-11-09 14:00', 40.00);

-- REGISTRO DA TABELA DE ITEM_PEDIDO_VENDA
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (1, 1, 2.00);

-- REGISTRO DA TABELA DE COTACAO
INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (1, 1, 5.00, 'Kg');

-- REGISTRO DA TABELA DE PEDIDO_COMPRA
INSERT INTO PEDIDO_COMPRA(COD_FORNECEDOR, VLR_PEDIDO_COMPRA)
VALUES (1, 800.00);

-- REGISTRO DA TABELA DE ITEM_PEDIDO_COMPRA
INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (1, 1, 50.00);

-- --------------------------------------------------------------------------------------------------------------
-- UPDATE NO REGISTRO DE ID 1 NA TABELA CLIENTE
UPDATE CLIENTE SET ENDERECO = 'Rua x, 10 - Bairro z, BH-MG' WHERE COD_CLIENTE = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA VENDEDOR
UPDATE VENDEDOR SET TELEFONE = '(31) 9 4321-8765' WHERE COD_VENDEDOR = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA FORNECEDOR
UPDATE FORNECEDOR SET TELEFONE = '(31) 9 8765-4321' WHERE COD_FORNECEDOR = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DO TIPO DO PRODUTO
UPDATE TIPO_PRODUTO SET DES_TIPO_PRODUTO = 'Bebidas alcoólicas' WHERE COD_TIPO_PRODUTO  = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DA SITUAÇÃO DO PEDIDO
UPDATE SITUACAO_PEDIDO SET DES_STATUS_PEDIDO = 'Preparando' WHERE COD_SITUACAO_PEDIDO  = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DA FORMA DE PAGAMENTO
UPDATE FORMA_PAGAMENTO SET DES_FORMA_PAGAMENTO = 'Cartão de débito' WHERE COD_FORMA_PAGAMENTO  = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DO PRODUTO
UPDATE PRODUTO SET NOME_PRODUTO = 'Heineken' WHERE COD_PRODUTO = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DA VENDA DO PEDIDO
UPDATE PEDIDO_VENDA SET VLR_PEDIDO_VENDA = 30.00 WHERE COD_PEDIDO_VENDA = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DE ITEM_PEDIDO_VENDA
UPDATE ITEM_PEDIDO_VENDA SET QTD_ITEM_PEDIDO_VENDA = 3.00 WHERE COD_ITEM_PEDIDO_VENDA = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DE COTAÇÃO 
UPDATE COTACAO  SET UNIDADE_MEDIDA = 'Unidade' WHERE COD_COTACAO = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DE PEDIDO_COMPRA
UPDATE PEDIDO_COMPRA  SET VLR_PEDIDO_COMPRA = 500.00 WHERE COD_PEDIDO_COMPRA = 1;

-- UPDATE NO REGISTRO DE ID 1 NA TABELA DE ITEM_PEDIDO_COMP
UPDATE ITEM_PEDIDO_COMPRA SET QTD_ITEM_PEDIDO_COMPRA = 100.00 WHERE COD_ITEM_PEDIDO_COMPRA = 1;


-- --------------------------------------------------------------------------------------------------------------
-- SELECT DOS CLIENTES
SELECT * FROM CLIENTE;

-- SELECT DOS VENDEDORES
SELECT * FROM VENDEDOR;

-- SELECT DOS  FORNECEDORES
SELECT * FROM FORNECEDOR; 

-- SELECT DOS TIPOS DE PRODUTOS
SELECT * FROM TIPO_PRODUTO;

-- SELECT DAS SITUAÇÕES DE PEDIDO
SELECT * FROM SITUACAO_PEDIDO;

-- SELECT DAS FORMAS DE PAGAMENTO
SELECT * FROM FORMA_PAGAMENTO;

-- SELECT DOS PRODUTOS
SELECT * FROM PRODUTO;

-- SELECT DO PEDIDOS DE VENDA
SELECT * FROM PEDIDO_VENDA;

-- SELECT DO ITENS DE PEDIDOS DE VENDAS
SELECT * FROM ITEM_PEDIDO_VENDA;

-- SELECT DAS COTAÇÕES 
SELECT * FROM COTACAO;

-- SELECT DOS PEDIDOS DE COMPRA
SELECT * FROM PEDIDO_COMPRA;

-- SELECT DOS ITENS DOS PEDIDOS DE COMPRA
SELECT * FROM ITEM_PEDIDO_COMPRA;

-- --------------------------------------------------------------------------------------------------------------
-- SELECT COM AS TABELAS DO SISTEMA DE VENDA

SELECT PV.COD_PEDIDO_VENDA, C.NOME_CLIENTE, V.NOME_VENDEDOR, P.NOME_PRODUTO, TP.DES_TIPO_PRODUTO, P.VLR_PRODUTO_VENDA, IPV.QTD_ITEM_PEDIDO_VENDA, PV.VLR_PEDIDO_VENDA, 
FP.DES_FORMA_PAGAMENTO , SP.DES_STATUS_PAGAMENTO, SP.DES_STATUS_PEDIDO, PV.DATA_PEDIDO 
FROM ITEM_PEDIDO_VENDA AS IPV 
JOIN PEDIDO_VENDA PV
ON PV.COD_PEDIDO_VENDA = IPV.COD_PEDIDO_VENDA 
JOIN PRODUTO P 
ON P.COD_PRODUTO = IPV.COD_PRODUTO
JOIN TIPO_PRODUTO TP
ON TP.COD_TIPO_PRODUTO = P.COD_TIPO_PRODUTO 
JOIN CLIENTE C 
ON C.COD_CLIENTE = PV.COD_CLIENTE 
JOIN VENDEDOR V 
ON V.COD_VENDEDOR = PV.COD_VENDEDOR 
JOIN SITUACAO_PEDIDO SP
ON SP.COD_SITUACAO_PEDIDO = PV.COD_SITUACAO_PEDIDO 
JOIN FORMA_PAGAMENTO FP
ON FP.COD_FORMA_PAGAMENTO = PV.COD_FORMA_PAGAMENTO;


-- SELECT COM AS TABELAS DO SISTEMA DE COMPRA

SELECT PC.COD_PEDIDO_COMPRA, F.NOME_FORNECEDOR, P.NOME_PRODUTO, TP.DES_TIPO_PRODUTO,  P.VLR_PRODUTO_COMPRA, C.UNIDADE_MEDIDA , IPC.QTD_ITEM_PEDIDO_COMPRA, PC.VLR_PEDIDO_COMPRA
FROM ITEM_PEDIDO_COMPRA IPC
JOIN PEDIDO_COMPRA PC
ON PC.COD_PEDIDO_COMPRA = IPC.COD_ITEM_PEDIDO_COMPRA 
JOIN PRODUTO P
ON P.COD_PRODUTO = IPC.COD_PRODUTO 
JOIN TIPO_PRODUTO TP
ON TP.COD_TIPO_PRODUTO = P.COD_TIPO_PRODUTO 
JOIN FORNECEDOR F
ON F.COD_FORNECEDOR = PC.COD_FORNECEDOR 
JOIN COTACAO C
ON C.COD_FORNECEDOR = F.COD_FORNECEDOR;


-- --------------------------------------------------------------------------------------------------------------
-- DROP DA TABELA CLIENTE
DROP TABLE IF EXISTS [CLIENTE];

-- DROP DA TABELA VENDEDOR
DROP TABLE IF EXISTS [VENDEDOR];

-- DROP DA TABELA FORNECEDOR
DROP TABLE IF EXISTS [FORNECEDOR];

-- DROP DA TABELA TIPO DO PRODUTO
DROP TABLE IF EXISTS [TIPO_PRODUTO];

-- DROP DA TABELA SITUAÇÃO DO PEDIDO 
DROP TABLE IF EXISTS [SITUACAO_PEDIDO];

-- DROP DA TABELA FORMA DE PAGAMENTO
DROP TABLE IF EXISTS [FORMA_PAGAMENTO];

-- DROP NA TABELA PRODUTO
DROP TABLE IF EXISTS [PRODUTO];

-- DROP NA TABELA VENDA DO PEDIDO
DROP TABLE IF EXISTS [PEDIDO_VENDA];

-- DROP NA TABELA ITEM_PEDIDO_VENDA
DROP TABLE IF EXISTS [ITEM_PEDIDO_VENDA];

-- DROP NA TABELA COTAÇÃO
DROP TABLE IF EXISTS [COTACAO];

-- DROP NA TABELA DE PEDIDO DE COMPRA
DROP TABLE IF EXISTS [PEDIDO_COMPRA];

-- DROP NA TABELA DE ITEM_PEDIDO_COMPRA
DROP TABLE IF EXISTS [ITEM_PEDIDO_COMPRA];
