-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DO CLIENTE
CREATE TABLE IF NOT EXISTS [CLIENTE]
(
[COD_CLIENTE] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_CLIENTE] PRIMARY KEY([COD_CLIENTE] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_CLIENTE] ON CLIENTE([COD_CLIENTE]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DO VENDEDOR 
CREATE TABLE IF NOT EXISTS [VENDEDOR]
(
[COD_VENDEDOR] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_VENDEDOR] PRIMARY KEY([COD_VENDEDOR] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_VENDEDOR] ON VENDEDOR([COD_VENDEDOR]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DO FORNECEDOR
CREATE TABLE IF NOT EXISTS [FORNECEDOR]
(
[COD_FORNECEDOR] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[TELEFONE] VARCHAR(20) NOT NULL,
[ENDERECO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_FORNECEDOR] PRIMARY KEY([COD_FORNECEDOR] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_FORNECEDOR] ON FORNECEDOR([COD_FORNECEDOR]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DO TIPO DO PRODUTO
CREATE TABLE IF NOT EXISTS [TIPO_PRODUTO]
(
[COD_TIPO_PRODUTO] INTEGER NOT NULL,
[DES_TIPO_PRODUTO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_TIPO_PRODUTO] PRIMARY KEY([COD_TIPO_PRODUTO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_TIPO_PRODUTO] ON TIPO_PRODUTO([COD_TIPO_PRODUTO]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DA SITUAÇÃO DO PEDIDO
CREATE TABLE IF NOT EXISTS [SITUACAO_PEDIDO]
(
[COD_SITUACAO_PEDIDO] INTEGER NOT NULL,
[DES_STATUS_PEDIDO] VARCHAR(50) NOT NULL,
[DES_STATUS_PAGAMENTO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_SITUACAO_PEDIDO] PRIMARY KEY([COD_SITUACAO_PEDIDO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_SITUACAO_PEDIDO] ON SITUACAO_PEDIDO([COD_SITUACAO_PEDIDO]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DA FORMA DE PAGAMENTO DO PEDIDO
CREATE TABLE IF NOT EXISTS [FORMA_PAGAMENTO]
(
[COD_FORMA_PAGAMENTO] INTEGER NOT NULL,
[DES_FORMA_PAGAMENTO] VARCHAR(50) NOT NULL,
CONSTRAINT [PK_FORMA_PAGAMENTO] PRIMARY KEY([COD_FORMA_PAGAMENTO] AUTOINCREMENT)
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_FORMA_PAGAMENTO] ON FORMA_PAGAMENTO([COD_FORMA_PAGAMENTO]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TABELA DO PRODUTO
CREATE TABLE IF NOT EXISTS [PRODUTO]
(
[COD_PRODUTO] INTEGER NOT NULL,
[COD_TIPO_PRODUTO] INTEGER NOT NULL,
[NOME] VARCHAR(100) NOT NULL,
[VLR_PRODUTO_COMPRA] DOUBLE NOT NULL,
[VLR_PRODUTO_VENDA] DOUBLE,
CONSTRAINT [PK_PRODUTO] PRIMARY KEY([COD_PRODUTO] AUTOINCREMENT),
CONSTRAINT [FK_TIPO_PRODUTO] FOREIGN KEY([COD_TIPO_PRODUTO]) REFERENCES TIPO_PRODUTO([COD_TIPO_PRODUTO])
);

CREATE UNIQUE INDEX IF NOT EXISTS [IPK_PRODUTO] ON PRODUTO([COD_PRODUTO]);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
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

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
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

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
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

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
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

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
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
-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA CLIENTE
INSERT INTO CLIENTE(NOME, TELEFONE, ENDERECO)
VALUES ('Marcos', '(31) 9 1234-5678', 'Rua das Flores, 123 - Bairro Alegria - Cidade Feliz - UF');

INSERT INTO CLIENTE(NOME, TELEFONE, ENDERECO)
VALUES ('Guiherme', '(31) 94567-8901', 'Avenida dos Pássaros, 456 - Bairro Tranquilidade - Cidade Serena - UF');

INSERT INTO CLIENTE(NOME, TELEFONE, ENDERECO)
VALUES ('Andre', '(31) 99876-5432', 'Rua dos Sonhos, 210 - Bairro Esperança - Cidade Plácida - UF');

INSERT INTO CLIENTE(NOME, TELEFONE, ENDERECO)
VALUES ('Enzo', '(31) 9 9786-5432', 'Rua dos Pesadelos, 12 - Bairro Desespero - Cidade Aterrorizante - UF');

INSERT INTO CLIENTE(NOME, TELEFONE, ENDERECO)
VALUES ('Carlos', '(31) 9 9786-7654', 'Avenida Carlão, 300 - Bairro Levantaçaras - Cidade Belo Vertical - UF');

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA VENDEDOR
INSERT INTO VENDEDOR(NOME, TELEFONE, ENDERECO)
VALUES ('Alex', '(31) 9 3456-78902', 'Estrada da Harmonia, 901 - Bairro Calmaria - Cidade Serena - UF');

INSERT INTO VENDEDOR(NOME, TELEFONE, ENDERECO)
VALUES ('Larissa', '(31) 96789-0123', 'Beco da Paz, 678 - Bairro Solene - Cidade Quieta - UF');

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA DO FORNECEDOR
INSERT INTO FORNECEDOR(NOME, TELEFONE, ENDERECO)
VALUES ('Fornecedor de bebidas', '(31) 9 9012-3456', 'Viela da Lua, 345 - Bairro Noturno - Cidade Tranquila - UF');

INSERT INTO FORNECEDOR(NOME, TELEFONE, ENDERECO)
VALUES ('Fornecedor de ingredientes para pizza', '(31) 9 2345-6789', 'Rodovia do Sol, 876 - Bairro Solitário - Cidade Sossegada - UF');

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA TIPO_PRODUTO
INSERT INTO TIPO_PRODUTO(DES_TIPO_PRODUTO)
VALUES ('Bebidas alcoólicas');	

INSERT INTO TIPO_PRODUTO(DES_TIPO_PRODUTO)
VALUES ('Refrigerantes');

INSERT INTO TIPO_PRODUTO(DES_TIPO_PRODUTO)
VALUES ('Massas');

INSERT INTO TIPO_PRODUTO(DES_TIPO_PRODUTO)
VALUES ('Sucos');

INSERT INTO TIPO_PRODUTO(DES_TIPO_PRODUTO)
VALUES ('Ingredientes');

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA SITUACAO_PEDIDO
INSERT INTO SITUACAO_PEDIDO(DES_STATUS_PEDIDO, DES_STATUS_PAGAMENTO)
VALUES ('Aguardando confirmação', 'Pendente');

INSERT INTO SITUACAO_PEDIDO(DES_STATUS_PEDIDO, DES_STATUS_PAGAMENTO)
VALUES ('Em preparo', 'Confirmado');

INSERT INTO SITUACAO_PEDIDO(DES_STATUS_PEDIDO, DES_STATUS_PAGAMENTO)
VALUES ('Pronto para retirada', 'Confirmado');

INSERT INTO SITUACAO_PEDIDO(DES_STATUS_PEDIDO, DES_STATUS_PAGAMENTO)
VALUES ('Pedido retirado', 'Confimado');


-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA FORMA_PAGAMENTO
INSERT INTO FORMA_PAGAMENTO(DES_FORMA_PAGAMENTO)
VALUES ('Dinheiro');

INSERT INTO FORMA_PAGAMENTO(DES_FORMA_PAGAMENTO)
VALUES ('Cartão de débito');

INSERT INTO FORMA_PAGAMENTO(DES_FORMA_PAGAMENTO)
VALUES ('Cartão de crédito');

INSERT INTO FORMA_PAGAMENTO(DES_FORMA_PAGAMENTO)
VALUES ('Pix');

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA PRODUTO
INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (1, 'Heineken', 7.00, 14.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (1, 'Brahma', 4.00, 8.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (2, 'Coca-Cola', 4.00, 9.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (2, 'Mate Couro', 3.50, 7.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (3, 'À Moda', 35.00, 70.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (3, 'Pizza de Calabresa', 30.00, 60.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (3, 'Pizza de Pepperoni', 45.00, 80.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (4, 'Suco de Laranja', 3.00, 10.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (4, 'Suco Maracujá', 5.00, 12.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (4, 'Suco de Manga', 3.00, 10.00);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (5, 'Tomate', 3.00, NULL);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (5, 'Massa de pizza', 4.50, NULL);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (5, 'Pepperoni', 15.00, NULL);

INSERT INTO PRODUTO(COD_TIPO_PRODUTO, NOME, VLR_PRODUTO_COMPRA, VLR_PRODUTO_VENDA)
VALUES (5, 'Calabresa', 7.00, NULL);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA PEDIDO_VENDA
INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (1, 1, 1, 1, '2023-10-20 12:53:18', 107.00);

INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (1, 2, 3, 2, '2023-11-10 20:00:00', 140.00);

INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (1, 1, 2, 3, '2023-11-28 16:30:00', 114.00);

INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (2, 2, 4, 4, '2023-11-02 12:53:18', 369.00);

INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (2, 1, 2, 3, '2023-10-10 11:30:00', 70.00);

INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (3, 2, 1, 1, '2023-10-20 12:53:18', 30.00);

INSERT INTO PEDIDO_VENDA(COD_CLIENTE, COD_VENDEDOR, COD_SITUACAO_PEDIDO, COD_FORMA_PAGAMENTO, DATA_PEDIDO, VLR_PEDIDO_VENDA)
VALUES (5, 2, 1, 1, '2023-11-05 20:35', 0.00);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA ITEM_PEDIDO_VENDA
-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO ID 1
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (1, 1, 2.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (1, 5, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (1, 3, 1.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO ID 2
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (2, 2, 5.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (2, 6, 2.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO ID 3
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (3, 9, 2.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (3, 8, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (3, 7, 1.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO ID 4
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (4, 5, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (4, 6, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (4, 7, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (4, 1, 10.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (4, 3, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (4, 10, 1.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO ID 5
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (5, 6, 1.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (5, 8, 1.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO ID 6
INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (6, 3, 2.00);

INSERT INTO ITEM_PEDIDO_VENDA(COD_PEDIDO_VENDA, COD_PRODUTO, QTD_ITEM_PEDIDO_VENDA)
VALUES (6, 7, 1.00);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA 
-- --------------------------------------------------------------------------------------------------------------
-- PRODUTOS FORNECIDOS PELO FORNCEDOR DE ID 1
INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (1, 1, 7.00, 'Unidade');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (2, 1, 4.00, 'Unidade');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (3, 1, 4.00, 'Unidade');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (4, 1, 3.50, 'Unidade');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (8, 1, 3.00, 'Unidade');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (9, 1, 5.00, 'Unidade');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (10, 1, 3.00, 'Unidade');


-- --------------------------------------------------------------------------------------------------------------
-- PRODUTOS FORNECIDOS PELO FORNECEDOR DE ID 2
INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (11, 2, 3.00, 'kg');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (12, 2, 4.50, 'kg');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (13, 2, 15.00, 'kg');

INSERT INTO COTACAO(COD_PRODUTO, COD_FORNECEDOR, VLR_COTACAO, UNIDADE_MEDIDA)
VALUES (14, 2, 7.00, 'kg');

-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA PEDIDO_COMPRA
INSERT INTO PEDIDO_COMPRA(COD_FORNECEDOR, VLR_PEDIDO_COMPRA)
VALUES (1, 1165.00);

INSERT INTO PEDIDO_COMPRA(COD_FORNECEDOR, VLR_PEDIDO_COMPRA)
VALUES (1, 270.00);

INSERT INTO PEDIDO_COMPRA(COD_FORNECEDOR, VLR_PEDIDO_COMPRA)
VALUES (2, 191.00);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INSERTS NA TABELA ITEM_PEDIDO_COMPRA
-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO COMPRA 1
INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (1, 1, 100.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (1, 2, 50.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (1, 3, 40.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (1, 4, 30.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO COMPRA 2
INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (2, 7, 20.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (2, 8, 30.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (2, 9, 20.00);

-- --------------------------------------------------------------------------------------------------------------
-- PEDIDO COMPRA 3
INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (3, 11, 10.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (3, 12, 10.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (3, 13, 4.00);

INSERT INTO ITEM_PEDIDO_COMPRA(COD_PEDIDO_COMPRA, COD_PRODUTO, QTD_ITEM_PEDIDO_COMPRA)
VALUES (3, 14, 8.00);

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- SELECTS
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
-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- INNER JOINS
-- --------------------------------------------------------------------------------------------------------------
-- CLIENTES QUE COMPRARAM NA PIZZARIA E O VALOR TOTAL DE SEUS RESPECTIVOS GASTOS
SELECT C.COD_CLIENTE  AS CODIGO_CLIENTE, C.NOME AS NOME_CLIENTE, SUM(PV.VLR_PEDIDO_VENDA) AS VALOR_TOTAL
FROM PEDIDO_VENDA PV
JOIN CLIENTE C ON C.COD_CLIENTE = PV.COD_CLIENTE
GROUP BY C.NOME 
ORDER BY C.NOME ASC;

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- LUCRO DA PIZZARIA EM CADA PRODUTO
SELECT P.COD_PRODUTO AS CODIGO_PRODUTO, P.NOME AS NOME_PRODUTO, SUM((P.VLR_PRODUTO_VENDA - P.VLR_PRODUTO_COMPRA) * QTD_ITEM_PEDIDO_VENDA) AS LUCRO
FROM PRODUTO P
JOIN ITEM_PEDIDO_VENDA IPV ON IPV.COD_PRODUTO = P.COD_PRODUTO
GROUP BY P.NOME
ORDER BY P.COD_PRODUTO ASC;

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- RELATÓRIO DE TODOS PEDIDOS VENDA
SELECT PV.COD_PEDIDO_VENDA AS CODIGO_PEDIDO, C.NOME AS CLIENTE, V.NOME AS VENDEDOR, SUM(IPV.QTD_ITEM_PEDIDO_VENDA) AS QUANTIDADE_ITENS, SP.DES_STATUS_PAGAMENTO AS STATUS_PAGAMENTO, 
FP.DES_FORMA_PAGAMENTO AS FORMA_PAGAMENTO, PV.VLR_PEDIDO_VENDA AS VALOR_TOTAL, PV.DATA_PEDIDO
FROM PEDIDO_VENDA PV
JOIN CLIENTE C ON C.COD_CLIENTE  = PV.COD_CLIENTE
JOIN VENDEDOR V ON V.COD_VENDEDOR = PV.COD_VENDEDOR 
JOIN SITUACAO_PEDIDO SP ON SP.COD_SITUACAO_PEDIDO = PV.COD_SITUACAO_PEDIDO 
JOIN FORMA_PAGAMENTO FP ON FP.COD_FORMA_PAGAMENTO = PV.COD_FORMA_PAGAMENTO
JOIN ITEM_PEDIDO_VENDA IPV ON IPV.COD_PEDIDO_VENDA = PV.COD_PEDIDO_VENDA
JOIN PRODUTO P ON P.COD_PRODUTO = IPV.COD_PRODUTO 
GROUP BY PV.COD_PEDIDO_VENDA; 

-- --------------------------------------------------------------------------------------------------------------
-- TODOS OS ITENS DE CADA PEDIDO QUE CADA CLIENTE COMPROU COM SUA RESPECTIVA QUANTIDADE, VALOR, DATA E ETC
SELECT PV.COD_PEDIDO_VENDA AS CODIGO_PEDIDO, C.NOME AS CLIENTE,  V.NOME AS VENDEDOR, P.NOME AS PRODUTO, tp.DES_TIPO_PRODUTO  AS CATEGORIA, IPV.QTD_ITEM_PEDIDO_VENDA AS QUANTIDADE_PRODUTO,
P.VLR_PRODUTO_VENDA AS VALOR,  SUM(P.VLR_PRODUTO_VENDA * IPV.QTD_ITEM_PEDIDO_VENDA) AS TOTAL, PV.DATA_PEDIDO
FROM PEDIDO_VENDA PV
JOIN ITEM_PEDIDO_VENDA IPV ON IPV.COD_PEDIDO_VENDA = PV.COD_PEDIDO_VENDA 
JOIN CLIENTE C ON C.COD_CLIENTE = PV.COD_CLIENTE 
JOIN VENDEDOR V ON V.COD_VENDEDOR = PV.COD_VENDEDOR 
JOIN PRODUTO P ON P.COD_PRODUTO = IPV.COD_PRODUTO 
JOIN TIPO_PRODUTO TP ON TP.COD_TIPO_PRODUTO = P.COD_TIPO_PRODUTO
GROUP BY IPV.COD_ITEM_PEDIDO_VENDA;

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- GASTO DA PIZZARIA COM FORNECEDORES
SELECT PC.COD_PEDIDO_COMPRA AS CODIGO_PEDIDO, F.NOME AS NOME_FORNECEDOR, F.TELEFONE AS TELEFONE_FORNECEDOR, SUM(PC.VLR_PEDIDO_COMPRA) AS VALOR_TOTAL
FROM PEDIDO_COMPRA PC
JOIN FORNECEDOR F ON F.COD_FORNECEDOR = PC.COD_FORNECEDOR
GROUP BY F.NOME; 

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- COTACÃO DE CADA PRODUTO FORNECIDO
SELECT F.COD_FORNECEDOR AS CODIGO_FORNECEDOR, F.NOME AS FORNCEDOR, P.NOME AS PRODUTO, TP.DES_TIPO_PRODUTO AS CATEGORIA, C.VLR_COTACAO AS VALOR_COTACAO, C.UNIDADE_MEDIDA 
FROM COTACAO C
JOIN PRODUTO P ON P.COD_PRODUTO = C.COD_PRODUTO 
JOIN TIPO_PRODUTO TP ON TP.COD_TIPO_PRODUTO = P.COD_TIPO_PRODUTO 
JOIN FORNECEDOR F ON F.COD_FORNECEDOR = C.COD_FORNECEDOR;

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TODOS OS PRODUTOS QUE A PIZZARIA COMPROU COM SUA RESPECTIVA QUANTIDADE, VALOR, UNIDADE DE MEDIDA E ETC
SELECT PC.COD_PEDIDO_COMPRA AS CODIGO_PEDIDO, F.NOME AS FORNECEDOR, P.NOME AS PRODUTO, TP.DES_TIPO_PRODUTO AS CATEGORIA, IPC.QTD_ITEM_PEDIDO_COMPRA AS QUANTIDADE, 
P.VLR_PRODUTO_COMPRA AS VALOR, C.UNIDADE_MEDIDA, SUM(P.VLR_PRODUTO_COMPRA * IPC.QTD_ITEM_PEDIDO_COMPRA) AS TOTAL 
FROM PEDIDO_COMPRA PC
JOIN FORNECEDOR F ON F.COD_FORNECEDOR = PC.COD_FORNECEDOR 
JOIN ITEM_PEDIDO_COMPRA IPC ON IPC.COD_PEDIDO_COMPRA = PC.COD_PEDIDO_COMPRA 
JOIN PRODUTO P ON P.COD_PRODUTO = IPC.COD_PRODUTO 
JOIN TIPO_PRODUTO TP ON TP.COD_TIPO_PRODUTO = P.COD_TIPO_PRODUTO 
JOIN COTACAO C ON C.COD_PRODUTO = P.COD_PRODUTO
GROUP BY IPC.COD_ITEM_PEDIDO_COMPRA;

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- SELECT COM JOIN USANDO A CLÁUSULA WHERE
-- --------------------------------------------------------------------------------------------------------------
-- VENDAS NO MÊS DE OUTUBRO
SELECT PV.COD_PEDIDO_VENDA AS CODIGO_VENDA, V.NOME AS VENDEDOR, C.NOME AS CLIENTE, PV.VLR_PEDIDO_VENDA  AS TOTAL, DATA_PEDIDO 
FROM PEDIDO_VENDA PV
JOIN CLIENTE C ON C.COD_CLIENTE = PV.COD_CLIENTE
JOIN VENDEDOR V ON V.COD_VENDEDOR = PV.COD_VENDEDOR
WHERE PV.DATA_PEDIDO BETWEEN '2023-10-01 00:00:00' AND '2023-10-31 23:59:59';

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- VENDAS NO MÊS DE NOVEMBRO
SELECT PV.COD_PEDIDO_VENDA AS CODIGO_VENDA, V.NOME AS VENDEDOR, C.NOME AS CLIENTE, PV.VLR_PEDIDO_VENDA  AS TOTAL, DATA_PEDIDO 
FROM PEDIDO_VENDA PV
JOIN CLIENTE C ON C.COD_CLIENTE = PV.COD_CLIENTE
JOIN VENDEDOR V ON V.COD_VENDEDOR = PV.COD_VENDEDOR
WHERE PV.DATA_PEDIDO BETWEEN '2023-11-01 00:00:00' AND '2023-11-31 23:59:59';

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- OUTER JOINS
-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- TODOS OS PRODUTOS COM E SEM COTAÇÃO - LEFT JOIN
SELECT P.COD_PRODUTO AS CODIGO_PRODUTO, P.NOME AS PRODUTO, C.VLR_COTACAO  AS VALOR_COTACAO, C.UNIDADE_MEDIDA 
FROM PRODUTO P
LEFT JOIN COTACAO C ON C.COD_PRODUTO = P.COD_PRODUTO;

-- --------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- QUANTIDADE DE PEDIDOS POR CLIENTE - RIGHT JOIN
SELECT C.COD_CLIENTE AS CODIGO_CLIENTE, C.NOME AS NOME_CLIENTE, COUNT(PV.COD_PEDIDO_VENDA) AS QUANTIDADE_PEDIDOS
FROM PEDIDO_VENDA PV
RIGHT JOIN CLIENTE C ON C.COD_CLIENTE = PV.COD_CLIENTE 
GROUP BY C.NOME 
ORDER BY C.NOME ASC;

-- --------------------------------------------------------------------------------------------------------------
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
