DROP DATABASE Ecommerce;

-- database cenário e-commerce
CREATE DATABASE Ecommerce;
USE Ecommerce;

-- criar tabela cliente
CREATE TABLE cliente(
	cliente_id INT PRIMARY KEY NOT NULL,
    cliente_Pnome VARCHAR(10) NOT NULL,
    cliente_Mnome VARCHAR(3),
    cliente_Snome VARCHAR(20),
    cliente_tipo ENUM('PJ', 'PF') NOT NULL,
    cliente_CPF CHAR(11) NOT NULL,
		CONSTRAINT cliente_cpf_unico UNIQUE (cliente_CPF),
    cliente_endereço VARCHAR(45)
);

-- criar tabela produto
CREATE TABLE produto(
	produto_id INT PRIMARY KEY,
    produto_nome VARCHAR(10) NOT NULL,
    produto_class_kids BOOL DEFAULT FALSE,
    produto_tipo ENUM('Eletrônico','Vestimenta','Brinquedos','Móveis') NOT NULL,
    produto_feedback FLOAT DEFAULT 0,
    produto_tamanho VARCHAR(10)
);

-- criar tabela pedido
CREATE TABLE pedido(
	pedido_id INT PRIMARY KEY,
    pedido_cliente_id INT,
    pedido_status ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em Processamento',
    pedido_descrição VARCHAR(225),
    pedido_envio FLOAT DEFAULT 10,
    pedido_pgt_dinheiro BOOLEAN DEFAULT FALSE,
    pedido_código INT,
		CONSTRAINT fk_pedido_cliente FOREIGN KEY (pedido_cliente_id) REFERENCES cliente(cliente_id)
);

-- criar tabela pagamento
CREATE TABLE pagamento(
	pagamento_id INT,
	pagamento_cliente_id INT,
		PRIMARY KEY (pagamento_id, pagamento_cliente_id),
    pagamento_tipo ENUM('Boleto','Cartão'),
	pagamento_limite_disp FLOAT
);

-- criar tabela estoque
CREATE TABLE estoque(
	estoque_produto_id INT PRIMARY KEY,
    estoque_local VARCHAR(225),
    estoque_quantidade INT DEFAULT 0
);

-- criar tabela fornecedor
CREATE TABLE fornecedor(
	fornecedor_id INT PRIMARY KEY,
    fornecedor_nome VARCHAR(225) NOT NULL,
    fornecedor_CNPJ CHAR(15) NOT NULL,
		CONSTRAINT fornecedor_cnpj_unico unique (fornecedor_CNPJ),
    fornecedor_contato CHAR(11) NOT NULL
);

-- criar tabela vendedor
CREATE TABLE vendedor(
	vendedor_id INT PRIMARY KEY,
    vendedor_nome VARCHAR(225) NOT NULL,
    vendedor_nome_fantasia VARCHAR(225),
    vendedor_CNPJ CHAR(15),
		CONSTRAINT fornecedor_cnpj_unico unique (vendedor_CNPJ),
    vendedor_CPF CHAR(9),
		CONSTRAINT fornecedor_cpf_unico unique (vendedor_CPF),
    vendedor_local VARCHAR(225),
    vendedor_contato CHAR(11) NOT NULL
);

-- criar tabela relação produto/vendedor
CREATE TABLE produtoVendedor(
produto_vendedor_id INT,
		CONSTRAINT fk_produto_vendedor FOREIGN KEY (produto_vendedor_id) REFERENCES vendedor(vendedor_id),
	vendedor_quantidade INT DEFAULT 1,
    PRIMARY KEY (produto_vendedor_id)
);

-- criar tabela relação produto/pedido
CREATE TABLE produtoPedido(
	pp_produto_id INT,
    pp_quantidade INT DEFAULT 1,
    pp_status ENUM('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (pp_produto_id)
);

-- criar tabela relação estoque/local
CREATE TABLE estoqueLocal(
	estoque_local_id INT,
	estoque_local_produto_id INT,
    estoque_local_local VARCHAR(225) NOT NULL,
    PRIMARY KEY (estoque_local_id, estoque_local_produto_id)
);