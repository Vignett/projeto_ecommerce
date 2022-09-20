DROP DATABASE Ecommerce;

-- população de dados
CREATE DATABASE Ecommerce;
USE Ecommerce;
SHOW TABLES;

-- popular tabela cliente
INSERT INTO cliente (cliente_id, cliente_Pnome, cliente_Mnome, cliente_Snome, cliente_CPF, cliente_tipo, cliente_endereço)
	VALUES 
		(1,'Ardith','J','Lanfear','923294905','PJ','43 Doe Crossing Junction'),
        (2,'Ambrosius','F','Scola','488748888','PF','22 Shopko Circle'),
        (3,'Ray','H','Rushforth','461463327','PF','67 Clarendon Alley'),
        (4,'Eden','A','Greenrod','172999642','PJ','89 Shoshone Terrace'),
        (5,'Shaylah','L','Wrightim','225301698','PJ','92 Mockingbird Avenue');
DESC cliente;

-- popular tabela pedido
INSERT INTO pedido (pedido_id, pedido_cliente_id, pedido_status, pedido_descrição, pedido_envio, pedido_pgt_dinheiro, pedido_código)
	VALUES 
		(1234,1, default, 'aplicativo', null, 1, 134806493),
        (754,2, default, null, null, 1, 666333111),
        (1676,3, 'Confirmado', 'web site', 50, 0, 222333555),
        (165,4, default, 'aplicativo', null, 1, 999777666);
DESC pedido;

-- popular tabela estoque
INSERT INTO estoque (estoque_produto_id, estoque_local, estoque_quantidade)
	VALUES 
		(41,'575 La Follette Alley','12'),
        (232,'682 Fallview Trail','76'),
        (354,'2 Arapahoe Way','32'),
        (124,'41 Prairie Rose Hill','62'),
        (415,'80270 Quincy Circle','81');
DESC estoque;

-- popular tabela fornecedor
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_CNPJ, fornecedor_contato)
	VALUES 
		(511,'Keebler','301816230223214','7914934410'),
        (2512,'Schuppe','397822182114380','4100552229'),
        (345,'Schmidit','202756449080862','7135314941'),
        (614,'Herman','173655630408397','5239396416'),
        (512,'Lebsack','507682184405887','5679788944');
DESC fornecedor;

-- popular tabela vendedor
INSERT INTO vendedor (vendedor_id, vendedor_nome, vendedor_nome_fantasia, vendedor_CNPJ, vendedor_CPF, vendedor_local, vendedor_contato)
	VALUES 
		(15431,'05 Grayhawk Hill','Wisoky, Bartell and Jacobs','542386673385968','470213568','3945 Everett Court','12181800190'),
		(22356,'29 Columbus Park','Streich, McKenzie and Klein','381115840677649','478545330','294 Northfield Point','11666895664'),
		(323456,'7316 Nelson Parkway','Bednar, Smitham and Yost','491313582412372','666326727','89 Truax Trail','11195638079');
DESC vendedor;

-- popular tabela produtoVendedor
INSERT INTO produtoVendedor (produto_vendedor_id, vendedor_quantidade)
	VALUES
		(15431,null),
        (22356,null),
        (323456,null);
DESC produtoVendedor;

-- popular tabela produtoPedido
INSERT INTO produtoPedido (pp_produto_id, pp_quantidade, pp_status)
	VALUES 
		(2,null,'Disponível'),
        (1,null,'Sem estoque'),
        (4,null,'Disponível');
DESC produtoPedido;

-- popular tabela estoqueLocal
INSERT INTO estoqueLocal (estoque_local_id, estoque_local_produto_id, estoque_local_local)
	VALUES 
		(7,65,'8400 Laurel Lane'),
        (8,66,'3 Charing Cross Trail'),
        (9,67,'27 Center Center'),
        (10,68,'449 Dahle Junction'),
        (6,69,'2313 Anzinger Terrace');
DESC estoqueLocal;

-- popular tabela produto
INSERT INTO produto (produto_id, produto_nome, produto_class_kids, produto_tipo, produto_feedback, produto_tamanho)
	VALUES 
		(425411,'Fone',false,'Eletrônico','4',null),
        (412342,'Boneca',true,'Brinquedos','3',null),
        (23143,'Camiseta',false,'Vestimenta','5',null),
        (41235,'Sofá',false,'Móveis','2',null),
        (68655,'Fire Stick',false,'Eletrônico','3',null);
DESC produto;

-- popular tabela pagamento
INSERT INTO pagamento (pagamento_id, pagamento_cliente_id, pagamento_tipo, pagamento_limite_disp)
	VALUES
		(15431, 15, 'Boleto', null),
        (22356, 16, 'Boleto', null),
        (323456, 17, 'Cartão', null);
DESC pagamento;

SELECT CONCAT(cliente_Pnome, ' ', cliente_Snome) AS Cliente, pedido_id AS Pedido, produto_nome AS Produto FROM cliente c, pedido p, produto po WHERE c.cliente_id = pedido_cliente_id ORDER BY cliente_Pnome;

SELECT fornecedor_nome as Fornecedor, produto_nome AS Produto, estoque_local AS Local_Estoque FROM fornecedor f, produto p, estoque e ORDER BY fornecedor_nome;

SELECT CONCAT(cliente_Pnome, ' ', cliente_Snome) AS Cliente, cliente_endereço AS Endereço_Cliente, pagamento_tipo AS Pagamento, produto_nome AS Produto, pp_status AS Disponibilidade, produto_class_kids as Kids, produto_tipo as Tipo FROM cliente c, pagamento p, produto po, produtoPedido pp ORDER BY cliente_Pnome;