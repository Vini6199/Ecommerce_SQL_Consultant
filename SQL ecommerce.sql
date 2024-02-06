create database if not exists ecommerce;
use ecommerce;
create table if not exists clients(
	idClient int auto_increment primary key,
    	Fname varchar(20),
    	Minit char(3),
    	Lname varchar(20),
    	CPF char(9),
    	Address varchar(35),
    	constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment = 1;
-- O Address que tinha era insuficiente, tive que tirar e adicionar um novo:
alter table clients drop Address, add Address varchar(255);
alter table clients add PJ char(9), add constraint unique_pj_client unique (PJ);

desc clients;

create table if not exists product(
	idProduto int auto_increment primary key,
    	Pname varchar(10),
    	classification_kids bool default false,
    	category enum('Eletrônicos','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    	avaliação float default 0,
    	size varchar(10)
);

alter table product drop Pname, add Pname varchar(30);

create table if not exists payments(
	idClient int,
    	id_payment int,
    	typePayment enum('Boleto','Cartão','Dois cartões'),
    	isCashPayment BOOL DEFAULT false,
    	limitAvailable float,
    	constraint fk_client_payment foreign key(idClient) references clients(idClient),
    	primary key(idClient, id_payment)
);

create table if not exists orders (
	idOrder int auto_increment primary key,
    	idOrderClient int,
    	ordersStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    	orderDescription varchar(255),
    	sendValue float default 10,
    	payment_cash bool default false,
    	constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
	on update cascade
        on delete set null
);

create table if not exists productStorage(
	idProdStorage int auto_increment primary key,
    	storageLocation varchar(255),
    	quantity int default 0
);

create table if not exists supplier(
	idSupplier int auto_increment primary key,
    	socialName varchar(255) not null,
    	CNPJ char(15) not null,
    	contact char(11),
	constraint unique_supplier unique(CNPJ)
);

create table if not exists seller (
	idSeller int auto_increment primary key,
	SociaName varchar(255) not null,
	CNPJ char(15) not null,
	CPF char(9),
	contact char(11) not null,
	Location varchar(255) not null,
	constraint unique_CNPJ unique(CNPJ),
	constraint unique_CPF unique(CPF)
); 

create table if not exists productSeller(
	idPseller int,
    	idProduct int,
    	prodQuantity int default 1,
    	primary key (idPseller,idProduct),
    	constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    	constraint fk_product_prodSeller foreign key (idProduct) references product(idProduto)
);

create table if not exists productOrder (
	idPOProduct int,
    	idPOorder int,
    	poQuantity int default 1,
    	poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    	primary key (idPOProduct, idPOorder),
    	constraint fk_product foreign key (idPOproduct) references product(idProduto),
    	constraint fk_product_prodOrder foreign key (idPOorder) references orders(idOrder) 
);

create table if not exists storageLocation (
	idLproduct int,
    	idLstorage int,
	location varchar(255) not null,
    	primary key (idLproduct, idLstorage),
    	constraint fk_product_selle foreign key (idLproduct) references product(idProduto),
    	constraint fk_product_stoLocation foreign key (idLstorage) references productStorage(idProdStorage) 
);

create table if not exists productSupplier (
	idPsSupplier int,
    	idPsProduct int,
	quantity int not null,
    	primary key (idPsSupplier, idPsProduct),
    	constraint fk_prodSupplier_Supplier foreign key (idPsSupplier) references supplier(idSupplier),
    	constraint fk_prodSupplier_Product foreign key (idPsProduct) references product(idProduto) 
);
