use ecommerce;
show tables;

insert into Clients (Fname, Minit, Lname, CPF, Address)
	values	('Maria', 'M', 'Silva', 123456789, 'Rua Silva de Prata 29, Carambola - Cidade A'),
			('Matheus', 'O', 'Pimemta', 67489035, 'Rua Silva de Ouro 57, Centro - Cidade A'),
            ('Ricardo', 'F', 'Silva', 781253099, 'Rua Silva de Rubi 788, Carambola - Cidade B'),
            ('Julia', 'S', 'Franca', 628103463, 'Rua Silva de Topázio 5, Centro - Cidade B'),
            ('Kristina', 'R', 'Cunha', 017402658, 'Rua Silva de Diamante 1088, Carambola - Cidade C'),
            ('Isabela', 'V', 'Cruz', 729462955, 'Rua Silva de Cristal 367, Carambola - Cidade C');
            
insert into product (Pname, classification_kids, category, avaliação, size)
	values 	('Fone de ouvido', false, 'Eletrônicos', '4', null),
			('Barbie', true, 'Brinquedos', '3', null),
            ('Body Carters', true, 'Vestimenta', '5', null),
            ('Microfone Vedo', false, 'Eletrônicos', '3', null),
            ('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
            ('Farinha de arroz',false, 'Alimentos', '2', null),
            ('Fire Stick Amazon', false, 'Eletrônicos', '3', null);
	