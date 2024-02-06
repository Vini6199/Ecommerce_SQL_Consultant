use ecommerce;
show tables;
select distinct * from clients;
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values	('Maria', 'M', 'Silva', 123456789, 'Rua Silva de Prata 29, Carambola - Cidade A'),
		('Matheus', 'O', 'Pimemta', 67489035, 'Rua Silva de Ouro 57, Centro - Cidade A'),
            	('Ricardo', 'F', 'Silva', 781253099, 'Rua Silva de Rubi 788, Carambola - Cidade B'),
            	('Julia', 'S', 'Franca', 628103463, 'Rua Silva de Topázio 5, Centro - Cidade B'),
            	('Kristina', 'R', 'Cunha', 017402658, 'Rua Silva de Diamante 1088, Carambola - Cidade C'),
            	('Isabela', 'V', 'Cruz', 729462955, 'Rua Silva de Cristal 367, Carambola - Cidade C');

DELETE from clients where idClient >= 1;

insert into product (Pname, classification_kids, category, avaliação, size)
	values 	('Fone de ouvido', false, 'Eletrônicos', '4', null),
		('Barbie', true, 'Brinquedos', '3', null),
            	('Body Carters', true, 'Vestimenta', '5', null),
            	('Microfone Vedo', false, 'Eletrônicos', '3', null),
            	('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
            	('Farinha de arroz',false, 'Alimentos', '2', null),
            	('Fire Stick Amazon', false, 'Eletrônicos', '3', null);

insert into orders (idOrderClient, ordersStatus, orderDescription, sendValue, payment_Cash) 
	values	(140, default, 'Compra via aplicativo', null, 1),
		(142, default,'Compra via aplicativo', 50, 0),
            	(140, 'Confirmado', null, null, 1),
            	(141, default, 'Compra via web site', 150, 0);
            
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	values	(1,5,2,null),
		(2,5,1,null),
            	(3,6,1,null);

insert into productStorage (storageLocation, quantity) 
	values	('RJ',1000),
		('RJ',500),
            	('SP',10),
            	('SP',100),
            	('SP',10),
            	('Brasília',60);
            
insert into storageLocation (idLproduct, idLstorage, location)
	values	(1,2,'RJ'),
		(2,6,'GO');
            
insert into supplier (SocialName, CNPJ, contact)
	values	('Almeida e Filhos', 123456789011234, '10936592547'),
		('Eletrônicos Silva', 003478340112349, '10416502349'),
            	('Eletrônicos Valma', 473907302383634, '12047385047');
            
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
	values 	(1,1,500),
		(1,2,400),
            	(2,4,633),
            	(3,3,5),
            	(2,5,10);
            
insert into seller (SociaName, CNPJ, CPF, location, contact)
	values	('Tech eletronics', 647291846284628, null, 'RJ', 35467823408),
		('Botique Durgas', 618956109754278, 116894367, 'RJ',78320973567),
            	('Kids Graça', 540988356677706, null, 'SP',11975488344);
            
insert into productSeller (idPseller, idProduct, prodQuantity)
	values	(1,6,80),
		(2,7,10);
  
  select * from orders;
  select * from productOrder;
-- recuperação de pedidos com produto associado
select * from clients as c 
	inner join orders as o on c.idClient = o.idOrderClient
	inner join productOrder as p on p.idPOorder = o.idOrder
    group by idClient;
    
-- Algum vendedor também é fornecedor?
select count(*) from supplier as s inner join seller as v on s.CNPJ = v.CNPJ;

-- Quantos pedidos foram feitos por cada cliente
select count(CPF) as Numero_de_pedidos, idClient, idOrderClient from clients c
 inner join orders o on c.idClient = o.idOrderClient
 group by idClient;
